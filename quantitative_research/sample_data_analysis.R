

project_name <- "fy21_uu_analysis"
project_name_short <- "uu Growth Opportunities"
sample_description <- "118 North American yy Users at least slightly involved in xx & with >= 1 order for Business Use"
# GGS_Seller_Satisfaction_Survey_Analysis-FY2020_S2
# Set Working Directory ---------------------------------------------------

setwd('/Users/charlesrogers/Documents/Work-Analysis/Buyer Analysis/uu/uu_FY21_Q2-Exports')
# Load Packages -----------------------------------------------------------
library(tidyverse)
library(readxl)
library(magrittr)
library(lubridate)
library(janitor)
library(readr)
library(gridExtra)
library(gt)
library(factoextra)
library(FactoMineR)
library(scales)
library(fmsb)
library(broom)
options(scipen=999)
# Load Global Functions ---------------------------------------------------
source("/Users/charlesrogers/Documents/Work-Analysis/Template/global_functions/global_functions_imp_sat.R")

# Load Data ---------------------------------------------------------------
# recent_file <- '/Users/crogers/yy_Files/GGS Sellers/Existing Seller Data/Supplier Satisfaction/Survey Results/GGS_SELLER_SATISFACTION_SURVEY-FY2020_S2-200309.csv'
recent_file <- '/Users/charlesrogers/Documents/Work-Analysis/uu/uu_Survey-2020_08_05.xlsx'

df_names <- read_xlsx(recent_file,n_max = 0) %>%
  names()
df_sub_names <- read_xlsx(recent_file,skip = 1, n_max = 1) %>%
  names()

df_raw <- read_xlsx(recent_file, skip = 2,col_names = df_names) %>%
  clean_names()
# df_test <- read_xlsx(path = '/Users/crogers/Work-Analysis/uu/uu_Survey-2020_07_21.xlsx', skip = 0) 

# Recode Data -------------------------------------------------------------
# * Rename column names ---------------------------------------------------
df <- df_raw %>%
  select(sr_yy_business_usage=have_you_used_yy_com_to_buy_products_for_business_purposes,
         sr_xx_involvement=how_involved_are_you_in_managing_xx_and_uu_for_your_company,
         sr_product_end_use=when_you_source_goods_on_yy_com_what_is_the_primary_use_of_the_products_you_source,
         sr_product_end_use_other=x13,
         f_country=in_what_country_do_you_currently_reside,
         s_num_sample_orders=in_the_last_12_months_how_many_non_sample_orders_were_placed_by_the_organization_for_which_you_source,
         s_cc_value=	what_is_the_total_value_of_goods_your_organization_purchased_in_the_last_12_months_in_us_dollars,
         s_num_suppliers_ordered_from =	in_the_last_12_months_from_how_many_sellers_did_your_organization_place_orders_for_the_1st_time,
         s_pct_cc_spend_int =	what_percentage_of_your_cc_spend_in_the_last_12_months_was_spent_with_suppliers_outside_of_your_country,
         s_pct_cc_spend_china =	what_percentage_of_your_cc_spend_in_the_last_12_months_was_spent_with_suppliers_located_in_china,
         s_product_category =	what_type_of_goods_do_you_typically_most_frequently_source_please_select_the_category_that_best_describes_the_good_or_product,
         f_num_employees=	how_many_employees_work_for_the_company_if_you_are_self_employed_select_1,
         f_years_in_business=	how_long_has_your_company_been_in_business,
         f_business_type = what_type_of_company_do_you_own_or_work_for,
         f_num_uu_employees=how_many_people_at_your_organization_are_dedicated_exclusively_to_uu_i_e_at_least_90_percent_of_their_time_is_dedicated_to_uu,
         f_title=	what_is_your_title,
         f_years_experience_general =	what_is_your_experience_level_in_your_role,
         f_years_experience_importing=	how_long_have_you_been_involved_with_importing_of_goods_at_any_company,
         s_num_orders_xx_range =	in_the_last_12_months_approximately_how_many_orders_have_you_or_your_team_been_involved_with_arranging_the_xx_or_uu,
         s_num_orders_xx_integer=	x29,
         s_incoterms=	what_are_your_preferred_international_commercial_terms_incoterms,
         s_incoterms_explanation=	x31,
         s_incoterms_pct_e_f_type=	consider_all_your_purchases_from_the_last_12_months_for_uu_order_arrangement_handling_etc_please_indicate_the_percentage_of_orders_that_apply_for_each_option,
         s_incoterms_pct_c_type=	x33,
         s_incoterms_pct_d_type=	x34,
         s_xx_method_pct_ww_lcl=	consider_all_your_purchases_from_the_last_12_months_please_indicate_the_percentage_of_orders_that_were_rred_by_the_different_rration_methods,
         s_xx_method_pct_ww_fcl=	x36,
         s_xx_method_pct_ee_dd =	x37,
         s_xx_method_pct_ee_zz=	x38,
         s_xx_method_pct_land_rail=	x39,
         s_xx_method_pct_land_truck=	x40,
         s_xx_method_pct_other=	x41,
         s_uu_providers_ee=	what_uu_providers_have_you_used_in_the_past_12_months_for_your_large_zz_purchase_orders_select_all_that_apply,
         s_uu_providers_ww=	x43,
         s_uu_providers_qq=	x44,
         s_uu_providers_zzos=	x45,
         s_uu_providers_other=	x46,
         s_uu_providers_ee_pct =	consider_all_your_purchases_from_the_last_12_months_please_indicate_the_percentage_of_orders_that_were_rred_by_the_different_service_providers,
         s_uu_providers_ww_pct=	x48,
         s_uu_providers_qq_pct=	x49,
         s_uu_providers_zzos_pct=	x50,
         s_uu_providers_other_pct=x51,
         s_preferred_provider_adv_1 = what_is_the_biggest_advantage_for_your_preferred_frequently_used_zz_provider,
         s_preferred_provider_adv_2=	x53,
         s_preferred_provider_adv_3=	x54,
         s_preferred_provider_adv_4=x55,
         s_preferred_provider_adv_5=x56,
         s_preferred_provider_adv_equal=	x57,
         s_preferred_provider_adv_explanation=	x58,
         s_preferred_provider_name=	what_is_your_preferred_most_frequently_used_zz_provider_please_specify_name,
         s_preferred_provider_relationship_length=	how_long_have_you_been_working_with_this_preferred_provider,
         s_typical_rr_method=	what_is_the_main_rration_method_for_that_typical_order,
         s_typical_rr_method_other=	x62,
         imp__evaluate_new_supplier.mt_find_potential_uu_partners=	when_evaluating_uu_providers_for_a_new_order_with_a_new_supplier_how_important_is_it_to_you_that_you_are_able_to,
         imp__evaluate_new_supplier.mt_assess_hh_provider_min_vol_req=	x64,
         imp__evaluate_new_supplier.mt_assess_hh_provider_customer_service_quality=	x65,
         imp__evaluate_new_supplier.mt_assess_uu_provider_resolutions_policy=	x66,
         imp__evaluate_new_supplier.mt_assess_uu_provider_ontime_rate=	x67,
         imp__evaluate_new_supplier.mt_assess_uu_provider_delivery_regions =	x68,
         imp__evaluate_new_supplier.mt_assess_uu_provider_customer_sat =	x69,
         imp__evaluate_new_supplier.mt_assess_uu_contract_exclusivity_check =	x70,
         imp__evaluate_new_supplier.mt_assess_hh_providers_regulatory_compliance	 =	x71,
         imp__evaluate_new_supplier.mt_select_service_provider	 =	x72,
         sat__evaluate_new_supplier.mt_find_potential_uu_partners=when_evaluating_uu_providers_for_a_new_order_with_a_new_supplier_how_satisfied_are_you_with_your_ability_to,
         sat__evaluate_new_supplier.mt_assess_hh_provider_min_vol_req=	x74,
         sat__evaluate_new_supplier.mt_assess_hh_provider_customer_service_quality=	x75,
         sat__evaluate_new_supplier.mt_assess_uu_provider_resolutions_policy=	x76,
         sat__evaluate_new_supplier.mt_assess_uu_provider_ontime_rate=	x77,
         sat__evaluate_new_supplier.mt_assess_uu_provider_delivery_regions=	x78,
         sat__evaluate_new_supplier.mt_assess_uu_provider_customer_sat=	x79,
         sat__evaluate_new_supplier.mt_assess_uu_contract_exclusivity_check=	x80,
         sat__evaluate_new_supplier.mt_assess_hh_providers_regulatory_compliance=	x81,
         sat__evaluate_new_supplier.mt_select_service_provider=	x82,
         imp__estimate_costs.mt_estimate_mm_cost=	when_estimating_costs_for_your_typical_most_frequent_order_how_important_is_you_that_are_able_to,
         imp__estimate_costs.mt_get_quote =	x84, 
         imp__estimate_costs.mt_get_all_quotes =	x85, 
         imp__estimate_costs.ml_being_suprised_by_charges=	x86,
         imp__estimate_costs.m_total_cost_of_xx=	x87,
         imp__estimate_costs.mt_determine_competitive_price =	x88,
         imp__estimate_costs.mt_estimate_available_budget=	x89,
         sat__estimate_costs.mt_estimate_mm_cost=	when_estimating_costs_for_your_typical_most_frequent_order_how_satisfied_are_you_with_q25_ability_to_help_you_accomplish_the_following_needs,
         sat__estimate_costs.mt_get_quote=	x91,
         sat__estimate_costs.mt_get_all_quotes=	x92,
         sat__estimate_costs.ml_being_suprised_by_charges=	x93,
         sat__estimate_costs.m_total_cost_of_xx=	x94,
         sat__estimate_costs.mt_determine_competitive_price=	x95,
         sat__estimate_costs.mt_estimate_available_budget=	x96,
         imp__monitoring_order.ml_ff_has_unacceptable_failure_rate=	when_monitoring_your_typical_most_frequent_order_how_important_is_you_that_are_able_to,
         imp__monitoring_order.mt_locate_order_post_ff=	x98,
         imp__monitoring_order.mt_identify_delay=	x99,
         imp__monitoring_order.mt_identify_delay_cause=	x100,
         imp__monitoring_order.mt_create_response_plan_for_delay=	x101,
         imp__monitoring_order.m_number_of_days_late=	x102,
         imp__monitoring_order.m_unexpected_xx_charges=x103,
         sat__monitoring_order.ml_ff_has_unacceptable_failure_rate=	when_monitoring_your_typical_most_frequent_order_how_satisfied_are_you_with_q25_ability_to_help_you_accomplish_the_following_needs,
         sat__monitoring_order.mt_locate_order_post_ff=		x105,
         sat__monitoring_order.mt_identify_delay=	x106,
         sat__monitoring_order.mt_identify_delay_cause=	x107,
         sat__monitoring_order.mt_create_response_plan_for_delay=	x108,
         sat__monitoring_order.m_number_of_days_late=	x109,
         sat__monitoring_order.m_unexpected_xx_charges=	x110,
         imp__receiving_order.mt_to_receive_order=	when_receiving_your_typical_most_frequent_order_how_important_is_you_that_are_able_to,
         imp__receiving_order.mt_to_do_quality_check=	x112, 
         imp__receiving_order.mt_to_do_quantity_check=	x113,
         imp__receiving_order.mt_gather_evidence_for_claims=	x114,
         imp__receiving_order.ml_not_discovering_issues_unitl_after_warranty_expires=	x115,
         sat__receiving_order.mt_to_receive_order=	when_receiving_your_typical_most_frequent_order_how_satisfied_are_you_with_q25_ability_to_help_you_accomplish_the_following_needs,
         sat__receiving_order.mt_to_do_quality_check=	x117,
         sat__receiving_order.mt_to_do_quantity_check=	x118,
         sat__receiving_order.mt_gather_evidence_for_claims=	x119,
         sat__receiving_order.ml_not_discovering_issues_unitl_after_warranty_expires=	x120,
         imp__paying_for_orders.ml_selecting_terms_that_hurt_cash_flow=	when_paying_for_your_typical_most_frequent_order_how_important_is_you_that_are_able_to,
         imp__paying_for_orders.mt_agree_uu_payment_timeline=	x122,
         imp__paying_for_orders.ml_agreeing_to_strick_payment_timeline=	x123,
         imp__paying_for_orders.mt_find_financing_for_purchase=	x124,
         imp__paying_for_orders.mt_find_financing_for_xx=	x125,
         imp__paying_for_orders.m_interest_rate_on_financing=	x126,
         sat__paying_for_orders.ml_selecting_terms_that_hurt_cash_flow=	when_paying_for_your_typical_most_frequent_order_how_satisfied_are_you_with_q25_ability_to_help_you_accomplish_the_following_needs,
         sat__paying_for_orders.mt_agree_uu_payment_timeline=	x128,
         sat__paying_for_orders.ml_agreeing_to_strick_payment_timeline=	x129,
         sat__paying_for_orders.mt_find_financing_for_purchase=	x130,
         sat__paying_for_orders.mt_find_financing_for_xx=	x131,
         sat__paying_for_orders.m_interest_rate_on_financing=	x132,
         s_ff_origin=	where_is_the_typical_order_coming_from,
         s_ff_units=	for_that_typical_order_what_best_describes_the_units_you_use,
         s_ff_units_other=	x135,
         s_ffs_units_quanity=	how_many_q39_are_included_in_your_typical_order,
         s_typical_weight=	what_s_the_typical_weight_of_your_typical_order_please_indicate_if_you_are_using_kg_or_lbs,
         s_typical_volume=	what_s_the_typical_volume_of_your_typical_most_frequent_order_please_specify_if_you_are_using_cbm_or_cft,
         s_customs_clearance_method=	how_do_you_organization_manage_customs_clearance_for_your_imports_typical_most_frequent_order,
         s_customs_clearance_method_other=	x140,
         s_actual_xx_cost=	what_is_the_typical_xx_cost_in_us_dollars_excluding_tariffs,
         s_actual_pickup=	for_the_price_you_specified_where_does_the_uu_provider_pick_up_the_goods,
         s_actual_delivery=	where_does_the_uu_provider_deliver_the_goods,
         s_cf_high_value=	please_select_the_statements_that_apply_to_your_typical_order_select_all_that_apply,
         s_cf_asap=	x145,
         s_cf_deadline=	x146,
         s_cf_heavy=	x147,
         s_cf_fragile=	x148,
         s_cf_perishable=	x149,
         s_cf_complex=	x150,
         s_cf_customized=	x151,
         s_cf_na=	x152,
         s_cf_other=	x153,
         s_cf_org_limited_budget=	please_select_the_statements_that_apply_to_your_organization,
         s_cf_org_cost_focused=	x155,
         s_cf_org_growth_co=	x156,
         s_cf_org_growing_uu_team=	x157,
         s_cf_org_high_turnover=	x158,
         s_cf_org_na=	x159,
         s_cf_org_other=	x160,
         o_cost_sat_xx_price=	how_satisfied_are_you_with_the_price_you_pay_for_xx_for_your_typical_order,
         o_cost_sat_order_price=	how_satisfied_are_you_with_the_total_price_you_pay_for_your_typical_order,
         a_lta_5_pct=	for_your_typical_order_how_likely_are_you_to_switch_to_a_new_provider_that_offers_the_same_service_speed_quality_customer_service_etc_but_offers_the_following_cost_discounts,
         a_lta_10_pct=	x164,
         a_lta_20_pct=	x165,
         a_lta_30_pct=	x166,
         a_lta_40_pct=	x167,
         a_lta_yy_new=	now_that_you_know_yy_com_zz_how_likely_are_you_to_start_using_this_service_when_you_make_purchases_with_new_suppliers,
         a_lta_yy_new_why=	x169,
         a_lta_yy_existing=	now_that_you_know_yy_com_zz_how_likely_are_you_to_start_using_this_service_when_you_make_purchases_with_your_current_suppliers,
         a_lta_yy_existing_why	=x171,
         a_lta_yy_feature_compare_prices=	which_of_the_following_attributes_of_yy_com_zz_most_attracts_you_to_the_service_select_all_that_apply,
         a_lta_yy_feature_ease_of_use=	x173,
         a_lta_yy_feature_instant_quote=	x174,
         a_lta_yy_feature_cs=	x175,
         a_lta_yy_feature_tranparent_pricing=	x176,
         a_lta_yy_feature_digitized_process=	x177,
         a_lta_yy_feature_fast_compare_book	=x178,
         a_lta_yy_feature_reputation=	x179,
         a_lta_yy_feature_cur_dissatisfaction=	x180,
         a_lta_yy_feature_better_solution=	x181,
         a_lta_yy_feature_not_interested=	x182,
         a_lta_yy_feature_other=	x183,
         a_lta_yy_non_usage_reason_cur_satisfaction=	given_what_you_know_now_what_are_the_main_reasons_to_not_use_yy_com_zz_select_all_that_apply,
         a_lta_yy_non_usage_reason_pricing=	x185,
         a_lta_yy_non_usage_reason_no_difference=	x186,
         a_lta_yy_non_usage_reason_contract=	x187,
         a_lta_yy_non_usage_reason_lack_of_service=	x188,
         a_lta_yy_non_usage_reason_other=	x189,
         a_lta_yy_switch_requirement=	what_would_you_need_from_yy_com_zz_to_consider_switching,
         a_lta_yy_switch_rank_price=	when_considering_switching_from_your_current_uu_provider_what_are_the_most_important_characteristics_you_want_to_see_in_the_new_provider_please_rank_in_order_of_importance,
         a_lta_yy_switch_rank_speed=	x192,
         a_lta_yy_switch_rank_cs=	x193,
         a_lta_yy_switch_rank_damage_rate=	x194,
         a_lta_yy_switch_rank_terms=	x195,
         a_lta_yy_switch_requirement_other=	what_additional_offerings_would_you_like_to_see_from_yy_com_zz_to_consider_switching_from_your_current_provider,
         a_lta_feature_quality=	for_each_of_the_following_options_how_likely_would_you_be_to_switch_to_a_new_provider_that_offers_that_particular_additional_feature_service,
         a_lta_feature_tracking=	x198,
         a_lta_feature_financing_order=	x199,
         a_lta_feature_financing_xx=	x200,
         a_lta_feature_access_expert=	x201,
         a_lta_feature_recommended_method=	x202,
         a_suggestions=	any_other_comments_or_suggestions_you_would_give_to_a_new_uu_provider,
         f_annual_revenue=	from_the_last_12_months_what_is_the_total_revenue_of_the_organization_us_dollars,
         f_first_name=	first_name_2,
         f_last_name=	last_name_2,
         f_email=	what_is_your_email_address,
         f_company=	what_is_the_name_of_the_company_you_work_for_optional)

# * RECODE VALUES ---------------------------------------------------------
# RECODE VARIABLES --------------------------------------------------------
df <- apply(df,2,function(x){x[x==df$sat_o_monitor_mc_unexpected_costs[8]] <- 2; x})
df <- as.data.frame(df)
df <- apply(df,2,function(x){x[x==df$sat_o_receiving_mt_receiving_time[112]] <- 2; x})
df <- as.data.frame(df)
df <- apply(df,2,function(x){x[x==df$imp_o_new_supplier_mt_assess_hh_providers_customer_service_quality[9]] <- 2; x})
df <- as.data.frame(df)

df <- apply(df,2,function(x){x[x=="Extremely likely to swith providers"] <- 5; x})
df <- as.data.frame(df)
df <- apply(df,2,function(x){x[x=="Slighlty likely"] <- 2; x})
df <- as.data.frame(df)
df <- apply(df,2,function(x){x[x=="Very important"] <- 4; x})
df <- as.data.frame(df)
df <- apply(df,2,function(x){x[x=="Moderately important"] <- 3; x})
df <- as.data.frame(df)
df <- apply(df,2,function(x){x[x=="Not at all important"] <- 1; x})
df <- as.data.frame(df)
df <- apply(df,2,function(x){x[x=="Slighlty important"] <- 2; x})
df <- as.data.frame(df)
df <- apply(df,2,function(x){x[x=="Slightly important"] <- 2; x})
df <- as.data.frame(df)
df <- apply(df,2,function(x){x[x=="Slightly important"] <- 2; x})
df <- as.data.frame(df)
df <- apply(df,2,function(x){x[x=="Extremely important"] <- 5; x})
df <- as.data.frame(df)
df <- apply(df,2,function(x){x[x=="Extremely important"] <- 5; x})
df <- as.data.frame(df)
df <- apply(df,2,function(x){x[x=="Extremely satisfied"] <- 5; x})
df <- as.data.frame(df)
df <- apply(df,2,function(x){x[x=="Extremely satisfied"] <- 5; x})
df <- as.data.frame(df)
df <- apply(df,2,function(x){x[x=="Very satisfied"] <- 4; x})
df <- as.data.frame(df)
df <- apply(df,2,function(x){x[x=="Very satisfied"] <- 4; x})
df <- as.data.frame(df)
df <- apply(df,2,function(x){x[x=="Moderately satisfied"] <- 3; x})
df <- as.data.frame(df)
df <- apply(df,2,function(x){x[x=="Moderately satisfied"] <- 3; x})
df <- as.data.frame(df)
df <- apply(df,2,function(x){x[x=="Slightly satisfied"] <- 2; x})
df <- as.data.frame(df)
df <- apply(df,2,function(x){x[x=="Slightly satisfied"] <- 2; x})
df <- as.data.frame(df)
df <- apply(df,2,function(x){x[x=="Slighlty satisfied"] <- 2; x})
df <- as.data.frame(df)
df <- apply(df,2,function(x){x[x=="Slighlty satisfied"] <- 2; x})
df <- as.data.frame(df)

#CONFIRM THAT the respondent in row 258 comes back incorrec
# df$o_est_cost_sat_mt_est_mm_cost[258]

df <- apply(df,2,function(x){x[x=="Not at all satisfied"] <- 1; x})
df <- as.data.frame(df)
df <- apply(df,2,function(x){x[x=="Not at all satisfied"] <- 1; x})
df <- as.data.frame(df)
## Likelihood
df <- apply(df,2,function(x){x[x=="Extremely likely"] <- 5; x})
df <- as.data.frame(df)
df <- apply(df,2,function(x){x[x=="Extremely likely"] <- 5; x})
df <- as.data.frame(df)
df <- apply(df,2,function(x){x[x=="Extremely likely to switch providers"] <- 5; x})
df <- as.data.frame(df)
df <- apply(df,2,function(x){x[x=="Very likely"] <- 4; x})
df <- as.data.frame(df)
df <- apply(df,2,function(x){x[x=="Very likely"] <- 4; x})
df <- as.data.frame(df)
df <- apply(df,2,function(x){x[x=="Moderately likely"] <- 3; x})
df <- as.data.frame(df)
df <- apply(df,2,function(x){x[x=="Moderately likely"] <- 3; x})
df <- as.data.frame(df)
df <- apply(df,2,function(x){x[x=="Slightly likely"] <- 2; x})
df <- as.data.frame(df)
df <- apply(df,2,function(x){x[x=="Somewhat likely"] <- 3; x})
df <- as.data.frame(df)
df <- apply(df,2,function(x){x[x=="Slightly likely"] <- 2; x})
df <- as.data.frame(df)
df <- apply(df,2,function(x){x[x=="Somewhat likely"] <- 3; x})
df <- as.data.frame(df)
df <- apply(df,2,function(x){x[x=="Not at all likely"] <- 1; x})
df <- as.data.frame(df)
df <- apply(df,2,function(x){x[x=="Not at all likely to switch"] <- 1; x})
df <- as.data.frame(df)
df <- apply(df,2,function(x){x[x=="Not at all likely"] <- 1; x})
df <- as.data.frame(df)

# Create Factors ----------------------------------------------------------
# - GMV (<1m, >1m)
# - (<6-10, 11+): EXCLUDE ee dd
# - >= 50% international ffs ?
#   - Experience level?
#   (TYPICAL ORDER)
# - How do you/organization manage customs clearance for your imports (typical/most frequent order)?
#   - Where does the uu provider deliver the goods?
#   - Please select the statements that apply to your typical order? (Select all that apply) || It is time-sensitive. We want it as quickly as possible
# - Please select the statements that apply to your organization? || The organization’s sales are growing fast

df <- df%>%
  mutate(factor_xx_method=case_when(
    s_typical_rr_method=="ww FCL"|s_typical_rr_method=="ww LCL"~"ww",
    s_typical_rr_method=="ee dd (parcel)"|s_typical_rr_method=="ee zz"~"ee",
    s_typical_rr_method=="Other (please specify)"~"Other"),
    factor_uu_specialization=case_when(
      f_num_uu_employees=="There is no dedicated uu team"~"Generalist",
      f_num_uu_employees=="2-5"|f_num_uu_employees=="1"|f_num_uu_employees=="6-10"|f_num_uu_employees=="11-15"|f_num_uu_employees=="16 or more"~"Specialist"),
    factor_annual_revenue=case_when(f_annual_revenue %in% c("Less than $2,500","$2,501-$50,000","$50,001-$1,000,000")~"<=$1M",
                                    f_annual_revenue %in% c("$1,000,001-$20,000,000",'$20,000,001-$50,000,000',"More than $50,000,000")~">$1M"),
    factor_time_asap=if_else(s_cf_asap=="It is time-sensitive. We want it as quickly as possible","asap","not asap"),
    factor_time_deadline=if_else(s_cf_deadline=="It is time-sensitive. There is a strict deadline","deadline","no deadline"),
    factor_num_of_ffs=case_when(s_num_sample_orders %in% c("We are in the process of placing our first order","1","2-5","6-10")~"Up_to_10",
                                      s_num_sample_orders %in% c("11-25",'26-50','51-100','>100')~"Over_10"),
    factor_end_use=case_when(sr_product_end_use %in% c("For resale")~"Resale",
                             sr_product_end_use %in% c("For use in the running of a business")~"Internal",
                             TRUE~"Other"),
    factor_xx_orgin=case_when(s_pct_cc_spend_int %in% c('0%',"1%-25%","26%-50%")~"Maj_dom",
                                    s_pct_cc_spend_int %in% c('26%-50%',"51%-75%","76%-99%","100%")~"Maj_int"),
    factor_experience_level=case_when(f_years_experience_general %in% c('Entry level',"Mid level")~"Junior",
                                      f_years_experience_general %in% c('Senior level')~"Senior"),
    factor_cc_spend=case_when(s_cc_value %in% c('$0; our organization did not purchase any goods','$1-$2,500','$2,501-$50,000','$50,001-$1,000,000')~"<=$1M",
                                    s_cc_value %in% c('$1,000,001-$20,000,000','More than $20,000,000')~">$1M"),
    factor_cc_spend_3=case_when(s_cc_value %in% c('$0; our organization did not purchase any goods','$1-$2,500','$2,501-$50,000')~"<=$50K",
                                      s_cc_value %in% c('$50,001-$1,000,000')~"$50K-$1M",
                                      s_cc_value %in% c('$1,000,001-$20,000,000','More than $20,000,000')~">$1M"),
    factor_cc_spend_numeric=case_when(s_cc_value=='$0; our organization did not purchase any goods'~0,
                                            s_cc_value=='$1-$2,500'~1250,
                                            s_cc_value=='$2,501-$50,000'~23750,
                                            s_cc_value=='$50,001-$1,000,000'~475000,
                                            s_cc_value=='$1,000,001-$20,000,000'~10000000,
                                            s_cc_value=='More than $20,000,000'~25000000),
    factor_likelihood_to_adopt_new=case_when(a_lta_yy_new %in% c('5','4')~"adopter",
                                             a_lta_yy_new %in% c('1','2','3')~"non_adopter"),
    factor_likelihood_to_adopt_existing=case_when(a_lta_yy_existing %in% c('5','4')~"adopter",
                                                  a_lta_yy_existing %in% c('1','2','3')~"non_adopter"),
    factor_n_orders_3=case_when(s_num_sample_orders %in% c("We are in the process of placing our first order",'1','2-5','6-10')~"sub_10",
                                       s_num_sample_orders %in% c('11-25',"26-50")~"10_to_50",
                                       s_num_sample_orders %in% c('51-100',">100")~"51+"),
    factor_company_size=case_when(f_num_employees=="1"~"Micro",
                                  f_num_employees=="2-19"~"Small",
                                  f_num_employees %in% c("20-49","50-99","100-249","250-499")~"medium",
                                  f_num_employees=="500 or more"~"large")
  )

# * Test Factors ----------------------------------------------------------
df %>%
  select(factor_likelihood_to_adopt_new,a_lta_yy_new,factor_likelihood_to_adopt_existing,a_lta_yy_existing) %>%
  view()

# Analysis ----------------------------------------------------------------
# Market Size by Factor ---------------------------------------------------
# * Market Size - ee vs ww --------------------------------------------

# * Market Size - # of Orders ---------------------------------------------
get_market_size_by_segment(df,df$factor_end_use) 
get_market_size_by_segment(df,df$factor_num_of_ffs)
get_market_size_by_segment(df,df$factor_xx_method)
get_market_size_by_segment(df,df$factor_uu_specialization)
get_market_size_by_segment(df,df$factor_experience_level)
get_market_size_by_segment(df,df$factor_xx_orgin)
get_market_size_by_segment(df,df$factor_cc_spend)
get_market_size_by_segment(df,df$factor_time_deadline)
# df %>%
#   #select(factor_cc_spend_numeric) %>%
#   group_by(as.namefactor_xx_method)%>%
#   mutate(segment_cc_spend=sum(factor_cc_spend_numeric),
#          segement_count=n(),
#          cc_spend_per_user=segment_cc_spend/segement_count) %>%
#   ungroup() %>%
#   select(factor_end_usefactor_xx_method,s_cc_value,segment_cc_spend,segement_count,cc_spend_per_user) %>%
#   view()


# Opportunity - General ---------------------------------------------------
opportunity_total_population <- get_imp_sat_opp_scores_total_population(df)
opportunities_by_stage <- opportunity_total_population %>%
  group_by(cc_stage)%>%
  mutate(cc_stage_count=if_else(cc_stage>=10,1,0),
    stage_opp_count=sum(cc_stage_count[opportunity_score_total_population>=10]),
    average_stage_opp_score=mean(opportunity_score_total_population)) %>%
  distinct(cc_stage, stage_opp_count,average_stage_opp_score)
print_data_table(opportunities_by_stage,"opportunities_by_stage")
# Opportunity by Factor ---------------------------------------------------

# * Opportunity - Annual cc Spend -----------------------------------
opportunity_by_cc_spend <- get_imp_sat_opp_scores_compare_2(df,df$factor_cc_spend,"<=$1M",">$1M")
get_cleveland_graph(opportunity_by_cc_spend,opportunity_by_cc_spend$objective,opportunity_by_cc_spend$`opportunity_score_<=$1M`,opportunity_by_cc_spend$`opportunity_score_>$1M`,"uu Opportunities By Annual cc Spend","<$1M = Blue, >$1M = Red")
opportunity_by_cc_spend %>%
  relocate()
# Opportunity - cc Revenue - 3 Segment ------------------------------
# opportunity_by_cc_spend_3 <- get_imp_sat_opp_scores_compare_3(df,df$factor_cc_spend_3,"<=$50K","$50K-$1M",">$1M")
# * Opportunity - Annual Revenue - DEP ------------------------------------
# opportunity_by_annual_revenue <- get_imp_sat_opp_scores_compare_2(df,df$factor_annual_revenue,"<=$1M",">$1M")
# * Opportunity - # of ffs ------------------------------------------
opportunity_number_of_ffs <- get_imp_sat_opp_scores_compare_2(df,df$factor_num_of_ffs,"Up_to_10","Over_10")
get_cleveland_graph(opportunity_number_of_ffs,opportunity_number_of_ffs$objective,opportunity_number_of_ffs$opportunity_score_Sub_10,opportunity_number_of_ffs$opportunity_score_Over_10,"uu Opportunities By Number of ffs","<=10 = Blue, >10 = Red")
# * Opportunity - xx Category ---------------------------------------
opportunity_ww_vs_ee <- get_imp_sat_opp_scores_compare_2(df,df$factor_xx_method,"ww","ee")
get_cleveland_graph(opportunity_ww_vs_ee,opportunity_ww_vs_ee$objective,opportunity_ww_vs_ee$opportunity_score_ee,opportunity_ww_vs_ee$opportunity_score_ww,"uu Opportunities By xx Type","ee = Blue, ww = Red")

# * Opportunity - xx Method : ee dd vs ee zz ------------
opportunity_ee_vs_dd <- get_imp_sat_opp_scores_compare_2(df,df$s_typical_rr_method,"ee dd (parcel)","ee zz")
get_cleveland_graph(opportunity_ee_vs_dd,opportunity_ee_vs_dd$objective,opportunity_ee_vs_dd$`opportunity_score_ee dd (parcel)`,opportunity_ee_vs_dd$`opportunity_score_ee zz`,"uu Opportunities By ee ff Type","ee dd = Blue, ee zz = Red")

# * Opportunity - xx Method : ww LCL vs ww FCL ----------------
opportunity_fcl_vs_lcl <- get_imp_sat_opp_scores_compare_2(df,df$s_typical_rr_method,"ww LCL","ww FCL")
get_cleveland_graph(opportunity_fcl_vs_lcl,opportunity_fcl_vs_lcl$objective,opportunity_fcl_vs_lcl$`opportunity_score_ww LCL`,opportunity_fcl_vs_lcl$`opportunity_score_ww FCL`,"uu Opportunities By ww ff Type","LCL = Blue, FCL = Red")
# * Opportunity - Company Size --------------------------------------------
opportunity_company_size <- get_imp_sat_opp_scores_compare_2(df,df$factor_company_size,"Micro","Small")
opportunity_company_size %>%
  rename_if("test"=starts_with("opportunity"))
get_cleveland_graph(opportunity_company_size,opportunity_company_size$objective,opportunity_company_size$opportunity_score_Micro,opportunity_company_size$opportunity_score_Small,"uu Opportunities By Company Size","Micro = Blue, Small = Red")
# * Opportunity  - Product Use --------------------------------------------
opportunity_product_use <- get_imp_sat_opp_scores_compare_2(df,df$factor_end_use,"Resale","Internal")
get_cleveland_graph(opportunity_product_use,opportunity_product_use$objective,opportunity_product_use$opportunity_score_Resale,opportunity_product_use$opportunity_score_Internal,"uu Opportunities By Product Use","Resale = Blue, Internal Use = Red")

# * Opportunity - xx Origin -----------------------------------------
opportunity_ff_origin<- get_imp_sat_opp_scores_compare_2(df,df$factor_xx_orgin,"Maj_int","Maj_dom")
get_cleveland_graph(opportunity_ff_origin,opportunity_ff_origin$objective,opportunity_ff_origin$opportunity_score_Maj_int,opportunity_ff_origin$opportunity_score_Maj_dom,"uu Opportunities By ff Origin","International = Blue, Domestic = Red")
# * Opportunity - Experience ----------------------------------------------
opportunity_job_experience <- get_imp_sat_opp_scores_compare_2(df,df$factor_experience_level,"Junior","Senior")
get_cleveland_graph(opportunity_job_experience,opportunity_job_experience$objective,opportunity_job_experience$opportunity_score_Junior,opportunity_job_experience$opportunity_score_Senior,"uu Opportunities By Seniority","Junior = Blue, Senior = Red")
# * Opportunity - Roles Specialization ------------------------------------
opportunity_role_specialisation <- get_imp_sat_opp_scores_compare_2(df,df$factor_uu_specialization,"Generalist","Specialist")
get_cleveland_graph(opportunity_role_specialisation,opportunity_role_specialisation$objective,opportunity_role_specialisation$opportunity_score_Generalist,opportunity_role_specialisation$opportunity_score_Specialist,"uu Opportunities By Roles Specialization","Generalist = Blue, Specialist = Red")

# Find Opportunties by Segment: Binary ------------------------------------
list_of_opportunity_data_frames<- c(opportunity_ee_vs_dd_by_group,opportunity_by_cc_spend,opportunity_fcl_vs_lcl_by_group,opportunity_job_experience_by_group,opportunity_number_of_ffs_by_group,opportunity_ww_vs_ee_by_group,opportunity_product_use_by_group,opportunity_role_specialisation_by_group,opportunity_ff_origin_by_group)
get_opportunities_by_segment(opportunity_ee_vs_dd)
# * Opp by Segment - Role Specialization ----------------------------------
opportunity_role_specialisation_by_group <- opportunity_role_specialisation %>%
  separate(Opportunity_Group,sep="__",c("Opportunity_Group_A","Opportunity_Group_B",remove=FALSE)) %>% 
  pivot_longer(cols=starts_with("Opportunity_Group"),values_to = "Opportunity_Group", names_to = "Stuff") %>%
  select(objective,Opportunity_Group) 

# * Opp by Segment - ee dd vs zz -------------------------------
opportunity_ee_vs_dd_by_group <- opportunity_ee_vs_dd %>%
  separate(Opportunity_Group,sep="__",c("Opportunity_Group_A","Opportunity_Group_B",remove=FALSE)) %>% 
  pivot_longer(cols=c(starts_with("Opportunity_Group")),values_to = "Opportunity_Group", names_to = "Stuff") %>%
  select(objective,Opportunity_Group) 


# Segmentation ------------------------------------------------------------
# Segmentation by ABS Difference -----------------------------------------------------
opportunity_ee_vs_dd_abs_diff <- get_abs_difference(opportunity_ee_vs_dd)
opportunity_by_cc_spend_abs_diff <- get_abs_difference(opportunity_by_cc_spend)
opportunity_job_experience_abs_diff <- get_abs_difference(opportunity_job_experience)
opportunity_fcl_vs_lcl_abs_diff <- get_abs_difference(opportunity_fcl_vs_lcl)
opportunity_number_of_ffs_abs_diff <- get_abs_difference(opportunity_number_of_ffs)
opportunity_ww_vs_ee_abs_diff <- get_abs_difference(opportunity_ww_vs_ee)
opportunity_product_use_abs_diff <- get_abs_difference(opportunity_product_use)
opportunity_role_specialisation_abs_diff <- get_abs_difference(opportunity_role_specialisation)
opportunity_ff_origin_abs_diff <- get_abs_difference(opportunity_ff_origin)

# pct_diff_by_group <- cbind(opportunity_ee_vs_dd_abs_diff,opportunity_by_cc_spend_abs_diff,opportunity_job_experience_abs_diff,opportunity_fcl_vs_lcl_abs_diff,opportunity_number_of_ffs_abs_diff,opportunity_ww_vs_ee_abs_diff,opportunity_product_use_abs_diff,opportunity_role_specialisation_abs_diff,opportunity_ff_origin_abs_diff)
abs_diff_by_group <- opportunity_ee_vs_dd_abs_diff %>%
  left_join(opportunity_by_cc_spend_abs_diff)%>%
  left_join(opportunity_job_experience_abs_diff)%>%
  left_join(opportunity_fcl_vs_lcl_abs_diff)%>%
  left_join(opportunity_number_of_ffs_abs_diff)%>%
  left_join(opportunity_ww_vs_ee_abs_diff)%>%
  left_join(opportunity_product_use_abs_diff)%>%
  left_join(opportunity_role_specialisation_abs_diff)%>%
  left_join(opportunity_ff_origin_abs_diff)

abs_diff_pca_data_frame<- abs_diff_by_group %>%
  pivot_longer(-objective) %>%
  pivot_wider(names_from = "objective",values_from = "value")

res.pca <- abs_diff_pca_data_frame %>%
  column_to_rownames(var="name") %>%
  PCA(.,scale.unit = TRUE,ncp = 5,graph = FALSE)

fviz_eig(res.pca,addlabels=TRUE,ylim=c(0,50))
var <- get_pca_var(res.pca)
fviz_pca_var(res.pca,col.var="black")
##### By Absolute Difference: OPPORTUNITY DIFFERENCE
res.pca <- abs_diff_by_group %>%
  column_to_rownames(var="objective") %>%
  PCA(.,scale.unit = TRUE,ncp = 5,graph = FALSE)

fviz_eig(res.pca,addlabels=TRUE,ylim=c(0,50))
var <- get_pca_var(res.pca)
fviz_pca_var(res.pca,col.var="cos2")
fviz_pca_ind(res.pca,pointsize="cos2")

corrplot::corrplot(var$cos2,is.corr=FALSE)
fviz_cos2(res.pca,choice = "var",axes=1:2)


# Segmentation by Abs Difference ------------------------------------------
opportunity_ee_vs_dd_abs_diff <- get_abs_difference(opportunity_ee_vs_dd)
opportunity_by_cc_spend_abs_diff <- get_abs_difference(opportunity_by_cc_spend)
opportunity_job_experience_abs_diff <- get_abs_difference(opportunity_job_experience)
opportunity_fcl_vs_lcl_abs_diff <- get_abs_difference(opportunity_fcl_vs_lcl)
opportunity_number_of_ffs_abs_diff <- get_abs_difference(opportunity_number_of_ffs)
opportunity_ww_vs_ee_abs_diff <- get_abs_difference(opportunity_ww_vs_ee)
opportunity_product_use_abs_diff <- get_abs_difference(opportunity_product_use)
opportunity_role_specialisation_abs_diff <- get_abs_difference(opportunity_role_specialisation)
opportunity_ff_origin_abs_diff <- get_abs_difference(opportunity_ff_origin)


# * Opp by Segment - FCL vs LCL -------------------------------------------
opportunity_fcl_vs_lcl_by_group<- opportunity_fcl_vs_lcl %>%
  separate(Opportunity_Group,sep="__",c("Opportunity_Group_A","Opportunity_Group_B",remove=FALSE)) %>% 
  pivot_longer(cols=starts_with("Opportunity_Group"),values_to = "Opportunity_Group", names_to = "Stuff") %>%
  select(objective,Opportunity_Group) 

# * Opp by Segment - ww vs ee -----------------------------------------
opportunity_ww_vs_ee_by_group <- opportunity_ww_vs_ee %>%
  separate(Opportunity_Group,sep="__",c("Opportunity_Group_A","Opportunity_Group_B",remove=FALSE)) %>% 
  pivot_longer(cols=starts_with("Opportunity_Group"),values_to = "Opportunity_Group", names_to = "Stuff") %>%
  select(objective,Opportunity_Group)

# * Opp by Segment - Annual Revenue ---------------------------------------
opportunity_by_annual_revenue_by_group <- opportunity_by_annual_revenue %>%
  separate(Opportunity_Group,sep="__",c("Opportunity_Group_A","Opportunity_Group_B",remove=FALSE)) %>% 
  pivot_longer(cols=starts_with("Opportunity_Group"),values_to = "Opportunity_Group", names_to = "Stuff") %>%
  select(objective,Opportunity_Group)

# Opp by Segement - cc Spend ----------------------------------------
opportunity_by_cc_spend_by_group <- opportunity_by_cc_spend %>%
  separate(Opportunity_Group,sep="__",c("Opportunity_Group_A","Opportunity_Group_B",remove=FALSE)) %>% 
  pivot_longer(cols=starts_with("Opportunity_Group"),values_to = "Opportunity_Group", names_to = "Stuff") %>%
  select(objective,Opportunity_Group)
# Opp by Segement - cc Spend 3 ---------------------------------------
opportunity_by_cc_spend_by_group_3 <- opportunity_by_cc_spend_3 %>%
  separate(Opportunity_Group,sep="__",c("Opportunity_Group_A","Opportunity_Group_B","Opportunity_Group_C",remove=FALSE)) %>% 
  pivot_longer(cols=starts_with("Opportunity_Group"),values_to = "Opportunity_Group", names_to = "Stuff") %>%
  select(objective,Opportunity_Group)

# * Opp by Segment - Job Experience ---------------------------------------
opportunity_job_experience_by_group <- opportunity_job_experience %>%
  separate(Opportunity_Group,sep="__",c("Opportunity_Group_A","Opportunity_Group_B",remove=FALSE)) %>% 
  pivot_longer(cols=starts_with("Opportunity_Group"),values_to = "Opportunity_Group", names_to = "Stuff") %>%
  select(objective,Opportunity_Group) 

# * Opp by Segment - Number of ffs ----------------------------------
opportunity_number_of_ffs_by_group <- opportunity_number_of_ffs %>%
  separate(Opportunity_Group,sep="__",c("Opportunity_Group_A","Opportunity_Group_B",remove=FALSE)) %>% 
  pivot_longer(cols=starts_with("Opportunity_Group"),values_to = "Opportunity_Group", names_to = "Stuff") %>%
  select(objective,Opportunity_Group) 

# * Opp by Segments - Product Use -----------------------------------------
opportunity_product_use_by_group <- opportunity_product_use %>%
  separate(Opportunity_Group,sep="__",c("Opportunity_Group_A","Opportunity_Group_B",remove=FALSE)) %>% 
  pivot_longer(cols=starts_with("Opportunity_Group"),values_to = "Opportunity_Group", names_to = "Stuff") %>%
  select(objective,Opportunity_Group) 

# * Opp by Segments - ff Origin -------------------------------------
opportunity_ff_origin_by_group <- opportunity_ff_origin %>%
  separate(Opportunity_Group,sep="__",c("Opportunity_Group_A","Opportunity_Group_B",remove=FALSE)) %>% 
  pivot_longer(cols=starts_with("Opportunity_Group"),values_to = "Opportunity_Group", names_to = "Stuff") %>%
  select(objective,Opportunity_Group)


# * * Merge Opportunities -------------------------------------------------
## NEED TO CHANGE THE SORT ON THE ROWS of EACH TABLE
opportunity_by_group <- rbind(opportunity_ee_vs_dd_by_group,opportunity_by_cc_spend,opportunity_fcl_vs_lcl_by_group,opportunity_job_experience_by_group,opportunity_number_of_ffs_by_group,opportunity_ww_vs_ee_by_group,opportunity_product_use_by_group,opportunity_role_specialisation_by_group,opportunity_ff_origin_by_group) %>%
  filter(!is.na(Opportunity_Group)) %>% view()
  filter(Opportunity_Group!="None") %>%
  pivot_wider(names_from =Opportunity_Group,values_from= Opportunity_Group) 
write.csv(opportunity_by_group,"uu_opportunities_by_group-2020_08_18.csv")
print_data_table(opportunity_by_group,"opportunity_by_group")

no_objective_list <- opportunity_by_group %>%
  replace(is.na(.), 0) %>%
  select(-starts_with("obj")) %>%
  replace(.!=0,1) %>%
  lapply(., function(x) as.numeric(as.character(x)))

objective_only_list <- opportunity_by_group %>%
select(starts_with("obj"))
opportunity_by_group_numeric <- cbind(objective_only_list,no_objective_list)

opportunity_by_group_numeric <- opportunity_by_group_numeric %>% 
  adorn_totals(where = c("col","row")) 
print_data_table(actionable_list,"opportunity_by_group")

opportunity_by_group_numeric %>%
  select(objective,Total) %>%
  # CHANGE WIDTH OF DATA TABLE TO 250*nrows
  print_data_table(.,"opportunity_by_Segment")

opportunity_by_group_numeric_distribution <- opportunity_by_group_numeric %>%
  filter(objective=="Total") %>%
  select(-objective,-Total) %>% 
  pivot_longer(cols=everything(),values_to = "Opportunity Count",names_to = "Segment") %>%
  arrange(desc(`Opportunity Count`))
print_data_table(opportunity_by_group_numeric_distribution,"distribution_of_opportunities_by_segments")

opportunity_by_group_numeric_distribution %>%
  ggplot(aes(x=Count))+geom_histogram(binwidth = 1)
  

# EDA ---------------------------------------------------------------------

# * Opportunity Analysis --------------------------------------------------
# ** Opportunity Scores: By Segment - Create Unified Dataframe ------------
df_unified <- opportunity_ee_vs_dd %>%
  left_join(opportunity_by_cc_spend,by=c("objective"="objective")) %>%
  left_join(opportunity_fcl_vs_lcl,by=c("objective"="objective")) %>%
  left_join(opportunity_job_experience,by=c("objective"="objective")) %>%
  left_join(opportunity_number_of_ffs,by=c("objective"="objective")) %>%
  left_join(opportunity_ww_vs_ee,by=c("objective"="objective")) %>%
  left_join(opportunity_product_use,by=c("objective"="objective")) %>%
  left_join(opportunity_role_specialisation,by=c("objective"="objective")) %>%
  left_join(opportunity_ff_origin,by=c("objective"="objective")) 


df_unified_opportunity_scores<- df_unified %>%
  select(cc_stage,objective, starts_with("opportunity_score")) 
print_data_table(df_unified_opportunity_scores,"df_unified_opportunity_scores")
# ** Opportunity Scores: By Segment - Create Limited Dataframe ------------
df_unified_imp_sat<- df_unified %>%
  select(cc_stage.x,objective,starts_with("segmentation_factor"),starts_with("imp_"),starts_with("sat_"))

# ** Opportunity Scores: By Segment - Create Plotable Data Frame ----------
df_unified_imp <- df_unified_imp_sat %>%
  pivot_longer(cols=c(starts_with("imp_")),values_to = "rating",names_to = c("imp")) %>%
  select(cc_stage.x,objective,imp,rating) %>% 
  separate(imp,into = c("imp","segment"),sep="\\_",extra = "merge")

df_unified_sat <- df_unified_imp_sat %>%
  pivot_longer(cols=c(starts_with("sat_")),values_to = "rating",names_to = c("sat")) %>%
  select(objective,sat,rating) %>%
  separate(sat,into = c("sat","segment"),sep="\\_",extra = "merge")

df_unified_segmentation_factor <- df_unified_imp_sat %>%
  pivot_longer(cols=c(starts_with("segmentation_factor")),values_to = "segmentation_factor",names_to = c("factor")) %>% view()
  select(objective,sat,rating) %>%
  separate(sat,into = c("sat","segment"),sep="\\_",extra = "merge")
  

df_unified_imp_sat_long <- df_unified_imp %>%
  left_join(df_unified_sat, by=c("objective","segment"),keep=TRUE) %>%
  select(-imp,-sat) %>%
  transmute(cc_stage=cc_stage.x,objective,
            importance=rating.x,
            satisfaction=rating.y,
            segment,
            segmentation_factor,
            opportunity=if_else(importance>satisfaction,importance+importance-satisfaction,importance),
            opp_flag=if_else(opportunity>=10,1,0),
            )

# ** Opportunity Scores: By Segment - Plot --------------------------------
plot_opportunities_unified_heat_map <- df_unified_imp_sat_long %>%
  ggplot(aes(x=importance,y=satisfaction,color=segment))+geom_jitter(width = 0.025, height = 0.05) +
  # scale_colour_gradient2() +
  labs(title="uu Opportunities",subtitle="Under-Served Opportunities >= 10 Opportunity Score ",x="Importance",y="Satisfaction",color="Opportunity\nScore",fill="", size="")+#,caption=paste0("Data as of ",today()) ,caption="NYC Research Team" ,caption=paste0("Created ",today())
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
  annotate("segment",
    x = 4.98,
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

save_yo_file_png(plot_opportunities_unified_heat_map)

  
# ** Overall Opportunity Scores -------------------------------------------
final_imp_sat_scores %>%
  mutate(opportunity=if_else(opportunity_score>=10,"Yes","No"))%>%
  ggplot(aes(x=importance,y=satisfaction,color=opportunity))+geom_point() +
  labs(title="Overall uu Opportunity",subtitle="",x="Importance",y="Satisfaction",color="High-potential\nOpportunity",fill="", size="")+#,caption=paste0("Data as of ",today()) ,caption="NYC Research Team" ,caption=paste0("Created ",today())
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
  scale_x_continuous(expand=c(0,0)) + scale_y_continuous(expand=c(0,0)) +
  coord_cartesian(xlim=c(1,10),ylim = c(1,10))

# * xx Method -------------------------------------------------------

xx_method %>%
  ggplot(aes(x=imp,y=sat,color=xx_method))+geom_point() +
  labs(title="ee vs ww uu Opportunities",subtitle="",x="Importance",y="Satisfaction",color="xx Method",fill="", size="")+#,caption=paste0("Data as of ",today()) ,caption="NYC Research Team" ,caption=paste0("Created ",today())
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
  scale_x_continuous(expand=c(0,0)) + scale_y_continuous(expand=c(0,0)) +
  coord_cartesian(xlim=c(1,10),ylim = c(1,10))


# ** Cleveland graph: xx Method -------------------------------------
xx_method %>%
  pivot_wider(objective,
              names_from = c(xx_method,xx_method),
              values_from = opportunity_score) %>% 
  mutate(objective=as_factor(objective)) %>%
  mutate(difference=ee-ww) %>%
  mutate(objective = fct_reorder(objective, difference, .fun='max' )) %>%
  ggplot() +
  geom_segment(aes(x=objective, xend=objective, y=ee, yend=ww), color="grey") +
  geom_point(aes(x=objective, y=ee), color="orange", size=3) +
  geom_point(aes(x=objective, y=ww), color="blue", size=3) +
  coord_flip() + 
  labs(title="Difference Between ee and ww Opportunities",subtitle="",x="Objectives",y="Opportunity Score",color="xx\nMethod",fill="", size="")+#,caption=paste0("Data as of ",today()) ,caption="NYC Research Team" ,caption=paste0("Created ",today())
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
  expand_limits(x=0,y=0)



# * Role Specilzation -----------------------------------------------------
# ** Role Specilzation: Plot ----------------------------------------------
role_specialization %>%
  ggplot(aes(x=imp,y=sat,color=segmentation_factor))+geom_point() +
  labs(title="Generalist vs Specialist uu Opportunities",subtitle="",x="Importance",y="Satisfaction",color="Role/nSpecialization",fill="", size="")+#,caption=paste0("Data as of ",today()) ,caption="NYC Research Team" ,caption=paste0("Created ",today())
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
  scale_x_continuous(expand=c(0,0)) + scale_y_continuous(expand=c(0,0)) +
  coord_cartesian(xlim=c(1,10),ylim = c(1,10))

# ** Cleveland graph: Role Specialization -------------------------------------
role_specialization %>%
  pivot_wider(objective,
              names_from = c(segmentation_factor),
              values_from = opportunity_score) %>% 
  mutate(objective=as_factor(objective)) %>%
  mutate(difference=specialist-generalist) %>%
  mutate(objective = fct_reorder(objective, difference, .fun='max' )) %>%
  ggplot() +
  geom_segment(aes(x=objective, xend=objective, y=specialist, yend=generalist), color="grey") +
  geom_point(aes(x=objective, y=specialist), color="orange", size=3) +
  geom_point(aes(x=objective, y=generalist), color="blue", size=3) +
  coord_flip() + 
  labs(title="Difference Between Specialist and Generalist Company Opportunities",subtitle="",x="Objectives",y="Opportunity Score",color="Role\nSpecialization",fill="", size="")+#,caption=paste0("Data as of ",today()) ,caption="NYC Research Team" ,caption=paste0("Created ",today())
  theme(text=element_text(family = "Roboto"),
        #legend.title = element_text(margin = margin(t = 5)),
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
  expand_limits(x=0,y=0)



# Calculate Segment-Level Opportunities -----------------------------------
# Calculate Objective-Level Opportunities ---------------------------------
# Determine Variability by Objective --------------------------------------
# Determine Segment Uniqueness --------------------------------------------
# Defining >10 Population -------------------------------------------------
df_by_num_ffs <- df %>% 
  select(s_num_sample_orders,factor_end_use,factor_experience_level,factor_xx_method,factor_xx_orgin,factor_uu_specialization,factor_n_orders_3) %>%
  # mutate(factor_n_orders_3=case_when(s_num_sample_orders %in% c("We are in the process of placing our first order",'1','2-5','6-10')~"sub_10",
  #                                    s_num_sample_orders %in% c('11-25',"26-50")~"10_to_50",
  #                                    s_num_sample_orders %in% c('51-100',">100")~"51+")) %>%
  pivot_longer(factor_end_use:factor_uu_specialization,names_to = "stat",values_to = "value") %>% 
  na.omit() %>%
  mutate(factor_n_orders_3=fct_relevel(factor_n_orders_3,"10_to_50","51+","sub_10"))

 plot_num_ffs_BY_cat_factors <- ggplot(df_by_num_ffs,aes(x=value,group=factor_n_orders_3,fill=factor_n_orders_3)) +
  geom_bar(aes(y = ..prop..), stat="count") +
  facet_wrap(~stat,scales = "free_y",nrow=2) + 
  coord_flip() +
  geom_text(aes( label = scales::percent(..prop..),
                 y= ..prop..), stat= "count", position = position_stack(vjust = 0.5)) +
  scale_y_continuous(labels = scales::percent) +
  #+ scale_x_discrete(drop=FALSE)
  labs(title="Categorical Factors X Number of ffs",subtitle="",x="",y="",color="",fill="", size="")+#,caption=paste0("Data as of ",today()) ,caption="NYC Research Team" ,caption=paste0("Created ",today())
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
  expand_limits(x=0,y=0) 

save_yo_file_png(plot_num_ffs_BY_cat_factors)
# TEST --------------------------------------------------------------------
df_by_num_ffs %>%
  pivot_longer(factor_end_use:factor_uu_specialization,names_to = "stat",values_to = "value") %>% 
  na.omit() %>%
  mutate(factor_n_orders_3=fct_relevel(factor_n_orders_3,"10_to_50","51+","sub_10")) %>%
  ggplot(aes(x=factor_n_orders_3,group=value,fill=value)) +
  geom_bar(aes(y = ..prop..), stat="count") +
  facet_wrap(~stat,scales = "free_y",nrow=2) + 
  coord_flip() +
  geom_text(aes( label = scales::percent(..prop..),
                 y= ..prop..), stat= "count", position = position_stack(vjust = 0.5)) +
  scale_y_continuous(labels = scales::percent) +
  #+ scale_x_discrete(drop=FALSE)
  labs(title="Categorical Factors X Number of ffs",subtitle="",x="",y="",color="",fill="", size="")+#,caption=paste0("Data as of ",today()) ,caption="NYC Research Team" ,caption=paste0("Created ",today())
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
  expand_limits(x=0,y=0) 

# Explaining: Likelihood to Switch ----------------------------------------
# * Explaining: Likelihood to Switch - Contextual: Order -------------------------

df_likelihood_to_switch_contextual_order <- df %>%
  select(factor_likelihood_to_adopt_new,factor_likelihood_to_adopt_existing,factor_num_of_ffs,factor_n_orders_3,
         s_cf_high_value,
         s_cf_asap,
         s_cf_deadline,
         s_cf_heavy,
         s_cf_fragile,
         s_cf_perishable,
         s_cf_complex,
         s_cf_customized,
         s_cf_na,
         s_cf_other) %>%
  pivot_longer(s_cf_high_value:s_cf_other,names_to = "stat",values_to = "value") %>% 
  na.omit() %>%
  mutate(factor_n_orders_3=fct_relevel(factor_n_orders_3,"10_to_50","51+","sub_10"))

plot_num_ffs_BY_contextual_order_factors <- df_likelihood_to_switch_contextual_order %>%
  ggplot(aes(x =value,y=stat,fill=factor_likelihood_to_adopt_new))+
  geom_bar(position="fill", stat="identity")+
  coord_flip() +
  labs(title="Likelihood to Switch X Contextual Order Factors",subtitle="",x="",y="",color="",fill="", size="")+#,caption=paste0("Data as of ",today()) ,caption="NYC Research Team" ,caption=paste0("Created ",today())
  theme(text=element_text(family = "Roboto"),
        panel.grid.major = element_line(color = "#DAE1E7"),
        panel.background = element_blank(),axis.text = element_text(size = 12),
        axis.text.x = element_blank(),#hjust = 1,angle=90
        axis.text.y = element_text(margin = margin(r = 5)),
        axis.title = element_text (size = 15),
        axis.line = element_line(),
        axis.title.y = element_text(margin = margin(r = 10), hjust = 0.5),
        axis.title.x = element_text(margin = margin(t = 10), hjust = 0.5),
        plot.caption = element_text(size = 8,
                                    margin = margin(t = 10),
                                    color = "#3D4852"),
        title = element_text (size = 15,margin = margin(b = 10)),) +
  expand_limits(x=0,y=0)
save_yo_file_png(plot_num_ffs_BY_contextual_order_factors)


# * Explaining: Likelihood to Switch - Contextual: Company ----------------
df_likelihood_to_switch_contextual_company <- df %>%
  select(factor_likelihood_to_adopt_new,factor_likelihood_to_adopt_existing,factor_num_of_ffs,s_cf_org_limited_budget,factor_n_orders_3,
         s_cf_org_cost_focused,
         s_cf_org_growth_co,
         s_cf_org_growing_uu_team,
         s_cf_org_high_turnover,
         s_cf_org_na,
         s_cf_org_other) %>%
  pivot_longer(s_cf_org_cost_focused:s_cf_org_other,names_to = "stat",values_to = "value") %>% 
  na.omit() %>%
  mutate(value=fct_lump_min(value,3)) %>%
  filter(value!="Other")

plot_num_ffs_BY_contextual_company_factors <- df_likelihood_to_switch_contextual_company %>%
  ggplot(aes(x =value,y=stat,fill=factor_likelihood_to_adopt_new))+
  geom_bar(position="fill", stat="identity")+
  coord_flip() +
  labs(title="Likelihood to Switch X Contextual Company Factors",subtitle="",x="",y="",color="",fill="", size="")+#,caption=paste0("Data as of ",today()) ,caption="NYC Research Team" ,caption=paste0("Created ",today())
  theme(text=element_text(family = "Roboto"),
        panel.grid.major = element_line(color = "#DAE1E7"),
        panel.background = element_blank(),axis.text = element_text(size = 12),
        axis.text.x = element_blank(),#hjust = 1,angle=90
        axis.text.y = element_text(margin = margin(r = 5)),
        axis.title = element_text (size = 15),
        axis.line = element_line(),
        axis.title.y = element_text(margin = margin(r = 10), hjust = 0.5),
        axis.title.x = element_text(margin = margin(t = 10), hjust = 0.5),
        plot.caption = element_text(size = 8,
                                    margin = margin(t = 10),
                                    color = "#3D4852"),
        title = element_text (size = 15,margin = margin(b = 10)),) +
  expand_limits(x=0,y=0)
save_yo_file_png(plot_num_ffs_BY_contextual_company_factors)

# Explaining: Likelihood to Switch - Fimrographic -------------------------
df_likelihood_to_switch <- df %>% 
  select(factor_likelihood_to_adopt_new,factor_likelihood_to_adopt_existing,factor_end_use,factor_experience_level,factor_xx_method,factor_xx_orgin,factor_uu_specialization) %>%
  pivot_longer(factor_end_use:factor_uu_specialization,names_to = "stat",values_to = "value") %>% 
  na.omit() %>%
  mutate(value=fct_rev(fct_relevel(value,"Internal","Resale","Junior","Senior","Generalist","Specialist","ee","ww"))) %>%
  filter(value!="Other")

# Explaining: Likelihood to Adopt - NEW suppliers -------------------------


plot_LTS_New_BY_cat_factors <- df_likelihood_to_switch %>%
  ggplot(aes(x=value,y=stat,fill=factor_likelihood_to_adopt_new)) + 
  geom_col(position = "fill") +
  facet_wrap(~stat,scales = "free_x",nrow=2) + 
  coord_flip() + 
  labs(title="Likelihood to Switch to yy uu with NEW Suppliers",subtitle="",x="",y="",color="",fill="", size="")+#,caption=paste0("Data as of ",today()) ,caption="NYC Research Team" ,caption=paste0("Created ",today())
  theme(text=element_text(family = "Roboto"),
  panel.grid.major = element_line(color = "#DAE1E7"),
  panel.background = element_blank(),axis.text = element_text(size = 12),
  axis.text.x = element_blank(),#hjust = 1,angle=90
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

save_yo_file_png(plot_LTS_New_BY_cat_factors)

# Explaining: Likelihood to Switch - Existing Suppliers -------------------
plot_LTS_Existing_BY_cat_factors <- df_likelihood_to_switch %>%
  ggplot(aes(x=value,y=stat,fill=factor_likelihood_to_adopt_existing)) + 
  geom_col(position = "fill") +
  facet_wrap(~stat,scales = "free_x",nrow=2) + 
  coord_flip() + 
  labs(title="Likelihood to Switch to yy uu with Existing Suppliers",subtitle="",x="",y="",color="",fill="", size="")+#,caption=paste0("Data as of ",today()) ,caption="NYC Research Team" ,caption=paste0("Created ",today())
  theme(text=element_text(family = "Roboto"),
        panel.grid.major = element_line(color = "#DAE1E7"),
        panel.background = element_blank(),axis.text = element_text(size = 12),
        axis.text.x = element_blank(),#hjust = 1,angle=90
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

save_yo_file_png(plot_LTS_Existing_BY_cat_factors)




# Most Attractive Attributes ----------------------------------------------
df_most_attractive_attributes <- df %>%
  select(a_lta_yy_feature_compare_prices,
         a_lta_yy_feature_ease_of_use,
         a_lta_yy_feature_instant_quote,
         a_lta_yy_feature_cs,
         a_lta_yy_feature_tranparent_pricing,
         a_lta_yy_feature_digitized_process,
         a_lta_yy_feature_fast_compare_book,
         a_lta_yy_feature_reputation,
         a_lta_yy_feature_cur_dissatisfaction,
         a_lta_yy_feature_better_solution,
         a_lta_yy_feature_not_interested,
         a_lta_yy_feature_other) %>%
  pivot_longer(cols=everything(),values_to="value",names_to = "name") %>%
  na.omit() %>%
  mutate(value=fct_rev(fct_lump_min(value,2)))%>%
  count(value)

plot_most_attractive_attributes <- df_most_attractive_attributes %>%
  mutate(value=fct_reorder(value,n))%>%
  ggplot(aes(x=value,y=n,fill=value)) + geom_col() +
  coord_flip() +
  labs(title="yy hh's Attractive Attributes",subtitle="Multi-select",x="Attribute",y="Count",color="",fill="", size="")+#,caption=paste0("Data as of ",today()) ,caption="NYC Research Team" ,caption=paste0("Created ",today())
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

save_yo_file_png(plot_most_attractive_attributes)
# Likelihood to Adopt -----------------------------------------------------
df_reason_to_not_adopt_yy <- df %>%
  select(a_lta_yy_non_usage_reason_cur_satisfaction,
         a_lta_yy_non_usage_reason_pricing,
         a_lta_yy_non_usage_reason_no_difference,
         a_lta_yy_non_usage_reason_contract,
         a_lta_yy_non_usage_reason_lack_of_service,
         a_lta_yy_non_usage_reason_other) %>%
  pivot_longer(cols=everything(),values_to="value",names_to = "name") %>%
  na.omit()

df_reason_to_not_adopt_yy %>%
  mutate(value=fct_rev(fct_lump_min(value,2)))%>%
  ggplot(aes(x=value,fill=value)) + geom_bar() +
  coord_flip() +
  labs(title="Top Reasons to NOT Use yy uu",subtitle="",x="",y="",color="",fill="", size="")+#,caption=paste0("Data as of ",today()) ,caption="NYC Research Team" ,caption=paste0("Created ",today())
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
  expand_limits(x=0,y=0) #+
  # scale_x_discrete(drop=FALSE) + 
  #scale_x_continuous(expand=c(0,0)) + scale_y_continuous(expand=c(0,0)) #+
  #coord_cartesian(xlim=c(1,10))

# Likelihood to Adopt: Price ----------------------------------------------
df_price_sensitivity <- df %>%
  select(a_lta_5_pct,
         a_lta_10_pct,
         a_lta_20_pct,
         a_lta_30_pct,
         a_lta_40_pct) %>%
  pivot_longer(cols=everything(),values_to="value",names_to = "name") %>%
  na.omit() %>%
  mutate(adoption_flag=if_else(value %in% c("4","5"),1,0)) %>%
  mutate(value=fct_rev(value)) %>%
  mutate(name=fct_rev(fct_relevel(name,"a_lta_5_pct","a_lta_10_pct","a_lta_20_pct","a_lta_30_pct","a_lta_40_pct"))) 

plot_likelihood_to_adopt_based_on_price_likert <- df_price_sensitivity %>%
  group_by(value,name) %>%
  count() %>%
  ggplot(aes(x=name,y=n,group=value,fill=value))+
  geom_col(position="fill", stat="identity") +
  coord_flip() + 
  labs(title="Likelihood to Adopt yy uu based on Discount",subtitle="",y="% Likely to Adopt",x="Feature",color="",fill="Likelihood\nto Adopt", size="")+#,caption=paste0("Data as of ",today()) ,caption="NYC Research Team" ,caption=paste0("Created ",today())
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
  expand_limits(x=0,y=0)

save_yo_file_png(plot_likelihood_to_adopt_based_on_price_likert)


# Likelihood to Adopt PCT -------------------------------------------------
plot_price_sensitivity <- df_price_sensitivity %>%
  group_by(name) %>%
  summarise(pct_adoption=mean(adoption_flag)) %>%
  ggplot(aes(x=fct_rev(as.factor(name)),y=pct_adoption))+geom_point(size=5) + 
  #coord_flip() +
  #+ scale_x_discrete(drop=FALSE)
  labs(title="Likelihood to Switch to yy @ Price Discounts",subtitle="",x="Percent Discount",y="Likelihood to Switch",color="",fill="", size="")+#,caption=paste0("Data as of ",today()) ,caption="NYC Research Team" ,caption=paste0("Created ",today())
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

save_yo_file_png(plot_price_sensitivity)


# Likelihood to Adopt: Feature --------------------------------------------
df_top_feature <- df %>% 
  select(a_lta_feature_quality,
         a_lta_feature_tracking,
         a_lta_feature_financing_order,
         a_lta_feature_financing_xx,
         a_lta_feature_access_expert,
         a_lta_feature_recommended_method) %>%
  pivot_longer(cols=everything(),values_to="value",names_to = "name") %>%
  na.omit() %>%
  mutate(value=fct_rev(value))

plot_likelihood_to_adopt_based_on_features <- df_top_feature %>%
  group_by(value,name)%>%
  count() %>%
  ggplot(aes(x=name,y=n,group=value,fill=value))+
  geom_col(position="fill", stat="identity") +
  coord_flip() + 
  labs(title="Likelihood to Adopt yy uu based on Potential Features",subtitle="",y="% Likely to Adopt",x="Feature",color="",fill="Likelihood\nto Adopt", size="")+#,caption=paste0("Data as of ",today()) ,caption="NYC Research Team" ,caption=paste0("Created ",today())
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
  expand_limits(x=0,y=0)
save_yo_file_png(plot_likelihood_to_adopt_based_on_features)

write_csv(opportunity_company_size,"opportunity_company_size.csv")



# Radar Graphic
pre_radar_graphic <- opportunity_fcl_vs_lcl %>%
  mutate(abs_group_difference=abs(group_difference)) %>%
  filter(max_opportunity>=10)%>%
  slice_max(order_by = abs_group_difference,n=10) %>%
  mutate(opportunity_ww_FCL=`opportunity_score_ww FCL`,
         opportunity_ww_LCL=`opportunity_score_ww LCL`) %>%
  select(objective,opportunity_ww_FCL,opportunity_ww_LCL) %>%
  mutate("Max"=20,
         "Min"=0) %>%
  select(Max,Min, everything())
  
# Reorient columns
## https://datacornering.com/how-to-transpose-data-frame-in-r/
df_radar_graphic <- pre_radar_graphic %>%
  pivot_longer(, cols = -objective) %>%
  pivot_wider(, names_from = objective) %>%
  rename("objective" = 1) %>%
  as.data.frame() %>%
  column_to_rownames(var = "objective")
  

str(df_radar_graphic)

# Create Initial Plot
radarchart(df_radar_graphic)



# Make the Plot look good
create_beautiful_radarchart <- function(data, color = "#00AFBB", 
                                        vlabels = colnames(data), vlcex = 0.7,
                                        caxislabels = NULL, title = "Difference Between Top 10 LCL and FCL Opportunities", ...){
  radarchart(
    data, axistype = 1,
    # Customize the polygon
    pcol = color, pfcol = scales::alpha(color, 0.5), plwd = 2, plty = 1,
    # Customize the grid
    cglcol = "grey", cglty = 1, cglwd = 0.8,
    # Customize the axis
    axislabcol = "grey", 
    # Variable labels
    vlcex = vlcex, vlabels = vlabels,
    caxislabels = caxislabels, title = title, ...
  )
}

op <- par(mar = c(1, 2, 2, 2))
# Create the radar charts
create_beautiful_radarchart(
  data = df_radar_graphic, caxislabels = c(0, 5, 10, 15,20),
  color = c("#00AFBB", "#E7B800", "#FC4E07")
)
# Add an horizontal legend
# legend(
#   x = "bottom", legend = rownames(df[-c(1,2),]), horiz = TRUE,
#   bty = "n", pch = 20 , col = c("#00AFBB", "#E7B800", "#FC4E07"),
#   text.col = "black", cex = 1, pt.cex = 1.5
# )
par(op)


write.csv(abs_diff_by_group,"difference_by_group.csv")



# Mann Whitney ------------------------------------------------------------
df_chisqt.soucing_spend <- opportunity_by_cc_spend %>%
  #filter(max_opportunity>=10)%>%
  select(7:8) %>%
  gather(group,score,1:2)


df_chisqt.soucing_spend_results <-   tidy(wilcox.test(df_chisqt.soucing_spend$score~df_chisqt.soucing_spend$group))


df_chisqt.ee_ww <- opportunity_ww_vs_ee %>%
  #filter(max_opportunity>=10)%>%
  select(7:8)%>%
  gather(group,score,1:2) 

df_chisqt.ee_ww_results <-   tidy(wilcox.test(df_chisqt.ee_ww$score~df_chisqt.ee_ww$group))

df_chisqt.role <- opportunity_role_specialisation %>%
  #filter(max_opportunity>=10)%>%
  select(7:8) %>%
  gather(group,score,1:2) 

df_chisqt.role_results <-   tidy(wilcox.test(df_chisqt.role$score~df_chisqt.role$group))

df_chisqt.use <- opportunity_product_use %>%
  #filter(max_opportunity>=10)%>%
  select(7:8) %>%
  gather(group,score,1:2) 

df_chisqt.use_results <-   tidy(wilcox.test(df_chisqt.use$score~df_chisqt.use$group))

df_chisqt.co_size <- opportunity_company_size %>%
  #filter(max_opportunity>=10)%>%
  select(7:8) %>%
  gather(group,score,1:2) 

df_chisqt.co_size_results <-   tidy(wilcox.test(df_chisqt.co_size$score~df_chisqt.co_size$group))


df_chisqt.no_ship <- opportunity_number_of_ffs %>%
  #filter(max_opportunity>=10)%>%
  select(7:8) %>%
  gather(group,score,1:2) 

df_chisqt.no_ship_results <-   tidy(wilcox.test(df_chisqt.no_ship$score~df_chisqt.no_ship$group))



df_chisqt.ship_origin <- opportunity_ff_origin %>%
  #filter(max_opportunity>=10)%>%
  select(7:8) %>%
  gather(group,score,1:2) 

df_chisqt.ship_origin_results <-   tidy(wilcox.test(df_chisqt.ship_origin$score~df_chisqt.ship_origin$group))



df_chisqt.fcl_lcl <- opportunity_fcl_vs_lcl %>%
  #filter(max_opportunity>=10)%>%
  select(7:8) %>%
  gather(group,score,1:2) 

df_chisqt.fcl_lcl_results <-   tidy(wilcox.test(df_chisqt.fcl_lcl$score~df_chisqt.fcl_lcl$group))

df_chisqt.dd_zz_limited <- opportunity_ee_vs_dd %>%
  #filter(max_opportunity>=10)%>%
  select(7:8) %>%
  gather(group,score,1:2) 

df_chisqt.dd_zz_results <-   tidy(wilcox.test(df_chisqt.dd_zz$score~df_chisqt.dd_zz$group))

df_wilcox_test <- rbind(df_chisqt.soucing_spend_results,df_chisqt.ee_ww_results,df_chisqt.role_results,df_chisqt.use_results,df_chisqt.co_size_results,df_chisqt.no_ship_results,df_chisqt.ship_origin_results,df_chisqt.fcl_lcl_results,df_chisqt.dd_zz_results)

df_wilcox_test$factor <- list("df_chisqt.soucing_spend_results","df_chisqt.ee_ww_results","df_chisqt.role_results","df_chisqt.use_results","df_chisqt.co_size_results","df_chisqt.no_ship_results","df_chisqt.ship_origin_results","df_chisqt.fcl_lcl_results","df_chisqt.dd_zz_results")


# Wilcox Peeed -----------------------------------------------------------
df_chisqt.soucing_spend <- opportunity_by_cc_spend %>%
  #filter(max_opportunity>=10)%>%
  select(7:8) %>%
  gather(group,score,1:2)


df_chisqt.soucing_spend_results <-   tidy(wilcox.test(df_chisqt.soucing_spend$score~df_chisqt.soucing_spend$group,peeed = TRUE))


df_chisqt.ee_ww <- opportunity_ww_vs_ee %>%
  #filter(max_opportunity>=10)%>%
  select(7:8)%>%
  gather(group,score,1:2) 

df_chisqt.ee_ww_results <-   tidy(wilcox.test(df_chisqt.ee_ww$score~df_chisqt.ee_ww$group,peeed = TRUE))

df_chisqt.role <- opportunity_role_specialisation %>%
  #filter(max_opportunity>=10)%>%
  select(7:8) %>%
  gather(group,score,1:2) 

df_chisqt.role_results <-   tidy(wilcox.test(df_chisqt.role$score~df_chisqt.role$group,peeed = TRUE))

df_chisqt.use <- opportunity_product_use %>%
  #filter(max_opportunity>=10)%>%
  select(7:8) %>%
  gather(group,score,1:2) 

df_chisqt.use_results <-   tidy(wilcox.test(df_chisqt.use$score~df_chisqt.use$group,peeed = TRUE))

df_chisqt.co_size <- opportunity_company_size %>%
  #filter(max_opportunity>=10)%>%
  select(7:8) %>%
  gather(group,score,1:2) 

df_chisqt.co_size_results <-   tidy(wilcox.test(df_chisqt.co_size$score~df_chisqt.co_size$group,peeed = TRUE))


df_chisqt.no_ship <- opportunity_number_of_ffs %>%
  #filter(max_opportunity>=10)%>%
  select(7:8) %>%
  gather(group,score,1:2) 

df_chisqt.no_ship_results <-   tidy(wilcox.test(df_chisqt.no_ship$score~df_chisqt.no_ship$group,peeed = TRUE))



df_chisqt.ship_origin <- opportunity_ff_origin %>%
  #filter(max_opportunity>=10)%>%
  select(7:8) %>%
  gather(group,score,1:2) 

df_chisqt.ship_origin_results <-   tidy(wilcox.test(df_chisqt.ship_origin$score~df_chisqt.ship_origin$group,peeed = TRUE))



df_chisqt.fcl_lcl <- opportunity_fcl_vs_lcl %>%
  #filter(max_opportunity>=10)%>%
  select(7:8) %>%
  gather(group,score,1:2) 

df_chisqt.fcl_lcl_results <-   tidy(wilcox.test(df_chisqt.fcl_lcl$score~df_chisqt.fcl_lcl$group,peeed = TRUE))

df_chisqt.dd_zz_limited <- opportunity_ee_vs_dd %>%
  #filter(max_opportunity>=10)%>%
  select(7:8) %>%
  gather(group,score,1:2) 

df_chisqt.dd_zz_results <-   tidy(wilcox.test(df_chisqt.dd_zz$score~df_chisqt.dd_zz$group,peeed = TRUE))

df_wilcox_test <- rbind(df_chisqt.soucing_spend_results,df_chisqt.ee_ww_results,df_chisqt.role_results,df_chisqt.use_results,df_chisqt.co_size_results,df_chisqt.no_ship_results,df_chisqt.ship_origin_results,df_chisqt.fcl_lcl_results,df_chisqt.dd_zz_results)

df_wilcox_test$factor <- list("df_chisqt.soucing_spend_results","df_chisqt.ee_ww_results","df_chisqt.role_results","df_chisqt.use_results","df_chisqt.co_size_results","df_chisqt.no_ship_results","df_chisqt.ship_origin_results","df_chisqt.fcl_lcl_results","df_chisqt.dd_zz_results")


# ANOVA -------------------------------------------------------------------

# Chi-Squared Test of Independence
df_chisqt.soucing_spend <- opportunity_by_cc_spend %>%
  #filter(max_opportunity>=10)%>%
  select(7:8) 

results_spend <- tidy(chisq.test(df_chisqt.soucing_spend))
  
df_chisqt.ee_ww <- opportunity_ww_vs_ee %>%
  #filter(max_opportunity>=10)%>%
  select(7:8) 

results_ww.ee <- tidy(chisq.test(df_chisqt.ee_ww))

df_chisqt.role <- opportunity_role_specialisation %>%
  #filter(max_opportunity>=10)%>%
  select(7:8) 

results_role <- tidy(chisq.test(df_chisqt.role))

df_chisqt.use <- opportunity_product_use %>%
  #filter(max_opportunity>=10)%>%
  select(7:8) 

results_use <- tidy(chisq.test(df_chisqt.use))

df_chisqt.co_size <- opportunity_company_size %>%
  #filter(max_opportunity>=10)%>%
  select(7:8) 

results_co_size <- tidy(chisq.test(df_chisqt.co_size))


df_chisqt.no_ship <- opportunity_number_of_ffs %>%
  #filter(max_opportunity>=10)%>%
  select(7:8) 

results_no_ship <- tidy(chisq.test(df_chisqt.no_ship))



df_chisqt.ship_origin <- opportunity_ff_origin %>%
  #filter(max_opportunity>=10)%>%
  select(7:8) 

results_ship_origin <- tidy(chisq.test(df_chisqt.ship_origin))



df_chisqt.fcl_lcl <- opportunity_fcl_vs_lcl %>%
  #filter(max_opportunity>=10)%>%
  select(7:8) 

results_fcl_lcl <- tidy(chisq.test(df_chisqt.fcl_lcl))

df_chisqt.dd_zz <- opportunity_ee_vs_dd %>%
  #filter(max_opportunity>=10)%>%
  select(7:8) 

results_dd_zz <- tidy(chisq.test(df_chisqt.dd_zz))


chi_square_results <- rbind(results_dd_zz,results_fcl_lcl,results_ship_origin,results_no_ship,results_spend,results_ww.ee,results_role,results_use,results_co_size)
