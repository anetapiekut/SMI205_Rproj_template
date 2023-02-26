# SMI205 - replication paper template (v1, 27 February 2023)

#------------------------ DATA CLEANING SCRIPT -----------------------

######################################################################
########################### SCRIPT DESCRIPTION #######################
######################################################################

# This script reproduces and extends analysis presented in [paper details here]
# I reproduce analysis for Model X (Table X, page X)

# If script was prepared by the authors - 
## remember to add a citation (+ link to source) 
## and indicate which parts of he code were edited and modified by you

# The structure of this script is as follows:
#   1. Installing packages and opening libraries
#   2. Loading data
#   3. Recoding variables
#   4. Saving edited data

######################################################################
###################### 1. PACKAGES & LIBRARIES #######################
######################################################################

# Install necessary packages
install.packages("package")

# Tidyverse - a group of packages - download and always use
install.packages("tidyverse") # includes dyplyr & ggplot
# https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf 
# https://dplyr.tidyverse.org/ 

# Loading libraries
library("package")
library("tidyverse")

######################################################################
###################### 2. LOADING DATA ###############################
######################################################################

### Opening different kinds of data ----------------------------------

# Opening data in R format (*.RDS)
ESS_w8_data <- readRDS("Data/RDS_file_name.RDS")

# Opening data in SPSS format *.sav
library("foreign")
ESS_w8_data = read.spss("Data/SPSS_file_name.sav", to.data.frame=TRUE)

# Opening data in Stata format *.dta
library("foreign")
ESS_w8_data2 = read.dta("Data/Stata_file_name.dta")

# Opening data in csv format (check the options: header & separator type)
library("readr")
Indicators_data = read.csv("Data/Csv_data_name.csv", header = TRUE, sep = ",", dec = ".")

# Subsetting data (saving only some variables, list them after commas)
ESS_w8_subset = subset(SPSS_data_date, select = c(variable1, variable2, ...))

### Data manipulation ------------------------------------------------

# Merging data - by 1 matching variable
ESS_w8_subset_with_indicators <- merge(ESS_w8_subset, Indicators_data, by="variable1")

# Merging data - more than 1 matching variable, e.g. 2
ESS_w8_subset_with_indicators2 <- merge(ESS_w8_subset, Indicators_data, by=c("variable1","variable2"), sort=TRUE)


######################################################################
###################### 3. RECODING VARIABLES #########################
######################################################################

# 'old_var' - recoding into new categories --> 'new_var' numeric
Datasetname$new_var[Datasetname$old_var == 2] <- 1
Datasetname$new_var[Datasetname$old_var == 1] <- 2

# 'old_var' - recoding into new categories --> 'new_var' character
Datasetname$new_var[Datasetname$old_var == 2] <- "No"
Datasetname$new_var[Datasetname$old_var == 1] <- "Yes"

# 'old_var' - recoding NA category into a new valid category --> 'new_var' 
Data4$new_var[is.na(Datasetname$old_var)] <- 0

# 'old_var' - computing mean based on a few variables --> 'new_var' 
Data4$new_var=rowMeans(Datasetname[,c("var1", "var2", "var3", "var4", "var5", "var6")], na.rm=TRUE)

# After all recoding you might want to subset data again

# Another useful thing is checking how many cases have missing values and consider 
## what to do with data missingness - recode missing in a value or delete such cases?
row.has.na <- apply(Datasetname, 1, function(x){any(is.na(x))})
sum(row.has.na)

# This code would save another dataset, deleting all cases with some missigness (NAs for your variables)
ESS_w8_subset_with_indicators_v1 <- Datasetname[!row.has.na,]

# Check the number of columns and rows in the new dataframe
df.info()

######################################################################
###################### 4.SAVING EDITED DATA ##########################
######################################################################

# Saving edited dataset as R format data (*.RDS)
saveRDS(ESS_w8_subset_with_indicators_v1, file = "Data/ESS_w8_cleaned_v1_28022023.RDS") 

# Saving edited dataset as R *CSV format
write.csv(ESS_w8_subset_with_indicators_v1, "Data/ESS_w8_cleaned_v1_28022023.csv")

# Saving edited dataset as SPSS format (*sav)
library(haven)
write_sav(ESS_w8_subset_with_indicators_v1, "Data/ESS_w8_cleaned_v1_28022023.sav")

# Saving edited dataset as Stata format (*dta)
library(haven)
write_dta(ESS_w8_subset_with_indicators_v1, "Data/ESS_w8_cleaned_v1_28022023.dta")

# End of script ------------------------------------------------------