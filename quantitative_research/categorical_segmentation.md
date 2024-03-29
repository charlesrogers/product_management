# Categorical Segmentation
In order to produce prioritized solutions, often we'll employ Categorical Segmentation in order to determine _who_ wants _what_. The main objectives here are to show which types of users would be most amenable to which types of solutions, and then can be [prioritized by their estimated lifetime value](https://github.com/charlesrogers/product_research/blob/master/product_prioritization.md).  
NB: Categorical Segmentation should not produce as high opportunity scores as using the more black-box process done in the traditional [outcome driven innovation process](outcome_driven_innovation.md), but the results will likely be an "interpretable model" that allows you to target potential users based on identifiable factors.

## Categorical Segmentation Process (Easily Interpretable)
We want to determine which differences between users actually correlate with having different needs, or, in other words, which groups have a statistically significant difference in needs.

We do this by splitting categorical factors into two groups based on the hypotheses we had previously formed. 
It can be something as simple as "we think people who are in growing companies will have a greater desire for x". In this case, we might look at number of people hired in the last x year and say if the percent is greater than 10% of the company, they are in a growth stage. Everyone else (above a certain employee size) would be in a mature phase.

We then calculate the importance, satisfaction, and opportunity scores for those 2 groups. The scores are taken and compared via the Mann Whitney test.

Why Mann-Whitney? Well, we used this tool: [Statistical Tests Interactive Tool](https://datatricks.co.uk/statistical-tests-in-r), and it said the Mann-Whitney was the right test for our formerly-categorical-data-but-now-interval data:
>The Mann-Whitney test is a non-parametric test that allows two unpaired samples to be compared without making the assumption that values are normally distributed.

We calculate the opportunity scores for each group by factor (eg large vs small users) then compare the difference between those two groups with the Mann-Whitney test. If the P-Value is less than 0.05, we determine the medians of samples of the two different factors are not identical and thus it is a signficicant factor in segmentation.

In our previous example, if we found the P-Value for a Mann-Whitney test comparing the opportuity scores between growth companies and mature companies was 0.009, we have strong evidence that those groups actually have different needs and it's _not_ just a slight difference that could be explained by normal variation from two samples of the essentially the same type of user. And again, now in plain English: that growth companies and mature companies don't really have differences in the objectives we measured).
 

## Maximum Segmentation Process (Less- Easily Interpretable)
1. Determine which factors to use for segmentation are: 
    1. Identifiable in the population (whether to advertisers or in own database)
    1. Likley to predict the largest variance between user groups (eg 
        1. These are largely baesd off the hypotheses developed in 1-1 interviews. For example, you may have discovered that when companies make their first specialized hire they now have much a greater need to remain in sync across teams, and you saw that across different interviews and you could even test it out of sample (when you did a new interview and found the company had made a specialized hire, you ask "how did that affect your need to stay in sync" and they look at you like "how did you know!?" then you know you have a pretty strong signal.
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

## How to Group Objectives
Users' objectives can be grouped in various ways, but perhaps the two most interesting are:
1. What they are trying to achieve:
   + Minimize time
   + Minimize cost
   + Minimize mistakes
   + *Minimize risk likely shouldn't be included as each of the above is could be considered a type of risk*
2. In which stage of the process they are found
    + Evaluating
    + Monitoring




---
## Cut Copy
### Introduction
What we should focus on is a function of how much value it will create for the customer and business, which requires understanding the customers' needs, how much they are willing to pay, and the resources required to produce the level of solution required for adoption.
At this stage we are determining where the largest opportunities from the demand side of the equation (i.e. what the buyers want).
