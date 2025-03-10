<p align="center">
  <img src="https://github.com/Dympo/dympo/blob/main/images/DSC_58390.jpg?raw=true" alt="Florian Dumas - Data Analyst | SQL Developer" width="40%" style="margin-right: 10px;" />
  <img src="https://github.com/Dympo/dympo/blob/main/images/DSC_4211.JPG?raw=true" alt="Second Image" width="40%" />
</p>

# 🏍️ Distance For A Chance Project

## Objective

This project is used to showcase my Excel skills : extracting information from raw data, cleaning data, and organizing with some conditional formatting.

## Context

In 2015, I embarked on a solo motorcycle adventure around the world to raise money for a school in Indonesia. On my website at the time, I updated my itinerary daily recording the departure city + country, arrival city + country, and the distance covered each day.

The goal of this project is to transform the raw data into a structured format suitable for visualization and further analysis.

## Sheet by Sheet 

# Sheet 1 : Raw Info

This Sheet contains all the raw data obtained from the old website.

# Sheet 2 : Separating Data

Here, we use formulas (MID, FIND) to try and separate the raw data into categories						
Formula in Column B extracts the text before the first space.		
"=LEFT(A10,FIND(" ",A10)-1)"				
Formula in Column C extracts the text between the first space and the opening parenthesis, excluding the space and the characters just before the parenthesis.		"=MID(A10,FIND(" ",A10)+1,FIND("(",A10)-FIND(" ",A10)-2)"				
Formula in Column D extracts the text between the parentheses, excluding the parentheses themselves.		
"=MID(A10,FIND("(",A10)+1,FIND(")",A10)-FIND("(",A10)-1)"				
Formula in Column E extracts the text between the dash (–) and the first opening parenthesis, adjusting to exclude the dash and a couple of characters near it.		"=MID(A10,FIND("–",A10)+2,FIND("(",A10,FIND("–",A10))-FIND("–",A10)-3)"				
Formula in Column F extracts the text between the parentheses that are after the dash (–) excluding the parentheses themselves.		"=MID(A10,FIND("(",A10,FIND("–",A10))+1,FIND(")",A10,FIND("(",A10,FIND("–",A10)))-FIND("(",A10,FIND("–",A10))-1)"				
Formula in Column G extracts the text between the colon (:) and the "kms", excluding the colon and the "kms" part.		
"=MID(A10,FIND(":",A10)+2,FIND("kms",A10)-FIND(":",A10)-3)				
