# New ODI Process
## Data cleaning

### Quality checks
+ Check to see if they pass both trap questions
+ Calculate the distribution of responses for outcomes (CAN BE DONE together, or for each of importance and satisfaction)
  + Determine % of each number selected (1-5) per respondent
  + Sum of the squares of the distribution where each of the responses is selected at 20% (1/5)
  + Upper limit of 98.2% (purely) random and lower bound of 42.2% (one selection)
+ Time to complete
++ Count words
++ Determine maximum words per minute (use 400 WPM)
++ Select a threshold (800/400pm) 15min is the minimum
*Ideally only use respondents who pass all tests*
## Calculate importance and satisfaction score for each respondent for each individual outcome
+ Calculate the individual opportunity scores (IOS) for K-Means clustering (and original process only uses this individual opportunity scores for k-mean clustering)
### Original Process:
+ (2x importance - satisfaction) for the individual opportunity score: this way only has a range of 12 which might make it harder for the algorithm 
### New Process
+ Under the assumption that a better segmentation is MORE separated and the needs are more concentrated—objective is to get more separated segments so create a broader range AND avoid duplicate numbers (prioritize importance over satisfaction). For example is it more important to pick Importance > Satisfaction or Satisfaction > Importance (we chose the former).
+ Write a index-index to find the column, row for each of the below data points
+ If you want more dispersion, double each number in the table.
+ If anything is >= 7.5 satisfaction, it becomes table stakes
## Segmentation:
*Select only those users who completed the survey*
### Principal Component Analysis
This is used to select a group of outcomes that are being answered in the same way/that people care about them in a similar way.
#### Original Process
 +In PCA, use only importance ratings
 + In SPSS: Use "Dimension reduction > Factor" (It seems that in SPSS, the total initial Eignen value needs to be at least 1)
+  Select all the questions that correspond to Importance outcomes
+ Select "Rotation > Varimax" and check "Rotated solution" and Run. This will produce the factors that explain the variance of the dataset. Will often look at the first principal component to see what is going on there
+ Look at the "Rotated Component Matrix" which takes the factors and tells how correlated each outcome is with that factor
+ Paste the Rotated Component Matrix into Excel for all components, on the x-axis are the components and on the y-axis are the outcomes
+ For each need, pick a component they "belong to" by looking at each outcome, find the components is the highest and return the component number and that places the outcome in the group
+ Look at the variance of each outcome (Original Process calculates Kurtosis of the individual opportunity scores [here you have to merge data from two sources]; Victor uses the SD of the juiced opportunity score)
+ Find the Max Loading score for each opportunity (which is effectively how good a representative that opportunity is for each factor group as it is the correlation)
+ To select one opportunity per group, select the best representative of that factor group, select one with a high loading score AND high variance (to get more dispersion)
++ To select a "Pick Factor", select a factor with a loading score of >= .5 WHICH have the largest variation OR (using Kurtosis) the most negative Kurtosis Score
++ Skip factor groups that are too small (V uses groups with at least 3 factors) -- The general heuristic is to select the smallest number of factors that matter
+ Create the final list of outcomes (the Pick Variables)
### K-Means Clustering
+ Take the individual opportunity scores for the (shorter) list of Pick Factors
+ Run K-Means with 2-5 groups
+ K-Means will return which segment the user is in for each of the different number of groupings
++ The K-Means algorithm takes all the individual opportunity scores BUT we when we create landscape, we look at the sample level (we don't use the same metrics).
+++ We could find a better way to calculate importance/satisfaction score and use that for the K-Means.
+ HOW TO SELECT which grouping to use
++ Graph the segments
++ Compare the 2, 3, and 4-segment solutions
+++ Look at the overlap in the graph
++++ Save them to compare to other clusters and New Process vs Original Process
++ Compared over-served and under-served by segments
### Logistic Regression
+ Now run logistical regression for each of their
+ Look at those data points that are statistically significant at the 90%
+ Write the initial observations next to what we are seeing
+ Questions
++ Should we look at factors that increase/decrease in step?
++ Look where there is a significant variance at X confidence level?
++ Should we graph these differences?
### New Process
1. V tested only using importance ratings, then again with individual opportunity scores. The latter provided greater dispersion, but one could focus more on what is actionable, addressable, etc..
