# SMI205 - replication paper template (v1, 27 February 2023)

#------------------------ DATA ANALYSIS SCRIPT -----------------------

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
#   3. Exploratory data analysis
#   4. Inferential data analysis

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

### Opening edited data with the analytical sample -------------------

# Opening data in R format (*.RDS) 
ESS_w8_cleaned_v1 <- readRDS("Data/ESS_w8_cleaned_v1_28022023.RDS")

######################################################################
###################### 4. DESCRIPTIVE STATISTICS #####################
######################################################################

# Provide description of your key dependent and independent variables 
# This could be for an entire sample or for groups if the paper compares them 
# - e.g. countries, genders, ethnic groups

# Mean value of a continous variable
library("psych")
describe(ESS_w8_cleaned_v1$variable1)

# Desriptive statistics of 1 continous variable for groups
library("psych")
describeBy(ESS_w8_cleaned_v1$variable1, group = ESS_w8_cleaned_v1$groupID, digits= 4)

# xtabs comes with a 'stats' package which is always loaded in R
# Frequency distribution of 1 categorical variables
crostab_1=xtabs(~ variable1, data=ESS_w8_cleaned_v1)
prop.table(crostab_1)

# Crosstabulate 2 categorical variables
crostab_2=xtabs(~ variable1 +vaiable2, data=ESS_w8_cleaned_v1)
prop.table(crostab_2)

### Summary tables with means

# gtsummary package https://cran.r-project.org/web/packages/gtsummary/index.html
library("gtsummary")
ESS_w8_cleaned_v1 %>% tbl_summary()
# Summary data by group, with sig. tests
ESS_w8_cleaned_v1 %>% tbl_summary(by = group) %>% add_p()

# vtable package https://cran.r-project.org/web/packages/vtable/index.html 
library("vtable")
data(dataset)
sumtable(ESS_w8_cleaned_v1,file='external_table')
# Sumamry data by group, table will be 'long' (more rows)
sumtable(ESS_w8_cleaned_v1, group = 'group', group.long = TRUE)


######################################################################
###################### 5. DATA ANALYSIS ##############################
######################################################################

### One-level models

# Linear regression with an interaction term
library("stats")
Model1 <- lm(dv ~ variable1 + variable2 + variable1:variable2, data = ESS_w8_cleaned_v1)

# Logistic regression
library("glm")
Model2 <- glm(dv ~ variable1 + variable2 + ... + , data = ESS_w8_cleaned_v1, family = "binomial")

### Multilevel models
library("lme4")

# MLM: Linear regression + random intercept
# The REML = FALSE option is used to request maximum likelihood estimation (as opposed to the default of restricted maximum likelihood estimation)
Model3 <- lmer(dv ~ variable1 + variable2 + ... + (1 | groupID), data = ESS_w8_cleaned_v1, REML = FALSE)

# MLM: Linear regression + random intercept + 3 levels (respondents --> in group 1 --> in group 2)
Model3 <- lmer(dv ~ variable1 + variable2 + ... + (1 | groupID) + (1 | group2ID), data = ESS_w8_cleaned_v1, REML = FALSE)

# MLM: Logistic regression + random intercept
Model4 <- glmer(dv ~ variable1 + variable2 + ... + (1 | groupID), data = ESS_w8_cleaned_v1, family = "binomial", nAGQ=0)

# MLM: Logistic regression + random intercept + random slope (so the relationship between dv and variable1 will vary across groups)
Model5 <- glmer(dv ~ variable1 + variable2 + ... + (1 + variable1 || groupID), data = ESS_w8_cleaned_v1, family = "binomial", nAGQ=0)


### Display results of your models

# In the console below
summary(Model_name)

# Model output in the Viewer, nice looking table (copy and paste to Word)
library("sjPlot")

# Default output 
tab_model(Model_name)

# Model output in the Viewer, nice looking table, 3 models together
tab_model(
  Model1, Model2, Model3,
  pred.labels = c("Intercept", "Variable name 1", "Variable name 2", "Interaction: Variable1*Variable2"),
  dv.labels = c("Model 1 name", "Model 2 name", "Model 3 name"),
  string.pred = "Coeffcient",
  string.ci = "Conf. Int (95%)",
  string.p = "P-Value"
)

# Read more on 'tab_model' function https://cran.r-project.org/web/packages/sjPlot/vignettes/tab_model_estimates.html

# Stargazer for HTML tables
library("stargazer")
# Simple table
stargazer(Model1, Model2, Model3, title="Results", align=TRUE)
# More specifications:
stargazer(Model1, Model2, title="Regression Results",
          dep.var.labels=c("DV1 label","DV2 label"),
          covariate.labels=c("new var label","new var label",
                             "new var label","new var label","new var label","new var label"),
          omit.stat=c("LL","ser","f"), 
          keep.stat="n", ci=TRUE, ci.level=0.90, single.row=TRUE)

# Read more on 'stargazer' function
# https://cran.r-project.org/web/packages/stargazer/vignettes/stargazer.pdf 