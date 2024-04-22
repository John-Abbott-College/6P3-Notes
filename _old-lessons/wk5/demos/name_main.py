from timer import Timer 
import asyncio

print('Inside name_main.py, variable __name__ is called ', __name__)

async def main():
    timer = Timer(minutes=0, seconds=5)

    await timer.countdown("task1")

if __name__ == "__main__":

    asyncio.run(main())