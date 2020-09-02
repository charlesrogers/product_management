# Categorical Segmentation
In order to produce prioritized solutions, often we'll employ Categorical Segmentation in order to determine _who_ wants _what_. The main objectives here are to show which types of users would be most amenable to which types of solutions, and then can be [prioritized by their estimated lifetime value](https://github.com/charlesrogers/product_research/blob/master/product_prioritization.md).  
NB: Categorical Segmentation should not produce as high opportunity scores as using an "outcome driven innovation" process, but the results will likely be an "interpretable model" that allows you to target potential users based on identifiable factors.
## Process
1. Determine which factors to use for segmentation 
    1. Identifiable in the population (whether to advertisers or in own database)
    1. Likley to predict the largest variance between user groups
1. Determine what types of simplification to use for each factor
    1. Turning x-point scales into <x-point scales can be difficult. How do we know when to reduce the number down from, lets say 6, to 3 or 2 groups?
1. Calculate Importance, Satisfaction, and Opportunity scores by Segment (user group)
1. Determine which segments are most useful by measuring which segments have the greatest differences
    1. Graph opportunity scores
        + ~~To prioritize for features, working by stage in the process _could_ be useful if the stages are parts of different products (unlikely)~~
    1. Determine the rankings at the following levels:
        1. Segment level: Determine which objectives matter (>10 opportunity score) for each segment
        1. Objective theme level (on-time performance, reduction of errors, decision making)
        1. Objective level: Determine which segments matter (above a certain level OR highest) for each objective
            + Average rank Per segment
            + 
        1. Stage by Segment level: Determine which objectives matter at each stage of the user process
### Which Segments Matter
How should we measure which segments provide useful information about differences in users' needs?
We want to determine a few things:
+ Which segments don't contain useful information, or in other words, have a high correlation between their objectives
+ Which segments are basically the same as other segments...
    + Should check at the indiviudal level
#### PCA

#### Correlation

#### Mutual Information


---
## Cut Copy
### Introduction
What we should focus on is a function of how much value it will create for the customer and business, which requires understanding the customers' needs, how much they are willing to pay, and the resources required to produce the level of solution required for adoption.
At this stage we are determining where the largest opportunities from the demand side of the equation (i.e. what the buyers want).
