# Product Prioritization
The question at hand is the eternal, "What should we build?"  
What we should build is a function of how much value it will create for the customer & business; this requires understanding the customers' needs, how much they are willing to pay for the solution, and the resources required to produce the level of solution required for adoption.
## Decision Risk
When it comes to prioritizing a product there are some considerations 
+ How confident are you that know what people are trying to accomplish and the tradeoffs they would make?
+ What is the scope of solutions that you would consider? Are you interested in only doing sustain innvoations, adjacent features, or entirely new solution spaces.
If the siuation is low risk, you can proceed relatively quickly. In those situations where there is considerable uncertainty
## Process for High-Risk Situations
Determine the net present value of each of the solutions
The calculation is not meant to be exact, but meant to be a way of comparing different options and evaluating your assumptions.  
Over time, you are able to see collect base rates that can be used to improve future estimates.
### Calulation of NPV for A Features
+ Likelihood to adopt * Number of Users * Incremental Value =
  + Likelihood to adopt: either based on an opportunity score, an actual likelihood to adopt score, or a base rate of typical conversion rates for the industry (adjusted up or down, appropriately)
  + Number of users
  + Incremental Value: Average Order Value * Churn Rate * Incremental number of orders * Contribution Margin
#### Montecarlo Simulation
Because many of the elements involved in this calculation are likely not very certain (e.g. will involve a decently large range), a Montecarlo Simulation can be used (as advocated by [Douglas Hubbard in How to Measure Anything](https://github.com/charlesrogers/product_research/blob/master/research_resources/Hubbard-How_to_measure_anything.md#montecarlo-simulation-for-npv-calculations).
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
Prioritization is a combination of business value * user value * what is feasible * what will create long-term value above the cost of capital
1. Business value
    + What is the overall funnel
     + What are the steps in the funnel
       + What are the individual elements that make up that step of the funnel
   + How much does each facet contribute to the greater conversion rate
   + What is the most significant factor by:
     + Number of users
      + Amount of GMV
      + Room for growth
1. User value
   + Importance, Satisfaction, Opportunity Scores
     + BATNA
     + Table stakes
     + Minimum Acceptable Threshold
1. Feasibility
1. [Defensibility](https://github.com/charlesrogers/product_research/blob/master/research_resources/Helmer-Seven_powers.md)
    + Will this result in a lasting competitive advantage (eg a moat)?

## Level of Focus
When it comes to targeting users, you can priortized based on format-specific features (eg between pedestrians or automobile drives) or within-format differences (male drivers vs female drivers).
