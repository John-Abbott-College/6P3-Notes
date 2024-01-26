import random
import asyncio
from time import sleep

print(f"Right now the value of __name__ is :{__name__}")


class Timer:
    def __init__(self, minutes: int, seconds: int) -> None:
        """Constructor for a timer that counts down

        :param int minutes: minutes to count down
        :param int seconds: seconds to count down
        """
        self._total_secods = minutes * 60 + seconds

    async def fun_countdown(self, emoji_list: list[str]) -> None:
        for i in range(self._total_secods, 0, -1):
            random_emoji = random.choice(emoji_list)
            print(i, random_emoji)
            # sleep(1)
            await asyncio.sleep(1)

    async def countdown(self, task_name: str) -> str:
        for i in range(self._total_secods, 0, -1):
            print(task_name, i)
            await asyncio.sleep(1)
            # sleep(1)
        return "my secrete message"

    def get_input(self):
        text = input()
        print(text)


async def main():
    timer_1 = Timer(0, 3)
    timer_2 = Timer(0, 5)

    emoji_list = ["🤞", "🐞", "🔌", "👎"]

    countdown_task_1 = asyncio.create_task(timer_1.countdown("task1"))
    countdown_task_2 = asyncio.create_task(timer_2.fun_countdown(emoji_list))

    return_value_2 = await countdown_task_2
    return_value_1 = await countdown_task_1
    print(return_value_1)
    print(return_value_1)


if __name__ == "__main__":
    asyncio.run(main())
