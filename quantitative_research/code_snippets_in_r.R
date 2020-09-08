## code snippets in R
snippet plotthis
	+ 
	#coord_flip() +
	#+ scale_x_discrete(drop=FALSE)
	labs(title="",subtitle="",x="",y="",color="",fill="", size="")+#,caption=paste0("Data as of ",today()) ,caption="NYC Research Team" ,caption=paste0("Created ",today())
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

snippet lib
	library(${1:package})

snippet req
	require(${1:package})

snippet src
	source("${1:file.R}")

snippet ret
	return(${1:code})

snippet mat
	matrix(${1:data}, nrow = ${2:rows}, ncol = ${3:cols})

snippet sg
	setGeneric("${1:generic}", function(${2:x, ...}) {
		standardGeneric("${1:generic}")
	})

snippet sm
	setMethod("${1:generic}", ${2:class}, function(${2:x, ...}) {
		${0}
	})

snippet sc
	setClass("${1:Class}", slots = c(${2:name = "type"}))

snippet if
	if (${1:condition}) {
		${0}
	}

snippet el
	else {
		${0}
	}

snippet ei
	else if (${1:condition}) {
		${0}
	}

snippet fun
	${1:name} <- function(${2:variables}) {
		${0}
	}

snippet for
	for (${1:variable} in ${2:vector}) {
		${0}
	}

snippet while
	while (${1:condition}) {
		${0}
	}

snippet switch
	switch (${1:object},
		${2:case} = ${3:action}
	)

snippet apply
	apply(${1:array}, ${2:margin}, ${3:...})

snippet lapply
	lapply(${1:list}, ${2:function})

snippet sapply
	sapply(${1:list}, ${2:function})

snippet mapply
	mapply(${1:function}, ${2:...})

snippet tapply
	tapply(${1:vector}, ${2:index}, ${3:function})

snippet vapply
	vapply(${1:list}, ${2:function}, FUN.VALUE = ${3:type}, ${4:...})

snippet rapply
	rapply(${1:list}, ${2:function})

snippet ts
	`r paste("#", date(), "------------------------------\n")`

snippet shinyapp
	library(shiny)
	
	ui <- fluidPage(
	  ${0}
	)
	
	server <- function(input, output, session) {
	  
	}
	
	shinyApp(ui, server)

snippet shinymod
	${1:name}_UI <- function(id) {
	  ns <- NS(id)
	  tagList(
		${0}
	  )
	}
	
	${1:name} <- function(input, output, session) {
	  
	}

snippet getstarted
	df <- read.csv(file='', skip = 0)
	df_raw <- df
	#df <- df_raw
	
snippet plot.label_opportunity_graph
	+
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
	
snippet get_started
	# Set WD ------------------------------------------------------------------
	#setwd('/Users/crogers/Work-Analysis/#')
	# Load Libraries ----------------------------------------------------------
	library(tidyverse)
	#library(readxl)
	library(magrittr)
	library(lubridate)
	library(janitor)
	#library(readr)
	library(gridExtra)
	#library(factoextra)
	#library(FactoMineR)
	#library(scales)
	
	# Load Functions ----------------------------------------------------------
	source("/Users/crogers/Work-Analysis/Template/global_functions/global_functions_imp_sat.R")
	project_name <- "buyer_growth.product_concept_testing"
	# Load Data ---------------------------------------------------------------
	df <- load_your_data('#')
	# Rename Data -------------------------------------------------------------
	# Recode Data -------------------------------------------------------------
	df <- recode_qualitative_to_quantitative(df)
	# Create Factors ----------------------------------------------------------
	# Opportunity - General ---------------------------------------------------
	opportunity_total_population <- get_imp_sat_opp_scores_total_population(df)
	


