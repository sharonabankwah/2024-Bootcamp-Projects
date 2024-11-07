""" Create a console app that interacts with an API of your choice, gets some data out of it and does a meaningful transformation. You can pick one of the suggested APIs which are free and beginner-friendly, this will not impact creativity points. Make sure your API is free to use and do not share your private access key.

Remember to come up with a unique creative problem or scenario! """

# Problem: Imagine you want to travel to a new city, but you don't know where to go. To help narrow down your research, this program will ask you two important questions that will give you city recommendations based on your responses.

import requests
# Datetime is a built-in function in Python which outputs the current date and time, it doesn't require installation
from datetime import datetime

# OpenWeather API key required
# Visit https://openweathermap.org/api, click on 'Sign In' at the top of the page, click on 'Create an Account', fill out form with personal information, verify your details via email and revisit site to 'Sign In'
# Hover over your email address at the top of the page, click on 'My API keys', under 'Create key' click on 'Generate', you can choose an API key name or keep it as default
# Put your API key in between the '' to activate the api_key variable
api_key = ''

# A dictionary that stores the name of cities split into 6 continents, Antarctica not included as it doesn't have any cities
cities_by_continent = {
    "Europe": ["London", "Amsterdam", "Paris", "Lisbon", "Barcelona", "Rome", "Athens", "Berlin", "Budapest", "Moscow", "Istanbul"],
    "Asia": ["Beijing", "Shanghai", "Tokyo", "Bangkok", "Seoul", "Mumbai", "Delhi", "Dubai", "Abu Dhabi", "Beirut", "Jerusalem"],
    "Africa": ["Accra", "Lagos", "Cairo", "Nairobi", "Cape Town"],
    "North America": ["New York", "Los Angeles", "Chicago", "Houston", "Toronto", "Mexico City", "Miami", "Atlanta", "Vancouver", "Detroit", "Montreal", "Washington", "Seattle", "Havana", "Kingston", "Bridgetown", "San Juan", "Port-au-Prince", "Willemstad", "Nassau"],
    "South America": ["Buenos Aires", "Rio De Janeiro", "Lima", "Santiago", "Sao Paulo", "Bogota", "Brasilia", "Belo Horizonte", "Cali"],
    "Oceania": ["Sydney", "Melbourne", "Brisbane", "Perth", "Auckland", "Gold Coast", "Canberra"],
}

# A dictionary that stores temperature ranges split into 3 common adjectives
temperature_ranges = {
 "hot": (30, 55), # Temperatures between 30°C and 55°C will be considered hot
 "warm": (15, 30), # Temperatures between 15°C and 30°C will be considered warm
 "cold": (-10, 15) # Temperatures between -10°C and 15°C will be considered cold
}

# A function that asks the user their weather and continent preferences
# Checks the validity of the user input and returns information based on whether they match the dictionary keys
def user_input_validity():
    while True:
        user_input_preferred_weather = input("What is your preferred weather condition? Please select hot, warm or cold: ").lower()
        if user_input_preferred_weather not in temperature_ranges:
            print("Sorry, invalid weather input.")
            continue

        user_input_preferred_continent = input("Which continent would you like to travel to? Please select Africa, Asia, Europe, North America, Oceania or South America: ")
        if user_input_preferred_continent not in cities_by_continent:
            print("Sorry, invalid continent input.")
            continue

        return user_input_preferred_weather, user_input_preferred_continent

# Calls the function and assigns the user input to the variables
user_input_preferred_weather, user_input_preferred_continent = user_input_validity()

# Assigns the listed cities from the continent they chose to the cities variable
cities = cities_by_continent[user_input_preferred_continent]

# Initialises the variable and sets to False before checking if any city recommendations are found in the loop
city_recommendation_found = False

# Outputs the current date and time
date_and_time = datetime.now()
# Slices the date_and_time list into a readable format
readable_date_and_time = str(date_and_time)[:16]
results = [f"Current date and time: {readable_date_and_time} \n"]

# OpenWeather API Request
# A for loop that iterates over each city in the dictionary
for city in cities:
    url = f"https://api.openweathermap.org/data/2.5/weather?q={city}&appid={api_key}&units=metric"
    response = requests.get(url)
    data = response.json()

    # Gets weather data from OpenWeather
    name_of_city = data['name']
    weather = data['weather'][0]['description']
    temperature = data['main']['temp']

    # Assigns the minimum and maximum temperatures of the user's weather preference to the variables
    minimum_temperature, maximum_temperature = temperature_ranges[user_input_preferred_weather]

    # Prints the results if program can recommend a city that meets the user's weather preferences
    if minimum_temperature <= temperature <= maximum_temperature:
        results.append(f"Your recommended city break: {name_of_city}, it's {user_input_preferred_weather} and has a temperature of {temperature}°C!")
        results.append(f"\nWeather: {weather}")
        results.append(f"\n")
        city_recommendation_found = True

# Prints an unsuccessful message if program can't recommend any cities based on user's weather preferences
if not city_recommendation_found:
    results.append(f"Sorry, we couldn't find any cities with {user_input_preferred_weather} weather in {user_input_preferred_continent}.")

# Writes the result of this program into a text file
with open('city_recommendations.txt', 'w') as text_file:
    for line in results:
        text_file.write(line)
