<p align="center">
  <img src="https://github.com/Dympo/dympo/blob/main/images/DSC_58390.jpg?raw=true" alt="Florian Dumas - Data Analyst | SQL Developer" width="40%" style="margin-right: 10px;" />
  <img src="https://github.com/Dympo/dympo/blob/main/images/DSC_4211.JPG?raw=true" alt="Second Image" width="40%" />
</p>

# 🏍️ Distance For A Chance Project

Link to the [EXCEL FILE](https://github.com/Dympo/dympo/blob/main/Portfolio-Guide/Excel/Distance%20For%20A%20Chance/DFAC%20WorkBook.xlsx)


## Objective

This project is used to showcase my Excel skills : extracting information from raw data, cleaning data, and organizing with some conditional formatting.

## Context

In 2015, I embarked on a solo motorcycle adventure around the world to raise money for a school in Indonesia. On my website at the time, I updated my itinerary daily recording the departure city + country, arrival city + country, and the distance covered each day.

The goal of this project is to transform the raw data into a structured format suitable for visualization and further analysis.

## Sheet by Sheet 

### Sheet 1 : Raw Info

This sheet contains all the raw data obtained from the old website.

![DFAC Image](https://github.com/Dympo/dympo/blob/main/images/DFAC_1.png?raw=true)

### Sheet 2 : Separating Data

This sheet is focused on extracting structured data from raw text using Excel formulas. It breaks down a string containing city names, countries, and distances into separate columns. The formulas isolate key elements such as departure location, destination, country names, and distances by leveraging MID, FIND, and LEFT functions. This allows for easier analysis and visualization of the data.

![DFAC Image](https://github.com/Dympo/dympo/blob/main/images/DFAC_2.png?raw=true)

### Sheet 3 : Sorting by Date

This section focuses on converting a text-based date into a proper date format (DD-MM-YY) to allow for chronological sorting. The formula extracts the day, month, and year from the original string using RIGHT, MID, and LEFT functions and restructures them into a valid date format that Excel recognizes.

![DFAC Image](https://github.com/Dympo/dympo/blob/main/images/DFAC_3.png?raw=true)

### Sheet 4 : Cleaning Up

This section organizes data by sorting it, renaming the "Date New" column to "Date," and applying conditional formatting to highlight rows with "[" or "]" in column C, signaling exclusion from distance analysis. KMS values are also converted to a numeric format for proper calculations.

![DFAC Image](https://github.com/Dympo/dympo/blob/main/images/DFAC_4.png?raw=true)

### Sheet 5 : Final

Same as Sheet 4 but clean without the notes. Ready to be exported if needed.

![DFAC Image](https://github.com/Dympo/dympo/blob/main/images/DFAC_5.png?raw=true)
