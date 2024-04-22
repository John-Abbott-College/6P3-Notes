﻿using System;
using System.Collections.Concurrent;
using System.Diagnostics;
using System.Threading;
using System.Threading.Tasks;
using Azure.Messaging.EventHubs;
using Azure.Messaging.EventHubs.Processor;
using Azure.Storage.Blobs;

namespace eventhub_demo
{
    class Program
    {
        static async Task Main(string[] args)
        {
            Console.WriteLine("Hello, World!");
            var storageConnectionString = "DefaultEndpointsProtocol=https;AccountName=blogstoragedemo2;AccountKey=BDBRxegVCGNlIPbZcbRdcFh1ntUKMdGpe6Q0bw4aC6CUnDp8iPPCLt96Dj+ITczhahUcQhjm+1rn+AStnwGdZw==;EndpointSuffix=core.windows.net";
            var blobContainerName = "checkpoint-blob";

            var eventHubsConnectionString = "Endpoint=sb://ihsuprodytres013dednamespace.servicebus.windows.net/;SharedAccessKeyName=service;SharedAccessKey=Xi3+S4JNsum6Bl7EFWF86jXrfh2FKsf5VeD0J9lu+Ik=;EntityPath=iothub-ehub-hub-w23-24963020-33d371f2d6";
            var eventHubName = "iothub-ehub-hub-w23-24963020-33d371f2d6";
            var consumerGroup = "$Default";

            var storageClient = new BlobContainerClient(
                storageConnectionString,
                blobContainerName);

            var processor = new EventProcessorClient(
                storageClient,
                consumerGroup,
                eventHubsConnectionString,
                eventHubName);

            var partitionEventCount = new ConcurrentDictionary<string, int>();

            async Task processEventHandler(ProcessEventArgs args)
            {
                try
                {
                    // If the cancellation token is signaled, then the
                    // processor has been asked to stop.  It will invoke
                    // this handler with any events that were in flight;
                    // these will not be lost if not processed.
                    //
                    // It is up to the handler to decide whether to take
                    // action to process the event or to cancel immediately.

                    if (args.CancellationToken.IsCancellationRequested)
                    {
                        return;
                    }

                    string partition = args.Partition.PartitionId;
                    // byte[] eventBody = args.Data.EventBody.ToArray();
                    Debug.WriteLine($"Event from partition {partition} with length {args.Data.EventBody}.");

                    int eventsSinceLastCheckpoint = partitionEventCount.AddOrUpdate(
                        key: partition,
                        addValue: 1,
                        updateValueFactory: (_, currentCount) => currentCount + 1);

                    if (eventsSinceLastCheckpoint >= 50)
                    {
                        await args.UpdateCheckpointAsync();
                        partitionEventCount[partition] = 0;
                    }
                }
                catch
                {
                    // It is very important that you always guard against
                    // exceptions in your handler code; the processor does
                    // not have enough understanding of your code to
                    // determine the correct action to take.  Any
                    // exceptions from your handlers go uncaught by
                    // the processor and will NOT be redirected to
                    // the error handler.
                }
            }

            Task processErrorHandler(ProcessErrorEventArgs args)
            {
                try
                {
                    Debug.WriteLine("Error in the EventProcessorClient");
                    Debug.WriteLine($"\tOperation: {args.Operation}");
                    Debug.WriteLine($"\tException: {args.Exception}");
                    Debug.WriteLine("");
                }
                catch
                {
                    // It is very important that you always guard against
                    // exceptions in your handler code; the processor does
                    // not have enough understanding of your code to
                    // determine the correct action to take.  Any
                    // exceptions from your handlers go uncaught by
                    // the processor and will NOT be handled in any
                    // way.
                }

                return Task.CompletedTask;
            }

            try
            {
                using var cancellationSource = new CancellationTokenSource();
                cancellationSource.CancelAfter(TimeSpan.FromSeconds(30));

                processor.ProcessEventAsync += processEventHandler;
                processor.ProcessErrorAsync += processErrorHandler;

                try
                {
                    await processor.StartProcessingAsync(cancellationSource.Token);
                    await Task.Delay(Timeout.Infinite, cancellationSource.Token);
                }
                catch (TaskCanceledException)
                {
                    // This is expected if the cancellation token is
                    // signaled.
                }
                finally
                {
                    // This may take up to the length of time defined
                    // as part of the configured TryTimeout of the processor;
                    // by default, this is 60 seconds.

                    await processor.StopProcessingAsync();
                }
            }
            catch
            {
                // The processor will automatically attempt to recover from any
                // failures, either transient or fatal, and continue processing.
                // Errors in the processor's operation will be surfaced through
                // its error handler.
                //
                // If this block is invoked, then something external to the
                // processor was the source of the exception.
            }
            finally
            {
                // It is encouraged that you unregister your handlers when you have
                // finished using the Event Processor to ensure proper cleanup.  This
                // is especially important when using lambda expressions or handlers
                // in any form that may contain closure scopes or hold other references.

                processor.ProcessEventAsync -= processEventHandler;
                processor.ProcessErrorAsync -= processErrorHandler;
            }
        }
    }
}
