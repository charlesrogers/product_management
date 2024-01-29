# Getting Started
## Prep Your Workspace
### Create the Project-Level Variables
These variables will be utilized in the creation of graphs and 
``` r
# This is used when saving files, this way they have your project name in the file name
project_name <- "YOUR_PROJECT_WITHOUT_SPACES"
# This is used in graphs
project_name_short <- "YOUR PROJECT"
# This is used in graphs
sample_description <- "N=XXXX, Description of sample"
# This is where all files will be saved
setwd('/Users/YOUR NAME/TOP LINE FOLDER/.../PROJECT FOLDER')
# This a dump location for all exports you make (each graphic is exported twice, once to the project folder ("working directory") listed above, and once to this dump location)
backup_file_location <- "/Users/YOUR_COMPUTER/TOP_LINE_FOLDER/.../EXPORT_FOLDER_DUMP"
```
### Load Packages
Not all these packages are needed for every project, but it's a pretty good start
```r
library(tidyverse)
library(magrittr)
library(lubridate)
library(janitor)
library(gt)
library(broom)
library(paletteer)
library(labelled)
```
### Load Your Functions
```r
# Load your custom functions that you use for every project
source("/Users/YOUR_COMPUTER/TOP_LINE_FOLDER/.../global_functions.R")

```

## Load & View Data
Ideally you have data in SPSS format because that means you get column labells

```r
df_spss  <-  read_sav("YOUR_FILE.sav")
# Check out the data and their labels via th Labeled package's Dictionary functionality
dictionary <- labelled::generate_dictionary(df_spss)
```

## Sumary Statistics

## Data Prep
### Create Factors
```r

```
### Create Importance & Satisfaction Dataframes
```r

```
## Analysis
```r

```
## Run Data
```r

```

