# Introduction to Product Research Code
How to use the code, dependencies, and things still in progress
## Getting Started
### Dependencies
You must load certain variables into your environment so that the following code will work:
1. All save_yo_file variables
1. All plot_yo_data variables
1. 
#### Dependencies:
##### Project Name
This code is used to create the descriptive file names
```r
# Project Data ------------------------------------------------------------
project_name <- "business_unit.project_name"
project_name_short <- "Business Unit - Project Name"
sample_description <- "Overall Sample Size (e.g. 118 US SMB Wholesellers"
```

## Data Prep
### Load data
This loads the data <ins>and</ins> also cleans the names by *removing the spaces out of variable names*
```r
load_your_data <- function(your_data_path_as_string){
  your_data_frame <- read_csv(your_data_path_as_string) %>%
    janitor::clean_names()
  your_data_frame <- your_data_frame[-c(1), ]
  return(your_data_frame)
}
```
Convert anything that is a qualitative Likert Scale to a numeric value (e.g. Change "Extremely important" to "5").
```r
recode_qualitative_to_quantitative(your_data_frame)
```
The important caveat is you have to use our [standard likert scales listed here](https://github.com/charlesrogers/product_research/blob/master/quantitative_research/survey_question_bank.md#likert-type-answer-options) or it's probable that this function will incorrectly recode the data.
## Exploratory Data Analysis
## Summary Statistics 
Data displayed in tables and graphics
### Error Bars
This needs to be re-written, replacing ```ltr_count``` with a general column name.
```r
get_error_bars_adjusted_wald <- function(your_data_frame){
  upper_lower_bands <- NULL
  for (i in 1:nrow(your_data_frame)){
    lower_bound[i] <- ciAWDx(your_data_frame$ltr_count[i],your_data_frame$sample_size[i],alp =0.1,h=2)%>%pull(var=2)
    upper_bound[i] <- ciAWDx(your_data_frame$ltr_count[i],your_data_frame$sample_size[i],alp =0.1,h=2)%>%pull(var=3)
    upper_lower_bands <- rbind(upper_lower_bands,cbind(lower_bound[i],upper_bound[i])) %>% as_tibble()
  }
  
  upper_lower_bands <- upper_lower_bands %>%
    select(ltr_lower_bound=V1,ltr_upper_bound=V2)
  
  ltr_data_frame <- cbind(your_data_frame,upper_lower_bands)
  return(ltr_data_frame)
}
```
### Opportunity Scores
#### Select the 
This is the most complex part of the code at the moment.
```r
find_imp_sat_columns <- function(your_data_frame){
  imp_columns <- your_data_frame %>%
    select(starts_with("imp_"))
  sat_columns <- your_data_frame %>%
    select(starts_with("sat_"))
  data_frame_imp_sat <- cbind(imp_columns,sat_columns)
  return(data_frame_imp_sat)
}
```
#### Calculate Percentage of Population who Care About for Each Objective
The following code does the most work to determine the core work
```r
individual_data <- NULL
all_data <- NULL
calculate_pop_pct_score <- function(objectives){
  for (objective in seq_along(objectives)){
    namez <- names(objectives)[[objective]]
    
    objective_score <- fct_count(objectives[[objective]]) %>%
      mutate(objective_name=namez)
    
    objective_score_tibble <- objective_score %>%
      mutate(user_rating=f) %>%
      filter(user_rating %in% c(1,2,3,4,5)) %>%
      select(objective_name,user_rating,n)
    
    print(objective_score_tibble)
    
    individual_data <-  objective_score_tibble %>%
      summarize(objective_name=unique(objective_name),
                total_sum=sum(n),
                imp_sat_sum=sum(n[user_rating==5|
                                    user_rating==4]))  %>%
      mutate(imp_sat_score=((imp_sat_sum/total_sum)*10))
    print(individual_data)
    all_data <- rbind(all_data,individual_data)
    
  }
  return(all_data)
}
```
#### Transform the Scores and Save Them
```r
get_imp_sat_opp_scores_total_population <- function(your_data_frame){

  opportunity_columns_group_1 <- find_imp_sat_columns(your_data_frame)
  opportunity_score_group_1 <- calculate_pop_pct_score(opportunity_columns_group_1)  
  opportunity_score_group_1 <- split_imp_sat_columns(opportunity_score_group_1)
  opportunity_score_group_1 <- calculate_opportunity_score(opportunity_score_group_1) 
  opportunity_score_group_1 <- opportunity_score_group_1 %>%
    mutate(opportunity_score=if_else(imp<sat,imp,imp+imp-sat)) %>%
    arrange(desc(opportunity_score)) %>%
    mutate(segment_name="total_population",
           rank=rank(desc(opportunity_score)))
  importance_satisfaction_opportunity <- opportunity_score_group_1 %>%
    pivot_wider(objective,
                names_from = c(segment_name),
                values_from = c(imp,sat,opportunity_score,rank)) %>%
    mutate(objective=as_factor(objective)) %>%
    separate(objective,sep="([.])",into= c("sourcing_stage","objective")) %>%
    # mutate(max_opportunity=rank()) %>%
    # arrange(max_opportunity) %>%
    mutate_if(is.numeric,round,1) %>%
    mutate(objective=factor(objective, levels=objective)) 
  deparsed_column_name <- "total_opportunity"
  
  importance_satisfaction_opportunity %>%
    print_data_table_general_population(.,deparsed_column_name)
  
  return(importance_satisfaction_opportunity)
}
```
#### Compare Scores by Two Elements of Paired Factors
This is long code, but there are only a few core things you need to get right:
1. When calling the function, you need to add:
  1. The data source
  1. The categorical factor you care about
  1. The exact name of the first categorical factor
  1. The exact name of the second categorical factor
This will outup a data table of paired importance, satisfaction, and opportunity scores with the percentage differences and a caretesian graph plotting the importance and satisfaction scores at the opportunity level.

**I still need to merge in the Cleveland Graph Code**

**I still need to simulate the data table & opportunity score graphs for demonstrations of outputs**

**I still need to add in the objective names for the objectives with >= 10 opportunity scores**


```r
get_imp_sat_opp_scores_compare_2 <- function(your_data_frame,column_to_split_on,factor_a,factor_b) {
  file_type <- "opportunity_list_table"
  opportunity_calc_group_1 <- your_data_frame %>%
    filter(column_to_split_on==factor_a)
  
  sample_size_factor_a<- get_sample_size(opportunity_calc_group_1)
  
  opportunity_columns_group_1 <- find_imp_sat_columns(opportunity_calc_group_1)
  
  opportunity_score_group_1 <- calculate_pop_pct_score(opportunity_columns_group_1)  
  
  opportunity_score_group_1 <- split_imp_sat_columns(opportunity_score_group_1)
  
  opportunity_score_group_1<- calculate_opportunity_score(opportunity_score_group_1) %>%
    mutate(segment_name=factor_a,
           rank=rank(desc(opportunity_score)))
  
  opportunity_calc_group_2 <- your_data_frame %>%
    filter(column_to_split_on==factor_b)
  
  sample_size_factor_b<- get_sample_size(opportunity_calc_group_2)
  
  opportunity_columns_group_2 <- find_imp_sat_columns(opportunity_calc_group_2)
  
  opportunity_score_group_2 <- calculate_pop_pct_score(opportunity_columns_group_2) 
  
  opportunity_score_group_2 <- split_imp_sat_columns(opportunity_score_group_2)
  
  opportunity_score_group_2<- calculate_opportunity_score(opportunity_score_group_2) %>%
    mutate(segment_name=factor_b,
           rank=rank(desc(opportunity_score)))
  
  merged_opportunity_data_frame <- rbind(opportunity_score_group_1,opportunity_score_group_2)
  
  importance_satisfaction_opportunity <- merged_opportunity_data_frame %>%
    pivot_wider(objective,
                names_from = c(segment_name),
                values_from = c(imp,sat,opportunity_score,rank)) %>%
    mutate(objective=as_factor(objective)) %>%
    separate(objective,sep="([.])",into= c("sourcing_stage","objective")) 
  deparsed_column_name <- deparse(substitute(column_to_split_on)) 
  deparsed_column_name <- str_split_fixed(deparsed_column_name[1],"([$])",2) %>%
    as.data.frame(.) %>%
    select(deparsed_column_name=V2) %>%
    pluck(.,1)

  importance_satisfaction_opportunity <- importance_satisfaction_opportunity %>%
    mutate(group_difference=.[[7]]-.[[8]],
           group_difference_score=sum(abs(group_difference)),
           Opportunity_Group=case_when(.[[7]]>=10&.[[8]]>=10~paste0(factor_a,"__",factor_b),
                                       .[[7]]>=10&.[[8]]<10~factor_a,
                                       .[[7]]<10&.[[8]]>=10~factor_b,
                                       TRUE~"None")) %>%
    mutate(max_opportunity=if_else(.[[7]]>.[[8]],.[[7]],.[[8]])) %>%
    mutate_if(is.numeric,round,1) %>%
    arrange(max_opportunity) %>%
    mutate(objective=factor(objective, levels=objective),
           pct_diff=abs(group_difference/max_opportunity),
           segmentation_factor=deparsed_column_name,
           pct_diff=scales::percent(pct_diff,accuracy = 2))
  
  importance_satisfaction_opportunity %>%
    arrange(desc(max_opportunity))%>%
    select(-group_difference_score,-max_opportunity) %>%
    filter(Opportunity_Group!="None") %>%
    select(-contains("rank"),-contains("group"),-contains("Group")) %>%
    print_data_table_compare_2(.,deparsed_column_name,file_type,sample_size_factor_a,sample_size_factor_b)
  
  opportunity_graph_data_frame <- prep_data_frame_for_opportunity_graph(importance_satisfaction_opportunity)

  plot <- get_opportunity_score_graph_individual(opportunity_graph_data_frame,factor_a,factor_b)
  save_yo_file_png_take_file_name(plot,paste0(deparsed_column_name,"_plot__opportunity_score"))
  
  # opportunities_by_stage_group_1 <- get_opportunities_by_stage(opportunity_score_group_1)
  # print_data_table(opportunities_by_stage_group_1,paste0("opp_by_stage-",factor_a))
  # 
  # opportunities_by_stage_group_2 <- get_opportunities_by_stage(opportunity_score_group_2)
  # print_data_table(opportunities_by_stage_group_2,paste0("opp_by_stage-",factor_b))
  
  return(importance_satisfaction_opportunity)
}
```

### Usefulness

## Modeling
This is the least-developed section of the code
### ANOVA
### Linear Regression
