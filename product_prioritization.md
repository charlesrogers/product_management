# Product Prioritization
The question at hand is the eternal, "What should we build?"  The answer is largely a function of how much value the potential feature will create for the customer & business; this requires understanding the potential users' needs, how much it's worth to them, and the resources required to produce the level of solution required for adoption.
## The Question of Risk
When it comes to prioritizing a product there are some considerations 
+ How confident are you that know what people are trying to accomplish and the tradeoffs they would make?
+ What is the scope of solutions that you would consider? Are you exclusively interested in sustaining innvoations an adjacent features, or are you willing to consider entirely new solution spaces?
If the situation is low risk (e.g. it's a quick feature to build), you can proceed relatively quickly. In those situations where there is considerable risk (either high investment or where failure will be costly), certain steps should be taken to determine whether to proceed. 
<img src="https://user-images.githubusercontent.com/1085160/93369064-ccfb1080-f81c-11ea-9d9b-0eab73aa9498.png" width="400" height="400">

## Process for High-Risk Situations
Determine the [Net Present Value](https://github.com/charlesrogers/product_research/blob/master/research_resources/research_frameworks.md#net-present-value) of each of the solutions.
The calculation is not meant to be exact, but meant to be a way of comparing different options **and** evaluating the core risks that undergird your assumptions.
Over time, you are able to see collect base rates that can be used to improve future estimates.
### Calulation of NPV for Product Features
The basic calculation is as follows:  
Net Present Value = Likelihood to adopt * Number of Users * Incremental Value * Probability of Success 
+ Likelihood to adopt: Either based on an opportunity score, an actual likelihood to adopt score, or a base rate of typical conversion rates for the industry (adjusted up or down, appropriately)
+ Number of users
+ Incremental Value: Average Order Value * Churn Rate * Incremental number of orders * Contribution Margin
  + Churn rate can be replaced with an "outperformance" metric to represent how long it takes for a competitor to duplicate your feature (shorter when [lack of moat/7 Powers](https://github.com/charlesrogers/product_research/blob/master/research_resources/research_frameworks.md#7-powers))
Once you have determined the Net Present Value of the project, compare it to your investment hurdle rate: if it is below other options (and especially not when below your investment hurdle rate) do not proceed with the project.  
Often your product feature will just improve one aspect of your value funnel. You must determine if this feature will have a material impact in the overall funnel, which can be determined by looking at your most constrained step in the funnel. ~~For example, while a feature might double (𝝙100%) your conversion rate from 0.05% to 0.1%, if you only have 500 users, that will only increase your users from ~3 to 5.~~ **This is to be considered only once you've done some optimization on the funnel**
#### Monte Carlo Simulation
Because many of the elements involved in this calculation are likely not very certain (e.g. will involve a decently large range), a Monte Carlo Simulation can be used (as advocated by [Douglas Hubbard in How to Measure Anything](https://github.com/charlesrogers/product_research/blob/master/research_resources/Hubbard-How_to_measure_anything.md#montecarlo-simulation-for-npv-calculations).
## Process for Low-Risk Situations
Some product concepts are low-enough risk that they do not require speaking with users: for example, if you are selling leads and you have devised a solution that would result in better quality and more leads, the only pertinant questions are whether you could:
+ Deliver the proposed value
+ If the user could find the new solution
+ If they could understand it
+ If they would trust it enough to use it  
Each of these potential issues are relatively low-probabiliy, especially if you are making incremental changes and following traditional design conventions.
These lower-risk opportunities should typically reveal themselves as you analyze a conversion rate funnel, which is essentially optimizing an existing flow or feature. The risk of this type of innovation is that you reach a "[local maxima](https://github.com/charlesrogers/product_research/blob/master/research_resources/research_frameworks.md#local-maxima)".
### Things that Don't Need to Be Tested
+ When a product has little adoption risk (eg it's a [sustaining innovation](https://github.com/charlesrogers/product_research/blob/master/research_resources/research_frameworks.md#sustaining-innovations) with little difference other than better performance, then the only question is really "does this perform better/result in better outcomes for the user" than the other options and thus less customer "insight" is required beyond whether it is usable.
+ 
---
### TO FILE

1. Business value
    + What is the overall funnel
     + What are the steps in the funnel
       + What are the individual elements that make up that step of the funnel
   + How much does each facet contribute to the greater conversion rate
   + What is the most significant factor by:
     + Number of users
     + Amount of GMV
     + Room for growth
1. Likelihood to adopt
   + User value can be predicted by various metrics, but primarily Importance, Satisfaction, and Opportunity Scores
     + BATNA: Features x Price...
     + Table stakes: if over 75% of potential users say they are either "very" or "extremely satisfied" with accomplishing an objective then it becomes a required feature to compete in that market.
     + Minimum Acceptable Threshold: Set by the Kano model
1. Feasibility
1. [Defensibility](https://github.com/charlesrogers/product_research/blob/master/research_resources/Helmer-Seven_powers.md)
    + Will this result in a lasting competitive advantage (eg a moat)?

## Level of Focus
When it comes to targeting users, you can priortized based on format-specific features (eg between pedestrians or automobile drives) or within-format differences (male drivers vs female drivers).
