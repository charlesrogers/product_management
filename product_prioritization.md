# Product Prioritization
The question at hand is the eternal, "What should we build?"  The answer is largely a function of how much value the potential feature will create for the customer & business; this requires understanding the potential users' needs, how much it's worth to them, and the resources required to produce the level of solution required for adoption.
## The Question of Risk
When it comes to prioritizing a product there are some considerations 
+ How confident are you that know what people are trying to accomplish and the tradeoffs they would make?
+ What is the scope of solutions that you would consider? Are you exclusively interested in sustaining innvoations an adjacent features, or are you willing to consider entirely new solution spaces?
If the situation is low risk (e.g. it's a quick feature to build), you can proceed relatively quickly. In those situations where there is considerable risk (either high investment or where failure will be costly), certain steps should be taken to determine whether to proceed. 
<p align="center">
  <img src="https://user-images.githubusercontent.com/1085160/93369064-ccfb1080-f81c-11ea-9d9b-0eab73aa9498.png" width="400" height="400">
</p>

## What to Build (or How to "De-risk" Your Project)
Focus on factors that have the *biggest* potential of failure. 
Below is a framework to identify *where* the failure will happen.
1. **Utility**: Do they want the value you are trying to deliver? If they don't care about the value, you very likely shouldn't test the solution with them.
2. **Discoverability**: Can they find the solution?
3. **Comprehension**: Do they understand the solution?
4. **Believability**: Do they beleive they solution would deliver the aforementioned value?

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

### Things that Don't Need to be Tested
+ When a product has little adoption risk (eg it's a [sustaining innovation](https://github.com/charlesrogers/product_research/blob/master/research_resources/research_frameworks.md#sustaining-innovations) with little difference other than better performance, then the only question is really "does this perform better/result in better outcomes for the user" than the other options and thus less customer "insight" is required beyond whether it is usable.
+ If you are making incremental changes and following traditional design conventions, Discoverability, Comprehension, Believability should be relatively low-probabiliy.
These lower-risk opportunities should typically reveal themselves as you analyze a conversion rate funnel, which is essentially optimizing an existing flow or feature. The risk of this type of innovation is that you reach a "[local maxima](https://github.com/charlesrogers/product_research/blob/master/research_resources/research_frameworks.md#local-maxima)".

### Choose Products & Services that are Directly Related to the KPI at Hand
In order to change a specific action we must address it with a directly relevant intervention (product or service).
For example, to increase on-platform payment we should not focus on things that do not make the objectives concerning payment "better" (i.e. selecting a vendor), however if the payment objectives are already sufficiently satisfied, we can then look for adjacent or **concurrent** objectives that are attractive enough to shift payment behavior.







---
### TO FILE
## How Much Will This Improve Things?
Man, this is such a hard question to answer in *absolute* terms.
First, to be honest, we shouldn't really test whether how effective a coupon would be unless it is a huge huge huge development effort, coupons are something that we KNOW work (millions of online retailers use them very effectively).
But because you asked, and assuming we HAD to test before launching (which is NOT A GOOD IDEA)...
Assuming a small minority of products (<10%) are coupon eligible (whether because limited by vendors who offer the coupon or by a price floor to be able to be applied), we'll need to figure out how likely users are to place a marginal order (one they wouldn't have placed otherwise [we shouldn't really consider buyers who are moving their orders from one supplier to another because that is just cannibalizing existing orders]—basically how many people are willing to place a order they hadn't planned because of the deal.

So how do we find out how many people would place an aditional order?
I would do a survey on the site, but that is going to be hard, so if we couldn't do that, I would focus on interviewing buyers who have purchased buy-now products in the last 30 days AND in the interview screener, I would ask a multi-select question like the following:
"how do you typically shop on X site?"
- I look to purchase the exact items I am looking for and rarely buy something not on my shopping list
- I look to purchase a general item, but am often flexible on what I buy
- I love deals and when I find a great value, I buy it even if I didn't plan on it
- I am looking for interesting stuff and will purchase stuff that catches my eye
I'd keep any one who includes either of the last two
Then I would ask them to look on the site until they find something they might want to puchase:
Then I would ask them how likely they would be to purchase it at the given Price/Shipping rate (1-5, 1 not at all likely, 5 extremely likely)
Then I would introduce the idea of the coupon WITH the rules and ask the previous Likelihood to buy question, but this time with the coupon
OKAY AND THEN to get actual predictive data (this is where it gets really hard to do without a lot of time and money invested):
Benchmark how much a conversion rate improves at each step in the "likelihood to buy" something.
For example, we'd want a table that looked something like this:
Not at all likely: 1% Conversion Rate
Not that likely: 1.5% CR
Somewhat likely: 5% CR
Very likely: 15% CR:
Extremely likely: 30% CR
Then you would ask a group of people (like... 100) how likely they were to do something, then combine their predicted scores from the table above, then see what % total actuall convert

#### Caveats
Magnitude vs Frequency. It's possible that the most common complaint is not the most important thing, and also compaint-based design can lead to small improvements (incrementalism) instead of uncovering new opportunites.
### OLD NOTES
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
