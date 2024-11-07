# City Weather Recommendation Console App

This console application recommends travel destinations based on your preferred weather and continent, leveraging the OpenWeather API for real-time weather data. Simply select a weather type (hot, warm, or cold) and a continent, and the app will suggest cities that match your preferences.

## Features
- **User-Friendly Input**: Prompted questions on preferred weather conditions and continent.
- **Weather-Based Recommendations**: Provides city suggestions based on live temperature data and weather conditions.
- **Current Date & Time Display**: Displays the date and time of the recommendation.
- **Text File Output**: Saves the results to a `city_recommendations.txt` file for easy access and review.

## Setup & Requirements
- **Python 3.x**: Make sure Python is installed on your system.
- **Requests Library**: Install with `pip install requests` if not already available.

### OpenWeather API Key
1. Register for a free API key from OpenWeather: [OpenWeather API](https://openweathermap.org/api).
2. Replace the placeholder `api_key = ''` in the script with your actual API key:
   ```python
   api_key = 'YOUR_API_KEY'

### Usage
**1. Run the Program:** Launch the script from a console:

```python city_recommendation.py```

**2. Answer Questions:** 
- Enter your preferred weather condition (hot, warm, or cold).
- Choose a continent from the options provided (e.g., Europe, Asia).

**3. View Recommendations:**
- If matching cities are found, they will be printed and saved to city_recommendations.txt.
- If no cities match your preferences, a message will indicate this.

### Code Structure
**- User Input Validation:** The function user_input_validity() validates and captures user preferences.
**- City Data by Continent:** Pre-defined city lists for each continent.
**- Temperature Ranges:** Temperature bands (hot, warm, cold) define the range for suitable cities.
**- OpenWeather API Integration:** Retrieves current weather for each city in the chosen continent and filters based on temperature.
**- Text File Output:** Results are saved in city_recommendations.txt, including date and time.

### Example Output
Example output if a city is found:
```Current date and time: 2023-11-07 14:30
Your recommended city break: Barcelona, it's warm and has a temperature of 22°C!
Weather: clear sky```

Example output if no city matches:

```Sorry, we couldn't find any cities with warm weather in North America.```

### Notes 
- This project assumes that the OpenWeather API access key is private. Do not share your API key.
- For personal use only; the OpenWeather free plan may have rate limitations.

