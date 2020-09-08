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
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="extremely useful"] <- 5; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="extremely useful"] <- 5; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="very useful"] <- 4; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="very useful"] <- 4; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="useful"] <- 3; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="somewhat useful"] <- 2; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="somewhat useful"] <- 2; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="not at all useful"] <- 1; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="not at all useful"] <- 1; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="extremely likely"] <- 5; x})
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
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="extremely important"] <- 5; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="extremely important"] <- 5; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="extremely satisfied"] <- 5; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="extremely satisfied"] <- 5; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Very likely"] <- 4; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Very likely"] <- 4; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Very important"] <- 4; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Very important"] <- 4; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="very important"] <- 4; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="very important"] <- 4; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Very interested"] <- 4; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Very interested"] <- 4; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Very satisfied"] <- 4; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Very satisfied"] <- 4; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="very interested"] <- 4; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="very interested"] <- 4; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="very satisfied"] <- 4; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="very satisfied"] <- 4; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Moderately important"] <- 3; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Moderately important"] <- 3; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Moderately satisfied"] <- 3; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Moderately interested"] <- 3; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="moderately interested"] <- 3; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Moderately interested"] <- 3; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="moderately interested"] <- 3; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Moderately satisfied"] <- 3; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Moderately likely"] <- 3; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Moderately likely"] <- 3; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Satisfied"] <- 3; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="satisfied"] <- 3; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="important"] <- 3; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="somewhat satisfied"] <- 2; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="somewhat satisfied"] <- 2; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Slighlty important"] <- 3; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="somewhat important"] <- 2; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="somewhat important"] <- 2; x})
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
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="not at all important"] <- 1; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="not at all important"] <- 1; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Not at all interested"] <- 1; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Not at all interested"] <- 1; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="not at all interested"] <- 1; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Not at all satisfied"] <- 1; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="not at all satisfied"] <- 1; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="not at all satisfied"] <- 1; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Not at all likely"] <- 1; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Not at all likely"] <- 1; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="Not at all satisfied"] <- 1; x})
  your_data_frame <- as.data.frame(your_data_frame)
  your_data_frame <- apply(your_data_frame,2,function(x){x[x=="not at all satisfied"] <- 1; x})
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
# ** Calculate Opportunity Score ------------------------------------------
calculate_opportunity_score <- function(data_frame_split) {
  opportunity_scores <- data_frame_split %>%
    pivot_wider(objective,
                names_from = c(imp_sat),
                values_from = imp_sat_score) %>%
    mutate(opportunity_score=if_else(imp<sat,imp,imp+imp-sat)) %>%
    arrange(desc(opportunity_score))
  
  return(opportunity_scores)
}

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
  deparsed_column_name <- deparse(substitute(column_to_split_on)) 
  deparsed_column_name <- str_split_fixed(deparsed_column_name[1],"([$])",2) %>%
    as.data.frame(.) %>%
    select(deparsed_column_name=V2) %>%
    pluck(.,1)
  importance_satisfaction_opportunity %>%
  View("Check Data Frame")
  
  importance_satisfaction_opportunity <- importance_satisfaction_opportunity %>%
    mutate(group_difference=.[[7]]-.[[8]],
           group_difference_score=sum(abs(group_difference)),
           Opportunity_Group=case_when(.[[7]]>=10&.[[8]]>=10~paste0(factor_a,"__",factor_b),
                                       .[[7]]>=10&.[[8]]<10~factor_a,
                                       .[[7]]<10&.[[8]]>=10~factor_b,
                                       TRUE~"None")) %>%
    mutate(max_opportunity=if_else(.[[7]]>.[[8]],.[[7]],.[[8]])) %>%
    arrange(max_opportunity) %>%
    mutate(objective=factor(objective, levels=objective),
           pct_diff=abs(group_difference/max_opportunity),
           segmentation_factor=deparsed_column_name) %>%
    mutate_if(is.numeric,round,1)
  
  importance_satisfaction_opportunity %>%
    arrange(desc(max_opportunity))%>%
    select(-group_difference_score,-max_opportunity) %>%
    filter(Opportunity_Group!="None")%>%
    print_data_table(.,paste0(deparsed_column_name,"_opportunity_list"))
  
  opportunity_graph_data_frame <- prep_data_frame_for_opportunity_graph(importance_satisfaction_opportunity)

  plot <- get_opportunity_score_graph_individual(opportunity_graph_data_frame,factor_a,factor_b)
  save_yo_file_png_take_file_name(plot,paste0(deparsed_column_name,"_plot__opportunity_score"))
  
  opportunities_by_stage_group_1 <- get_opportunities_by_stage(opportunity_score_group_1)
  print_data_table(opportunities_by_stage_group_1,paste0("opp_by_stage-",factor_a))
  # print(opportunities_by_stage_group_1)
  
  opportunities_by_stage_group_2 <- get_opportunities_by_stage(opportunity_score_group_2)
  print_data_table(opportunities_by_stage_group_2,paste0("opp_by_stage-",factor_b))
  
  return(importance_satisfaction_opportunity)
}
# * Compare 2: Prep Data Frame for Graph ----------------------------------
prep_data_frame_for_opportunity_graph <- function(data_frame){
  imp_long <- data_frame %>%
    select(sourcing_stage,objective,starts_with("imp_"),starts_with("sat_")) %>%
    pivot_longer(cols=c(starts_with("imp_")),values_to = "rating",names_to = c("imp")) %>%
    select(sourcing_stage,objective,imp,rating) %>% 
    separate(imp,into = c("imp","segment"),sep="\\_",extra = "merge")
  
  sat_long <- data_frame %>%
    select(sourcing_stage,objective,starts_with("imp_"),starts_with("sat_")) %>%
    pivot_longer(cols=c(starts_with("sat_")),values_to = "rating",names_to = c("sat")) %>%
    select(sourcing_stage,objective,sat,rating) %>%
    separate(sat,into = c("sat","segment"),sep="\\_",extra = "merge")
  
  
  data_frame_ready_for_graph <- imp_long %>%
    left_join(sat_long, by=c("objective","segment")) %>%
    select(-imp,-sat) %>%
    transmute(objective,
              importance=rating.x,
              satisfaction=rating.y,
              segment,
              opportunity=if_else(importance>satisfaction,importance+importance-satisfaction,importance),
              opp_flag=if_else(opportunity>=10,1,0))
    
  return(data_frame_ready_for_graph)
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

# * Get Opportunities by Segment WIP --------------------------------------
get_opportunities_by_segment <- function(your_list_of_data_frames){
  for (data_frame in length(your_list_of_data_frames)){
  view(as.data.frame(your_list_of_data_frames[data_frame]))# %>%
    # separate(Opportunity_Group,sep="__",c("Opportunity_Group_A","Opportunity_Group_B",remove=FALSE)) %>%
    # pivot_longer(cols=starts_with("Opportunity_Group"),values_to = "Opportunity_Group", names_to = "Stuff") %>%
    # select(objective,Opportunity_Group) %>%
    # view()
  # print(a)
  }
}

# * Get Opportunity by Stage TBD ------------------------------------------
get_opportunities_by_stage <- function(your_data_frame){
  stage_opportunity_count <- your_data_frame %>%
    pivot_wider(objective,
                names_from = c(segment_name),
                values_from = c(imp,sat,opportunity_score,rank)) %>%
    mutate(objective=as_factor(objective)) %>%
    separate(objective,sep="([.])",into= c("sourcing_stage","objective"))  %>%
    dplyr::mutate(sourcing_stage_count=if_else(.[[5]]>=10,1,0)) %>%
    dplyr::group_by(sourcing_stage) %>%
    dplyr::mutate(stage_opp_count=sum(sourcing_stage_count==1),
                  average_stage_opp=mean(.[[5]])) %>%
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

# SEGMENTATION ------------------------------------------------------------

get_abs_difference <- function(your_data_frame){
  segment_name <- deparse(substitute(your_data_frame)) 
  new_data_frame <- your_data_frame %>%
    select(objective,group_difference) %>%
    mutate(group_difference=abs(group_difference))%>%
    rename(!!segment_name:=group_difference) %>%
    mutate(objective=as.character(objective))%>%
    arrange(objective)
  return(new_data_frame)
}
# * Segmentation - PCT ----------------------------------------------------
get_pct_difference <- function(your_data_frame){
  segment_name <- deparse(substitute(your_data_frame)) 
  new_data_frame <- your_data_frame %>%
    select(objective,pct_diff) %>%
    rename(!!segment_name:=pct_diff) %>%
    mutate(objective=as.character(objective))%>%
    arrange(objective)
  return(new_data_frame)
}

# Usefulness --------------------------------------------------------------
get_usefulness_score <- function(your_data_frame){
  useful_columns <- find_useful_columns(your_data_frame)
  useful_score <- calculate_useful_score(useful_columns)
  return(useful_score)
}

# * Find Usefulness Columns -----------------------------------------------
find_useful_columns <- function(your_data_frame) {
  useful_columns <- your_data_frame %>%
    select(starts_with("useful"))
  return(useful_columns)
}

# * Find Usefulness Scores ------------------------------------------------
individual_data <- NULL
all_data <- NULL
calculate_useful_score <- function(objectives){
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
                useful_sum=sum(n[user_rating==5|
                                           user_rating==4]))  %>%
      mutate(usefulness_score=((useful_sum/total_sum)*100))
    print(individual_data)
    all_data <- rbind(all_data,individual_data)
    
  }
  
  all_data <- all_data %>%
    separate(solution,sep="([.])",into= c("objective","solution")) %>%
    separate(objective,sep="(__)",into= c("theme","category")) %>%
    select(-theme,-total_sum,-useful_sum)%>%
    arrange(desc(usefulness_score)) %>%
    mutate(score_index=usefulness_score/median(usefulness_score)) %>%
    mutate_if(is.numeric,round,1) 
    
  
  deparsed_column_name <- "total_usefulness"
  
  all_data %>%
    print_data_table(.,deparsed_column_name)
  
  return(all_data)
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
    mutate(factor_sourcing_spend_numeric=as.numeric(as.character(factor_sourcing_spend_numeric)),
      segment_sourcing_spend=sum(factor_sourcing_spend_numeric),
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
# *  Opportunity Score Graph: Individual ----------------------------------
get_opportunity_score_graph_individual <- function(data_frame,segment_a,segment_b){
 plot <-  data_frame %>%
    ggplot(aes(x=importance,y=satisfaction,color=opportunity,shape=segment,size=3))+geom_jitter(width = 0.025, height = 0.05) +
    labs(title=paste0("Opportunities: ",segment_a," vs ",segment_b),subtitle="Under-Served Opportunities >= 10 Opportunity Score ",x="Importance",y="Satisfaction",color="Opportunity\nScore",fill="", size="",shape="Segment")+#,caption=paste0("Data as of ",today()) ,caption="NYC Research Team" ,caption=paste0("Created ",today())
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
    guides(size=FALSE) +
    expand_limits(x=0,y=0) +
    annotate("segment",
             x = 5,
             xend=10,
             y = 0,
             yend=10,
             color = "#3D4852") +
    annotate("text", x = 7.75, y = 2,
             hjust = 0,
             color = "#3D4852",
             size = 3.7,
             label = paste0("Under-Served\nObjectives")) +
    annotate("segment",
             x = 0,
             xend=10,
             y = 0,
             yend=10,
             color = "#3D4852") +
    annotate("text", x = 3, y = 2,
             hjust = 0,
             color = "#3D4852",
             size = 3.7,
             label = paste0("Appropriately-Served\nObjectives")) +
    annotate("segment",
             x = 0,
             xend=10,
             y = 0,
             yend=10,
             color = "#3D4852") +
    annotate("text", x = 0.15, y = 2,
             hjust = 0,
             color = "#3D4852",
             size = 3.7,
             label = paste0("Over-Served\nObjectives")) +
    annotate("segment",
             x = 0,
             xend=10,
             y = 7.5,
             yend=7.5,
             color = "#3D4852") +
    annotate("text", x = 1, y = 7.75,
             hjust = 0,
             color = "#3D4852",
             size = 3.7,
             label = paste0("Table Stakes")) +
    scale_x_continuous(expand=c(0,0)) +
    scale_y_continuous(expand=c(0,0)) +
    coord_cartesian(xlim=c(0,10))
  return(plot)
}


# *  Opportunity Score Graph: General -------------------------------------
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
  plot <- data %>%
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
  save_yo_file_png_take_file_name(plot,paste0(title_string,"_plot_cleveland_graph"))
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






# SAVE --------------------------------------------------------------------

# Print Data Table --------------------------------------------------------
print_data_table <- function(your_data_frame,deparsed_column_name){
  png(paste0(project_name,"-",deparsed_column_name,"-",lubridate::today(),'.png'), height = 23*nrow(your_data_frame), width = 220*ncol(your_data_frame))
  grid.table(your_data_frame)
  dev.off()
  png(paste0("/Users/crogers/Work-Analysis/Output/",project_name,"-",deparsed_column_name,"-",lubridate::today(),'.png'), height = 23*nrow(your_data_frame), width = 220*ncol(your_data_frame))
  grid.table(your_data_frame)
  dev.off()
}

# * Print Data Table - Variable Width -------------------------------------
print_data_table_variable <- function(your_data_frame,deparsed_column_name){
  png(paste0(deparsed_column_name,'.png'), height = 22*nrow(your_data_frame), width = 150*ncol(your_data_frame))
  grid.table(your_data_frame)
  dev.off()
}
# * Save CSV --------------------------------------------------------------
save_yo_file_csv <- function(data_frame,project_name){
  file_name <- deparse(substitute(data_frame))
  write.csv(data_frame,paste0(project_name,"-",file_name,"-",lubridate::today(),".csv"))
  write.csv(data_frame,paste0("/Users/crogers/Work-Analysis/Output/",project_name,"-",file_name,"-",lubridate::today(),".csv"))
}

# * Save - Plot -----------------------------------------------------------
save_yo_file_png <- function(data_frame){
  file_name <- deparse(substitute(data_frame))
  ggsave(paste0(project_name,"-",file_name,"-",lubridate::today(),".png"),data_frame, width=15, height=10)
  ggsave(paste0("/Users/crogers/Work-Analysis/Output/",project_name,"-",file_name,"-",lubridate::today(),".png"),data_frame, width=15, height=10)
}

# Save - Plot: Internal ---------------------------------------------------
save_yo_file_png_take_file_name <- function(plot,file_name){
  ggsave(paste0(project_name,"-",file_name,"-",lubridate::today(),".png"),plot, width=15, height=10)
  ggsave(paste0("/Users/crogers/Work-Analysis/Output/",project_name,"-",file_name,"-",lubridate::today(),".png"),plot, width=15, height=10)
}

# Sample Code -------------------------------------------------------------
# PCT by Categorical Factors ----------------------------------------------
# df_by_num_shipments <- df %>% 
#   select(s_num_sample_orders,factor_end_use,factor_experience_level,factor_shipping_method,factor_shipping_orgin,factor_logistics_specialization) %>%
#   mutate(factor_n_orders_3=case_when(s_num_sample_orders %in% c("We are in the process of placing our first order",'1','2-5','6-10')~"sub_10",
#                                      s_num_sample_orders %in% c('11-25',"26-50")~"10_to_50",
#                                      s_num_sample_orders %in% c('51-100',">100")~"51+"))

# https://sebastiansauer.github.io/percentage_plot_ggplot2_V2/
# df_by_num_shipments %>%
#   pivot_longer(factor_end_use:factor_logistics_specialization,names_to = "stat",values_to = "value") %>% 
#   na.omit() %>%
#   mutate(factor_n_orders_3=fct_relevel(factor_n_orders_3,"10_to_50","51+","sub_10")) %>%
#   ggplot(aes(x=value,group=factor_n_orders_3,fill=factor_n_orders_3)) +
#   geom_bar(aes(y = ..prop..), stat="count") +
#   facet_wrap(~stat,scales = "free_y",nrow=2) + 
#   coord_flip() +
#   geom_text(aes( label = scales::percent(..prop..),
#                  y= ..prop..), stat= "count", position = position_stack(vjust = 0.5)) +
#   scale_y_continuous(labels = scales::percent) +
#   #+ scale_x_discrete(drop=FALSE)
#   labs(title="Categorical Factors X Number of Shipments",subtitle="",x="",y="",color="",fill="", size="")+#,caption=paste0("Data as of ",today()) ,caption="NYC Research Team" ,caption=paste0("Created ",today())
#   theme(text=element_text(family = "Roboto"),
#         panel.grid.major = element_line(color = "#DAE1E7"),
#         panel.background = element_blank(),axis.text = element_text(size = 12),
#         axis.text.x = element_text(margin = margin(t = 5)),#hjust = 1,angle=90
#         axis.text.y = element_text(margin = margin(r = 5)),
#         axis.title = element_text (size = 15),
#         axis.line = element_line(),
#         axis.title.y = element_text(margin = margin(r = 10), hjust = 0.5),
#         axis.title.x = element_text(margin = margin(t = 10), hjust = 0.5),
#         plot.caption = element_text(size = 8,
#                                     margin = margin(t = 10),
#                                     color = "#3D4852"), 
#         title = element_text (size = 15,margin = margin(b = 10)),) +
#   expand_limits(x=0,y=0) 

# Explanatory Analys ------------------------------------------------------


