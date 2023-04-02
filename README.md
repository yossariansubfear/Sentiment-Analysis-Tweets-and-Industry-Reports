# Sentiment-Analysis-Document-Level-and-Sentence-Level

The project tries to analyse sentiments at the following two levels
1. Document Level
2. Sentence Level

For document level analysis, we take the industry outlook report of two independent companies in the airline sector in India. We have taken the reports published by ICRA and CMIE in the third quarter of 2018.

The analysis was done in R and the code for the same is available in the same folder. The results of the analysis are given below:
The ICRA report starts with a strong positive note, discusses some of the issues and then finishes in a slightly positive note. The overall sentiment of the ICRA report is 42.65.

On the other hand, even though the CMIE report starts with a strong positive sentiment similar to ICRA report it slowly turns negative and closes with a moderately weak sentiment. Because of this, the overall sentiment of the CMIE report is a meagre 9.1 as against the 42.65 of ICRA.

For sentence level analysis, we took the event of RBI Governor Urjit Patel’s resignation and the appointment of Shaktikanth Das as the next Governor of RBI. For this purpose, we mined tweets from Twitter on the days of the resignation of the former and the appointment of the latter. Data was cleaned and the sentiment of all the tweets were valued using a English lexicon. 

The sentiment sums for both the Governors were -390.75 and -204.3 for Urjit Patel and Shakthikanth Das respectively. This shows very strong negative feeling towards the resignation of Urjit Patel which was reflected in the markets the next day as NIFTY opened with a drop of 500 points. Even though to a lesser extent, there is a negative feeling towards the appointment of Shakthikanth Das and as seen from the word cloud many of the tweets were in Hindi, which is not readable by default in R. Avoiding the Hindi tweets would’ve made the analysis easier, but including the same and if possible using a Hindi Lexicon can have a greater impact by having a strong information depth. 
