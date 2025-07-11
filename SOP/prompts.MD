# Prompts

## Analysis
### Discovery: 
+ Create an analysis that takes deduplicated {} and looks at {} in the {} stage and breaks down the top 100 used {}, filtered by {} used by more than 5 users

### Slide Creation
+ Create an analysis that takes {} and looks at {}, visualized via a table in gt
  + Columns:
    + Column 1/row label:
    + % of all
    + % of Users
    + % within each Class
  + Rows
    + total
    + group a
Uses gt_rows to color  column {x} with khroma:bam


## Debugging
+ Familiarize yourself with the code, including the code that generated the dataframe used where the error occurred.
  + What do you think the potential errors are?
  + Which do you think is the most probable cause of the error?
  + WRite a spec to identify  which of those issues might be the  cause of the error? 
  + pt2 - Write debugging code to identify the issue, but do not change any of my exiting code
