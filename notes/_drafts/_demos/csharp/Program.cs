using System;
using System.Collections.Concurrent;
using System.Diagnostics;
using System.Threading;
using System.Threading.Tasks;
using Azure.Messaging.EventHubs;
using Azure.Messaging.EventHubs.Processor;
using Azure.Storage.Blobs;

namespace processor_hello_world
{
    class Program
    {
        static async Task Main(string[] args)
        {
            Console.WriteLine("Hello, World!");
            var storageConnectionString = "BlobEndpoint=https://maustorew23.blob.core.windows.net/;QueueEndpoint=https://maustorew23.queue.core.windows.net/;FileEndpoint=https://maustorew23.file.core.windows.net/;TableEndpoint=https://maustorew23.table.core.windows.net/;SharedAccessSignature=sv=2021-12-02&ss=bfqt&srt=sco&sp=rwdlacupiytfx&se=2023-04-22T05:22:31Z&st=2023-04-19T21:22:31Z&spr=https&sig=3rioYIMCpJkNsuUXvJNTcpG%2BnqYsfHrhiO54J6hiYwM%3D";
            var blobContainerName = "checkpoint-container";

            var eventHubsConnectionString = "Endpoint=sb://ihsuprodytres003dednamespace.servicebus.windows.net/;SharedAccessKeyName=service;SharedAccessKey=9gPygWs4dAxgKf1BwTwQDFEDLafrw9aZhEojYUjWhk8=;EntityPath=iothub-ehub-class-sec1-24843152-188c078a20";
            var eventHubName = "iothub-ehub-class-sec1-24843152-188c078a20";
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
                    byte[] eventBody = args.Data.EventBody.ToArray();
                    Debug.WriteLine($"Event from partition {partition} with length {eventBody.Length}.");
                    Console.WriteLine($"Event from partition {partition} with length {eventBody.Length}.");
                    Console.WriteLine(args.Data.EventBody);

                    int eventsSinceLastCheckpoint = partitionEventCount.AddOrUpdate(
                        key: partition,
                        addValue: 1,
                        updateValueFactory: (_, currentCount) => currentCount + 1);

                    Console.WriteLine($"Events since last checkpoint: {eventsSinceLastCheckpoint.ToString()}");
                    

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
                cancellationSource.CancelAfter(TimeSpan.FromSeconds(10));

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
