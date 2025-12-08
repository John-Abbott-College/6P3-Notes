import time
import aiohttp
import asyncio
import random
import requests

MAX_POKEMON_ID = 251


async def main():
    async with aiohttp.ClientSession('https://pokeapi.co') as session:
        # poke_id = random.randint(1, MAX_POKEMON_ID)
        # print(poke_id)
        get_requests = []

        # ===== Example 1: Create a list of awaitables and gathering them ======

        # for _ in range(5):
        #     get_requests.append(session.get(f'/api/v2/pokemon/{random.randint(1,MAX_POKEMON_ID)}'))

        # response_list = await asyncio.gather(
        #     # *[session.get(f'/api/v2/pokemon/{random.randint(1,MAX_POKEMON_ID)}') for i in range(5)]
        #     *get_requests
        # )

        # for response in response_list:
        #     pokemon = await response.json()
        #     print(pokemon['name'])

        # ====== Example 2: async requests done by aiohttp =====

        # This method seems synchronous but aiohttp runs asynchronously behind the scenes

        for _ in range(5):
            async with session.get(f'/api/v2/pokemon/{random.randint(1, MAX_POKEMON_ID)}') as resp:
                pokemon_json = await resp.json()
                print(pokemon_json['name'])


        # ===== Example 3: Synchronous http with library `requests`

        # for _ in range(5):
        #     response = requests.get(f'https://pokeapi.co/api/v2/pokemon/{random.randint(1, MAX_POKEMON_ID)}')
        #     pokemon = response.json()
        #     print(pokemon['name'])

start_time = time.perf_counter()
asyncio.run(main())
print(f'Script took: {time.perf_counter() - start_time}')
