import asyncio


async def countdown(task_name: str, seconds: int)-> None:

    for i in range(seconds, 0, -1):
        print(task_name, i)
        await asyncio.sleep(1)
    print("done!")


async def main():
    # Running and awaiting multiple coroutines
	taskA = asyncio.create_task(countdown("task A", 3))
	taskB = asyncio.create_task(countdown("task B", 2))

	# Doing something else while they run
	await asyncio.sleep(1)
	print("Everything, everywhere, all at once")

	# Awaiting for tasks to complete before ending main()
	# Try running this code without awaiting
	await taskA
	await taskB

    # await asyncio.gather(
    #     countdown("task A", 4),
    #     countdown("task B", 3)
    # )
	# await asyncio.sleep(1)
	# print("Everything, everywhere, all at once")


asyncio.run(main())


""" Output
simple count 4
simple count 3
simple count 2
simple count 1
done!
"""
