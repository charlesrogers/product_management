# Data Prep ---------------------------------------------------------------
# * Load Packages ---------------------------------------------------------
library(tidyverse)
library(magrittr)
library(janitor)
# library(proportion)
# * Loading Data ----------------------------------------------------------
load_your_data <- function(your_data_path_as_string){
  your_data_frame <- read_csv(your_data_path_as_string) %>%
    clean_names()
  your_data_frame <- your_data_frame[-c(1), ]
  return(your_data_frame)
}

# Recoding Columns --------------------------------------------------------
recode_qualitative_to_quantitative <- function(your_data_frame){
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Extremely likely"] <- 5; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Extremely interested"] <- 5; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Extremely interested"] <- 5; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Extremely likely"] <- 5; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Extremely important"] <- 5; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Extremely important"] <- 5; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Extremely satisfied"] <- 5; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Extremely satisfied"] <- 5; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Very likely"] <- 4; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Very likely"] <- 4; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Very important"] <- 4; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Very important"] <- 4; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Very interested"] <- 4; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Very interested"] <- 4; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Very satisfied"] <- 4; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Very satisfied"] <- 4; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Moderately important"] <- 3; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Moderately important"] <- 3; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Moderately satisfied"] <- 3; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Moderately interested"] <- 3; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Moderately interested"] <- 3; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Moderately satisfied"] <- 3; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Moderately likely"] <- 3; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Moderately likely"] <- 3; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Satisfied"] <- 3; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Slighlty important"] <- 3; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Slightly important"] <- 3; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Not that important"] <- 2; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Not that important"] <- 2; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Not that interested"] <- 2; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Not that interested"] <- 2; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Not that important"] <- 2; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Not that likely"] <- 2; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Not that likely"] <- 2; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Not that satisfied"] <- 2; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Not that satisfied"] <- 2; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Not at all important"] <- 1; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Not at all important"] <- 1; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Not at all interested"] <- 1; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Not at all interested"] <- 1; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Not at all satisfied"] <- 1; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Not at all likely"] <- 1; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Not at all likely"] <- 1; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Not at all satisfied"] <- 1; x})
  your_data_frame <- as.data.frame(your_data_frame)
}
# * Recoding Data ---------------------------------------------------------
## Create names: split every name section with with two underscores: "__"... "inventory_receiving__mt_to_select_supplier"
# PROBABILITY -------------------------------------------------------------
# * Likelihood to: --------------------------------------------------------
# ** Likelihood to Renew --------------------------------------------------
# get_likelihood_to_renew <- function(your_data_frame,binary_factor_column,grouping_column){
#   probability_of_renewal <- your_data_frame %>%
#     filter(!is.na(likelihood_flag)) %>%
#     group_by(grouping_column) %>%
#     mutate(binary_factor_column=as.numeric(binary_factor_column)) %>%
#     dplyr::summarise(ltr_pct=mean(binary_factor_column),n=n()) %>%
#     mutate(ltc_pct=1-ltr_pct,
#            ltr_count=round(ltr_pct*n),
#            ltc_count=n-ltr_count) 
#   return(probability_of_renewal)
# }
# ** Likelihood to Adopt --------------------------------------------------

# Likelihood to Renew: Error Bars - Adjusted Wald -------------------------
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

# Analysis ----------------------------------------------------------------
# * Opportunity Functions --------------------------------------------------


# ** Opportunity - Total Population ---------------------------------------
get_imp_sat_opp_scores_total_population <- function(your_data_frame){

  opportunity_columns_group_1 <- find_imp_sat_columns(your_data_frame)
  
  opportunity_score_group_1 <- calculate_imp_sat_score(opportunity_columns_group_1)  
  
  opportunity_score_group_1 <- split_imp_sat_columns(opportunity_score_group_1)
  
  opportunity_score_group_1<- calculate_opportunity_score(opportunity_score_group_1) %>%
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
    # arrange(desc(max_opportunity))%>%
    # select(-group_difference_score,-max_opportunity) %>%
    # filter(Opportunity_Group!="None")%>%
    print_data_table(.,deparsed_column_name)
  
  return(importance_satisfaction_opportunity)
}
# ** COMPARE 2 IMP SAT ----------------------------------------------------
get_imp_sat_opp_scores_compare_2 <- function(your_data_frame,column_to_split_on,factor_a,factor_b) {
  opportunity_calc_group_1 <- your_data_frame %>%
    filter(column_to_split_on==factor_a)
  
  opportunity_columns_group_1 <- find_imp_sat_columns(opportunity_calc_group_1)
  
  opportunity_score_group_1 <- calculate_imp_sat_score(opportunity_columns_group_1)  
  
  opportunity_score_group_1 <- split_imp_sat_columns(opportunity_score_group_1)
  
  opportunity_score_group_1<- calculate_opportunity_score(opportunity_score_group_1) %>%
    mutate(opportunity_score=if_else(imp<sat,imp,imp+imp-sat)) %>%
    arrange(desc(opportunity_score)) %>%
    mutate(segment_name=factor_a,
           rank=rank(desc(opportunity_score)))
  
  opportunity_calc_group_2 <- your_data_frame %>%
    filter(column_to_split_on==factor_b)
  
  opportunity_columns_group_2 <- find_imp_sat_columns(opportunity_calc_group_2)
  
  opportunity_score_group_2 <- calculate_imp_sat_score(opportunity_columns_group_2) 
  
  opportunity_score_group_2 <- split_imp_sat_columns(opportunity_score_group_2)
  
  opportunity_score_group_2<- calculate_opportunity_score(opportunity_score_group_2) %>%
    mutate(opportunity_score=if_else(imp<sat,imp,imp+imp-sat)) %>%
    arrange(desc(opportunity_score)) %>%
    mutate(segment_name=factor_b,
           rank=rank(desc(opportunity_score)))
  
  merged_opportunity_data_frame <- rbind(opportunity_score_group_1,opportunity_score_group_2)

  importance_satisfaction_opportunity <- merged_opportunity_data_frame %>%
    pivot_wider(objective,
                names_from = c(segment_name),
                values_from = c(imp,sat,opportunity_score,rank)) %>%
    mutate(objective=as_factor(objective)) %>%
    separate(objective,sep="([.])",into= c("sourcing_stage","objective")) 
  
  importance_satisfaction_opportunity <- importance_satisfaction_opportunity %>%
    mutate(group_difference=.[[7]]-.[[8]],
           group_difference_score=sum(abs(group_difference)),
           Opportunity_Group=case_when(.[[7]]>=10&.[[8]]>=10~paste0(factor_a,"__",factor_b),
                                       .[[7]]>=10&.[[8]]<10~factor_a,
                                       .[[7]]<10&.[[8]]>=10~factor_b,
                                       TRUE~"None")) %>%
    mutate_if(is.numeric,round,1) %>%
    mutate(max_opportunity=if_else(.[[7]]>.[[8]],.[[7]],.[[8]])) %>%
    arrange(max_opportunity) %>%
    mutate(objective=factor(objective, levels=objective)) 
  deparsed_column_name <- deparse(substitute(column_to_split_on))
  
  importance_satisfaction_opportunity %>%
    arrange(desc(max_opportunity))%>%
  select(-group_difference_score,-max_opportunity) %>%
    filter(Opportunity_Group!="None")%>%
  print_data_table(.,deparsed_column_name)
  
  opportunity_score_group_2 %>%
    pivot_wider(objective,
                names_from = c(segment_name),
                values_from = c(imp,sat,opportunity_score,rank)) %>%
    mutate(objective=as_factor(objective)) %>%
    separate(objective,sep="([.])",into= c("sourcing_stage","objective"))%>%
    mutate(sourcing_stage_count=if_else(.[[5]]>=10,1,0)) %>%
  print(.)
  
  opportunities_by_stage_group_1 <- get_opportunities_by_stage(opportunity_score_group_1)
  print(opportunities_by_stage_group_1)
  
  print_data_table(opportunities_by_stage_group_1,paste0("opps_by_stage-",factor_a))
  opportunities_by_stage_group_2 <- get_opportunities_by_stage(opportunity_score_group_2)

  print_data_table(opportunities_by_stage_group_2,paste0("opps_by_stage-",factor_b))
  return(importance_satisfaction_opportunity)
}

# ** COMPARE 3 IMP SAT - WIP ----------------------------------------------
get_imp_sat_opp_scores_compare_3 <- function(your_data_frame,column_to_split_on,factor_a,factor_b,factor_c) {
  opportunity_calc_group_1 <- your_data_frame %>%
    filter(column_to_split_on==factor_a)
  
  opportunity_columns_group_1 <- find_imp_sat_columns(opportunity_calc_group_1)
  
  opportunity_score_group_1 <- calculate_imp_sat_score(opportunity_columns_group_1) 
  
  opportunity_score_group_1 <- split_imp_sat_columns(opportunity_score_group_1)
  
  opportunity_score_group_1<- calculate_opportunity_score(opportunity_score_group_1) %>%
    mutate(opportunity_score=if_else(imp<sat,imp,imp+imp-sat)) %>%
    arrange(desc(opportunity_score)) %>%
    mutate(segment_name=factor_a)
  
  opportunity_calc_group_2 <- your_data_frame %>%
    filter(column_to_split_on==factor_b)
  
  opportunity_columns_group_2 <- find_imp_sat_columns(opportunity_calc_group_2)
  
  opportunity_score_group_2 <- calculate_imp_sat_score(opportunity_columns_group_2) 
  
  opportunity_score_group_2 <- split_imp_sat_columns(opportunity_score_group_2)
  
  opportunity_score_group_2<- calculate_opportunity_score(opportunity_score_group_2) %>%
    mutate(opportunity_score=if_else(imp<sat,imp,imp+imp-sat)) %>%
    arrange(desc(opportunity_score)) %>%
    mutate(segment_name=factor_b)
  
  opportunity_calc_group_3 <- your_data_frame %>%
    filter(column_to_split_on==factor_c)
  
  opportunity_columns_group_3 <- find_imp_sat_columns(opportunity_calc_group_3)
  
  opportunity_score_group_3 <- calculate_imp_sat_score(opportunity_columns_group_3) 
  
  opportunity_score_group_3 <- split_imp_sat_columns(opportunity_score_group_3)
  
  opportunity_score_group_3<- calculate_opportunity_score(opportunity_score_group_3) %>%
    mutate(opportunity_score=if_else(imp<sat,imp,imp+imp-sat)) %>%
    arrange(desc(opportunity_score)) %>%
    mutate(segment_name=factor_c)
  
  merged_opportunity_data_frame <- rbind(opportunity_score_group_1,opportunity_score_group_2,opportunity_score_group_3)
  
  importance_satisfaction_opportunity <- merged_opportunity_data_frame %>%
    pivot_wider(objective,
                names_from = c(segment_name),
                values_from = c(imp,sat,opportunity_score)) %>%
    mutate(objective=as_factor(objective))
  
  importance_satisfaction_opportunity <- importance_satisfaction_opportunity %>%
    mutate(#group_ave=mean(.[[8]],.[[9]],.[[10]]),
           Opportunity_Group=case_when(.[[8]]>=10&.[[9]]>=10&.[[10]]>=10~paste0(factor_a,"__",factor_b,"__",factor_c),
                                       .[[8]]>=10&.[[9]]<10&.[[10]]<10~factor_a,
                                       .[[9]]>=10&.[[8]]<10&.[[10]]<10~factor_b,
                                       .[[10]]>=10&.[[9]]<10&.[[8]]<10~factor_c,
                                       .[[8]]>=10&.[[9]]>=10&.[[10]]<10~paste0(factor_a,"__",factor_b),
                                       .[[9]]>=10&.[[10]]>=10&.[[8]]<10~paste0(factor_b,"__",factor_c),
                                       .[[8]]>=10&.[[10]]>=10&.[[9]]<10~paste0(factor_a,"__",factor_c),
                                       TRUE~"None")) %>%
    separate(objective,sep="([.])",into= c("sourcing_stage","objective")) 
  return(importance_satisfaction_opportunity)
}

# * Get Opportunities by Segment TBD --------------------------------------
get_opportunities_by_segment <- function(your_list_of_data_frames){
  
}

# * Get Opportunity by Stage TBD ------------------------------------------
get_opportunities_by_stage <- function(your_data_frame){
  stage_opportunity_count <- your_data_frame %>%
    pivot_wider(objective,
                names_from = c(segment_name),
                values_from = c(imp,sat,opportunity_score,rank)) %>%
    mutate(objective=as_factor(objective)) %>%
    separate(objective,sep="([.])",into= c("sourcing_stage","objective"))  %>%
    mutate(sourcing_stage_count=if_else(.[[5]]>=10,1,0)) %>%
    dplyr::group_by(sourcing_stage) %>%
    mutate(stage_opp_count=sum(sourcing_stage_count==1)) %>%
    ungroup() %>%
    distinct(sourcing_stage,stage_opp_count) %>%
    arrange(desc(stage_opp_count))
    # dplyr::group_by(sourcing_stage) %>%
    # mutate(max_stage_opp_score=max(.[[5]])) %>%
    # ungroup() 
  # print(stage_opportunity_count)

  return(stage_opportunity_count)
}

# ** Find Importance Columns ----------------------------------------------
find_imp_sat_columns <- function(your_data_frame){
 imp_columns <- your_data_frame %>%
  select(starts_with("imp_"))
 sat_columns <- your_data_frame %>%
   select(starts_with("sat_"))
data_frame_imp_sat <- cbind(imp_columns,sat_columns)
  return(data_frame_imp_sat)
}

# ** Calculate Importance -------------------------------------------------
individual_data <- NULL
all_data <- NULL
calculate_imp_sat_score <- function(objectives){
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

# ** Split Imp/Sat into Columns -------------------------------------------
split_imp_sat_columns <- function(data_frame_imp_sat){
  data_frame_imp_sat_split <-  data_frame_imp_sat %>%
  separate(objective_name,"__",into = c("imp_sat","objective"),remove = FALSE)
return(data_frame_imp_sat_split)
}



# * ATTRACTIVENESS ---------------------------------------------------------
# ** MASTER Attractiveness Calculation ------------------------------------
get_attractiveness <- function(your_data_frame){
  attractiveness_columns <- find_attractiveness_columns(your_data_frame)
  attractiveness_score <- calculate_attractiveness_score(attractiveness_columns)
  return(attractiveness_score)
}
# ** Find Attractiveness Columns ------------------------------------------
find_attractiveness_columns <- function(your_data_frame) {
    attractiveness_columns <- your_data_frame %>%
      select(starts_with("sol_att"))
    return(attractiveness_columns)
  }

# ** Calculate Attractiveness ---------------------------------------------
individual_data <- NULL
all_data <- NULL
calculate_attractiveness_score <- function(objectives){
  for (objective in seq_along(objectives)){
    namez <- names(objectives)[[objective]]
    
    objective_score <- fct_count(objectives[[objective]]) %>%
      mutate(solution=namez)
    
    objective_score_tibble <- objective_score %>%
      mutate(user_rating=f) %>%
      filter(user_rating %in% c(1,2,3,4,5)) %>%
      select(solution,user_rating,n)
    
    print(objective_score_tibble)
    
    individual_data <-  objective_score_tibble %>%
      summarize(solution=unique(solution),
                total_sum=sum(n),
                attractiveness_sum=sum(n[user_rating==5|
                                    user_rating==4]))  %>%
      mutate(attractiveness_score=((attractiveness_sum/total_sum)*10))
    print(individual_data)
    all_data <- rbind(all_data,individual_data)
    
  }
  return(all_data)
}

# ** Compare 2 Group Attractiveness ---------------------------------------
get_attractiveness_compare_2 <- function(your_data_frame,column_to_split_on,factor_a,factor_b){
  attractiveness_calc_group_1 <- your_data_frame %>%
    filter(column_to_split_on==factor_a)
  
  attractiveness_columns_group_1 <- find_attractiveness_columns(attractiveness_calc_group_1)
  
  attractiveness_score_group_1 <- calculate_attractiveness_score(attractiveness_columns_group_1) %>%
    mutate(segment_name=factor_a)
  
  attractiveness_calc_group_2 <- your_data_frame %>%
    filter(column_to_split_on==factor_b)
  
  attractiveness_columns_group_2 <- find_attractiveness_columns(attractiveness_calc_group_2)
  
  attractiveness_score_group_2 <- calculate_attractiveness_score(attractiveness_columns_group_2) %>%
    mutate(segment_name=factor_b)
  
  merged_attractivness_data_frame <- rbind(attractiveness_score_group_1,attractiveness_score_group_2)
  
  pivoted_attractiveness <- merged_attractivness_data_frame %>%
    pivot_wider(solution,
                names_from = c(segment_name),
                values_from = attractiveness_score) %>% 
    mutate(objective=as_factor(solution)) %>%
    select(-objective)
  # mutate(difference=segment_name-) %>%
  # mutate(objective = fct_reorder(objective, difference, .fun='max' ))
  return(pivoted_attractiveness)
}


# * ATTRACTIVENESS RANKING ------------------------------------------------
# ** Find Attractiveness: Rank Columns ------------------------------------
find_attractiveness_rank_columns <- function(your_data_frame){
  attractivness_rank_columns <- your_data_frame %>%
    select(starts_with("sol_rank"))
  return(attractivness_rank_columns)
}

# ** Calculate Attractiveness: RANK Score ---------------------------------
individual_data <- NULL
all_data <- NULL
calculate_attractiveness_rank_score <- function(objectives){
  for (objective in seq_along(objectives)){
    namez <- names(objectives)[[objective]]
    
    objective_score <- fct_count(objectives[[objective]]) %>%
      mutate(solution=namez)
    
    objective_score_tibble <- objective_score %>%
      mutate(user_rating=f) %>%
      filter(user_rating %in% c(1,2,3,4,5,6,7,8)) %>%
      select(solution,user_rating,n)
    
    individual_data <-  objective_score_tibble %>%
      summarize(solution=unique(solution),
                total_sum=sum(n),
                attractiveness_score_1=sum(n[user_rating==1])*3,
                attractiveness_score_2=sum(n[user_rating==2])*2,
                attractiveness_score_3=sum(n[user_rating==3])*1) %>%
      mutate(attractiveness_score=(attractiveness_score_1+attractiveness_score_2+attractiveness_score_3)) %>%
      select(solution,attractiveness_score)
      
    all_data <- rbind(all_data,individual_data)
    
  }
  return(all_data)
}

# * Calculate Attractiveness: RANK Score - FULL ----------------------------
individual_data <- NULL
all_data <- NULL
calculate_attractiveness_rank_score_full <- function(objectives){
  for (objective in seq_along(objectives)){
    namez <- names(objectives)[[objective]]
    
    objective_score <- fct_count(objectives[[objective]]) %>%
      mutate(solution=namez)
    
    objective_score_tibble <- objective_score %>%
      mutate(user_rating=f) %>%
      filter(user_rating %in% c(1,2,3,4,5,6,7,8)) %>%
      select(solution,user_rating,n)
    
    individual_data <-  objective_score_tibble %>%
      summarize(solution=unique(solution),
                total_sum=sum(n),
                attractiveness_score_1=sum(n[user_rating==1])*5,
                attractiveness_score_2=sum(n[user_rating==2])*4,
                attractiveness_score_3=sum(n[user_rating==3])*3,
                attractiveness_score_4=sum(n[user_rating==4])*2,
                attractiveness_score_5=sum(n[user_rating==5])*1) %>%
      mutate(attractiveness_score=(attractiveness_score_1+attractiveness_score_2+attractiveness_score_3+attractiveness_score_4+attractiveness_score_5)) %>%
      select(solution,attractiveness_score)
    
    all_data <- rbind(all_data,individual_data)
    
  }
  return(all_data)
}

# * Get Attractiveness: RANK Compared -------------------------------------
get_attractiveness_rank_compare_2 <- function(your_data_frame,column_to_split_on,factor_a,factor_b){
  attractiveness_calc_group_1 <- your_data_frame %>%
    filter(column_to_split_on==factor_a)
  
  attractiveness_columns_group_1 <- find_attractiveness_rank_columns(attractiveness_calc_group_1)
  
  attractiveness_score_group_1 <- calculate_attractiveness_rank_score(attractiveness_columns_group_1) %>%
    mutate(segment_name=factor_a)
  
  attractiveness_calc_group_2 <- your_data_frame %>%
    filter(column_to_split_on==factor_b)
  
  attractiveness_columns_group_2 <- find_attractiveness_rank_columns(attractiveness_calc_group_2)
  
  attractiveness_score_group_2 <- calculate_attractiveness_rank_score(attractiveness_columns_group_2) %>%
    mutate(segment_name=factor_b)
  
  merged_attractivness_data_frame <- rbind(attractiveness_score_group_1,attractiveness_score_group_2)
  
  pivoted_attractiveness <- merged_attractivness_data_frame %>%
    pivot_wider(solution,
                names_from = c(segment_name),
                values_from = attractiveness_score) %>% 
    mutate(objective=as_factor(solution)) %>%
    select(-objective)
  # mutate(difference=segment_name-) %>%
  # mutate(objective = fct_reorder(objective, difference, .fun='max' ))
  return(pivoted_attractiveness)
}

# * Get Attractiveness: RANK Compared - FULL ------------------------------
get_attractiveness_rank_compare_2_full <- function(your_data_frame,column_to_split_on,factor_a,factor_b){
  attractiveness_calc_group_1 <- your_data_frame %>%
    filter(column_to_split_on==factor_a)
  
  attractiveness_columns_group_1 <- find_attractiveness_rank_columns(attractiveness_calc_group_1)
  
  attractiveness_score_group_1 <- calculate_attractiveness_rank_score_full(attractiveness_columns_group_1) %>%
    mutate(segment_name=factor_a)
  
  attractiveness_calc_group_2 <- your_data_frame %>%
    filter(column_to_split_on==factor_b)
  
  attractiveness_columns_group_2 <- find_attractiveness_rank_columns(attractiveness_calc_group_2)
  
  attractiveness_score_group_2 <- calculate_attractiveness_rank_score_full(attractiveness_columns_group_2) %>%
    mutate(segment_name=factor_b)
  
  merged_attractivness_data_frame <- rbind(attractiveness_score_group_1,attractiveness_score_group_2)
  
  pivoted_attractiveness <- merged_attractivness_data_frame %>%
    pivot_wider(solution,
                names_from = c(segment_name),
                values_from = attractiveness_score) %>% 
    mutate(objective=as_factor(solution)) %>%
    select(-objective)
  # mutate(difference=segment_name-) %>%
  # mutate(objective = fct_reorder(objective, difference, .fun='max' ))
  return(pivoted_attractiveness)
}

# Market Size -------------------------------------------------------------
# * Conditional Market Size -----------------------------------------------
get_market_size_by_segment <- function(your_data_frame,column_to_split_on){
  market_size <- your_data_frame %>%
    group_by(!!column_to_split_on)%>%
    mutate(segment_sourcing_spend=sum(factor_sourcing_spend_numeric),
           segement_count=n(),
           sourcing_spend_per_user=segment_sourcing_spend/segement_count,
           segment_name=!!column_to_split_on) %>%
    ungroup() %>%
    distinct(segment_name,sourcing_spend_per_user) 
    # select(segment_sourcing_spend,segement_count,sourcing_spend_per_user) 
  return(market_size)
}


# SUMMARIZE ---------------------------------------------------------------
# attractiveness_rank_company_size %>%
#   mutate(Midmarket_retailer_rank=rank(desc(Midmarket_retailers)),
#          Small_Retailers_rank=rank(desc(Small_Retailers)),
#          average_rank=(Midmarket_retailer_rank+Small_Retailers_rank)/2) %>% 
#   select(solution,Midmarket_retailers,Midmarket_retailer_rank,Small_Retailers,Small_Retailers_rank,average_rank) %>%
#   View("Rank_by_Company_Size")
# 
# get_ranking_table <- function(your_data_frame,factor_1,factor_2){
#   ranked_table <- your_data_frame %>%
#     select(names(factor_1))
#   print(ranked_table)
#   return(ranked_table)
# }
# Visulization ------------------------------------------------------------
# How to use quosures https://ggplot2.tidyverse.org/reference/aes.html
# *  Opportunity Score Graph ----------------------------------------------
get_opportunity_score_graph <- function(data,title_string,subtitle_string) {
  data %>%
    mutate(high_opportunity=if_else(opportunity_score>=10,"high-priority opportunity","other opportunity")) %>%
    ggplot(aes(x=imp,y=sat,color=high_opportunity,label=objective))+geom_point() + 
    geom_text(aes(label=ifelse(opportunity_score>=10,as.character(objective),'')),hjust=0,vjust=0,angle = 45) +
    #coord_flip() +
    #+ scale_x_discrete(drop=FALSE)
    labs(title=title_string,subtitle=subtitle_string,x="Importance",y="Satisfaction",color="Opportunity\nValue",fill="", size="")+#,caption=paste0("Data as of ",today()) ,caption="NYC Research Team" ,caption=paste0("Created ",today())
    theme(text=element_text(family = "Roboto"),
          panel.grid.major = element_line(color = "#DAE1E7"),
          panel.background = element_blank(),axis.text = element_text(size = 12),
          axis.text.x = element_text(margin = margin(t = 5)),#hjust = 1,angle=90
          axis.text.y = element_text(margin = margin(r = 5)),
          axis.title = element_text (size = 15),
          axis.line = element_line(),
          axis.title.y = element_text(margin = margin(r = 10), hjust = 0.5),
          axis.title.x = element_text(margin = margin(t = 10), hjust = 0.5),
          plot.caption = element_text(size = 8,
                                      margin = margin(t = 10),
                                      color = "#3D4852"), 
          title = element_text (size = 15,margin = margin(b = 10)),) +
    guides(fill=FALSE) +
    expand_limits(x=0,y=0) +
    # scale_x_discrete(drop=FALSE) + 
    #scale_x_continuous(expand=c(0,0)) + scale_y_continuous(expand=c(0,0)) #+
    coord_cartesian(xlim=c(1,10),ylim=c(1,10))
}

# *  Cleveland Graph ------------------------------------------------------
get_cleveland_graph <- function(data, objective, group_1,group_2,title_string,subtitle_string) {
  objective <- enquo(objective)
  group_1 <- enquo(group_1)
  group_2 <- enquo(group_2)
  # print(dplyr::quo_name(!!group_1))
  data %>%
    ggplot() + geom_segment(aes(x=!!objective, xend=!!objective, y=!!group_1, yend=!!group_2), color="grey") +
    geom_point(aes(x=!!objective, y=!!group_1), color="blue", size=3) +
    geom_point(aes(x=!!objective, y=!!group_2), color="red", size=3) +
    coord_flip()+
    labs(title=title_string,subtitle=subtitle_string,x="Objectives",y="Opportunity Score",color="Shipping\nMethod",fill="", size="")+#,caption=paste0("Data as of ",today()) ,caption="NYC Research Team" ,caption=paste0("Created ",today())
    theme(text=element_text(family = "Roboto"),
          panel.grid.major = element_line(color = "#DAE1E7"),
          panel.background = element_blank(),axis.text = element_text(size = 12),
          axis.text.x = element_text(margin = margin(t = 5)),#hjust = 1,angle=90
          axis.text.y = element_text(margin = margin(r = 5)),
          axis.title = element_text (size = 15),
          axis.line = element_line(),
          axis.title.y = element_text(margin = margin(r = 10), hjust = 0.5),
          axis.title.x = element_text(margin = margin(t = 10), hjust = 0.5),
          plot.caption = element_text(size = 8,
                                      margin = margin(t = 10),
                                      color = "#3D4852"), 
          title = element_text (size = 15,margin = margin(b = 10)),
          legend.position="bottom") +
    expand_limits(x=0,y=0)
}

# * Distribution Graph ----------------------------------------------------
get_distribution_graph <- function(data,relevant_column,title_string,subtitle_string) {
  data %>%
    #mutate(relevant_column = fct_rev(fct_reorder(relevant_column, n))) %>%
    #filter(!is.na(relevant_column)) %>%
    ggplot(aes(relevant_column,fill=relevant_column))+geom_bar() + 
    coord_flip() +
    labs(title=title_string,subtitle=subtitle_string,x="",y="Count",color="",fill="", size="")+#,caption=paste0("Data as of ",today()) ,caption="NYC Research Team" ,caption=paste0("Created ",today())
    theme(text=element_text(family = "Roboto"),
          panel.grid.major = element_line(color = "#DAE1E7"),
          panel.background = element_blank(),axis.text = element_text(size = 12),
          axis.text.x = element_text(margin = margin(t = 5)),#hjust = 1,angle=90
          axis.text.y = element_text(margin = margin(r = 5)),
          axis.title = element_text (size = 15),
          axis.line = element_line(),
          axis.title.y = element_text(margin = margin(r = 10), hjust = 0.5),
          axis.title.x = element_text(margin = margin(t = 10), hjust = 0.5),
          plot.caption = element_text(size = 8,
                                      margin = margin(t = 10),
                                      color = "#3D4852"), 
          title = element_text (size = 15,margin = margin(b = 10)),) +
    guides(fill=FALSE) +
    expand_limits(x=0,y=0)
}

get_distribution_graph_with_fill <- function(data,relevant_column,fill_column,title_string,subtitle_string) {
  data %>%
    ggplot(aes(relevant_column,fill=fill_column))+geom_bar() + 
    coord_flip() +
    labs(title=title_string,subtitle=subtitle_string,x="Factor",y="Count",color="",fill="", size="")+#,caption=paste0("Data as of ",today()) ,caption="NYC Research Team" ,caption=paste0("Created ",today())
    theme(text=element_text(family = "Roboto"),
          panel.grid.major = element_line(color = "#DAE1E7"),
          panel.background = element_blank(),axis.text = element_text(size = 12),
          axis.text.x = element_text(margin = margin(t = 5)),#hjust = 1,angle=90
          axis.text.y = element_text(margin = margin(r = 5)),
          axis.title = element_text (size = 15),
          axis.line = element_line(),
          axis.title.y = element_text(margin = margin(r = 10), hjust = 0.5),
          axis.title.x = element_text(margin = margin(t = 10), hjust = 0.5),
          plot.caption = element_text(size = 8,
                                      margin = margin(t = 10),
                                      color = "#3D4852"), 
          title = element_text (size = 15,margin = margin(b = 10)),) +
    guides(fill=FALSE) +
    expand_limits(x=0,y=0)
}

# Print Data Table --------------------------------------------------------
print_data_table <- function(your_data_frame,deparsed_column_name){
  png(paste0(deparsed_column_name,'.png'), height = 23*nrow(your_data_frame), width = 160*ncol(your_data_frame))
  grid.table(your_data_frame)
  dev.off()
}

# * Print Data Table - Variable Width -------------------------------------


print_data_table_variable <- function(your_data_frame,deparsed_column_name){
  png(paste0(deparsed_column_name,'.png'), height = 22*nrow(your_data_frame), width = 150*ncol(your_data_frame))
  grid.table(your_data_frame)
  dev.off()
}
# DEPRICATED CODE ---------------------------------------------------------
# ** ORDER BY DIFFERENCE --------------------------------------------------
# compare_two_groups_opportunities <- function(opportunity_data_frame_1,opportunity_data_frame_2){
# 
#   merged_opportunties <- rbind(opportunity_data_frame_1,opportunity_data_frame_2)
#   segment_first <- first(merged_opportunties$segment_name)
#   print(segment_first)
#   segment_last <- last(merged_opportunties$segment_name)
#   print(segment_last)
#   pivoted_opportunities <- merged_opportunties %>%
#     pivot_wider(objective,
#                 names_from = c(segment_name),
#                 values_from = opportunity_score) %>%
#     mutate(objective=as_factor(objective)) %>%
#     mutate(segment_name=arrange(desc(segment_name)))%>%
#     mutate(difference=first(segment_name)-last(segment_name)) %>%
#     mutate(objective = fct_reorder(objective, difference, .fun='max' ))
#   return(pivoted_opportunities)
# }
# ** Master Opportunity Function [DEP] ------------------------------------
# 
# get_imp_sat_opp_scores <- function(your_data_frame,factor_name){
#   data_frame_imp_sat <- find_imp_sat_columns(your_data_frame)
#   imp_sat_scores <- calculate_imp_sat_score(data_frame_imp_sat)
#   objective_columns <- split_imp_sat_columns(imp_sat_scores)
#   opportuity_scores <- calculate_opportunity_score(objective_columns) %>%
#     mutate(segment_name=factor_name)
#   return(opportuity_scores)
# }
# ** Compare Two Factors: IMP-SAT-OPP - FAST ------------------------------
# get_opportunity_score_compare_2 <- function(your_data_frame,column_to_split_on,factor_a,factor_b) {
#   opportunity_calc_group_1 <- your_data_frame %>%
#     filter(column_to_split_on==factor_a)
#   
#   opportunity_columns_group_1 <- find_imp_sat_columns(opportunity_calc_group_1)
#   
#   opportunity_score_group_1 <- calculate_imp_sat_score(opportunity_columns_group_1) 
#   
#   opportunity_score_group_1 <- split_imp_sat_columns(opportunity_score_group_1)
#   
#   opportunity_score_group_1<- calculate_opportunity_score(opportunity_score_group_1) %>%
#     mutate(opportunity_score=if_else(imp<sat,imp,imp+imp-sat)) %>%
#     arrange(desc(opportunity_score)) %>%
#     mutate(segment_name=factor_a)
#   
#   opportunity_calc_group_2 <- your_data_frame %>%
#     filter(column_to_split_on==factor_b)
#   
#   opportunity_columns_group_2 <- find_imp_sat_columns(opportunity_calc_group_2)
#   
#   opportunity_score_group_2 <- calculate_imp_sat_score(opportunity_columns_group_2) 
#   
#   opportunity_score_group_2 <- split_imp_sat_columns(opportunity_score_group_2)
#   
#   opportunity_score_group_2<- calculate_opportunity_score(opportunity_score_group_2) %>%
#     mutate(opportunity_score=if_else(imp<sat,imp,imp+imp-sat)) %>%
#     arrange(desc(opportunity_score)) %>%
#     mutate(segment_name=factor_b)
#   
#   merged_opportunity_data_frame <- rbind(opportunity_score_group_1,opportunity_score_group_2)
#   
#   pivoted_opportunity <- merged_opportunity_data_frame %>%
#     pivot_wider(objective,
#                 names_from = c(segment_name),
#                 values_from = opportunity_score) %>% 
#     mutate(objective=as_factor(objective))  
#   return(pivoted_opportunity)
# }


# ** Calculate Opportunity Score DEP --------------------------------------
# calculate_opportunity_score <- function(data_frame_split) {
#   opportunity_scores <- data_frame_split %>%
#     pivot_wider(objective,
#                 names_from = c(imp_sat),
#                 values_from = imp_sat_score) %>%
#     mutate(opportunity_score=if_else(imp<sat,imp,imp+imp-sat)) %>%
#     arrange(desc(opportunity_score)) 
#   
#   return(opportunity_scores)
# }

# ** Compare Two Factors: IMP-SAT-OPP DEP ---------------------------------
# compare_two_groups_opportunities <- function(opportunity_data_frame_1,opportunity_data_frame_2){
#     
#   merged_opportunties <- rbind(opportunity_data_frame_1,opportunity_data_frame_2)
#   pivoted_opportunities <- merged_opportunties %>%
#     pivot_wider(objective,
#                 names_from = c(segment_name),
#                 values_from = opportunity_score) %>% 
#     mutate(objective=as_factor(objective)) 
#     # mutate(difference=segment_name-) %>%
#     # mutate(objective = fct_reorder(objective, difference, .fun='max' ))
#   return(pivoted_opportunities)
# }

# * TODO * ----------------------------------------------------------------
# * Add table Stakes Flag to Opportunity Score Calculation ----------------
