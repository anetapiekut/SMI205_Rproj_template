README for SMI205 Rproj template
================
Aneta Piekut
2023-02-27

- <a href="#1-a-rproj-template" id="toc-1-a-rproj-template">1. A Rproj
  template</a>
  - <a href="#11-workflow---a-template"
    id="toc-11-workflow---a-template">1.1. Workflow - a template</a>
  - <a href="#12-r-script---templates" id="toc-12-r-script---templates">1.2.
    R script - templates</a>
- <a href="#2-renv-package" id="toc-2-renv-package">2. <code>renv</code>
  package</a>
  - <a href="#21-how-to-work-with-renv-package"
    id="toc-21-how-to-work-with-renv-package">2.1. How to work with
    <code>renv</code> package</a>
  - <a href="#22-trouble-shooting-with-renv-package"
    id="toc-22-trouble-shooting-with-renv-package">2.2. Trouble shooting
    with <code>renv</code> package</a>
- <a href="#3-before-submiting-your-work"
  id="toc-3-before-submiting-your-work">3. Before submiting your work</a>
- <a href="#4-my-enviroment" id="toc-4-my-enviroment">4. My enviroment</a>

> Click on the button **‘\< \>Code’** and select **‘Download Zip’** to
> download all files in this project onto your computer.

# 1. A Rproj template

This is a R project template for Assessment 1. While checking
reproducibility of one selected model from a paper published in a ‘good
quality’ journal of social sciences, you still need to organise your
work in a way, so other researchers, including your instructors, can
easily understand your work.

This is done by using a robust workflow and preparing a transparent
documentation for all tasks.

## 1.1. Workflow - a template

Note, in the R project folder, there are a few folders for different
kinds of files:

- Data
- Scripts
- Outputs
- Reports

Feel free to remove and add more folders, including creating another
layer of folders in each of them. The way your workspace is organised
should be aligned with the project needs.

Project TIER Protocol 4.0
(<https://www.projecttier.org/tier-protocol/protocol-4-0/>) offers an
excellent guide for what to include and how to organise reproduction
documentation for a project based on quantiative methods.

## 1.2. R script - templates

This project also contains three templates of R script which are
organised in a robust manner and include most commonly used list of
libraries and functions.

- R script for data cleaning and subsetting data to create your
  analytical sample.
- R script for main data analysis.
- R script for data visualisation.

As any template, they are here to help you, but can be further improved
and its structure revised for your work.

You can use this template to create a new script for a paper without a
replication package, or improve pieces of code in a R script available
for your chosen paper.

> Tip: when working with a R script available for a paper, do not edit
> it, but create a new R script. So ideally, you want to have an
> original script in your folder, as well as a brand new R Script
> containing your work.

# 2. `renv` package

The Template.Rproj was created without using `renv` package, yet, you
should consider using it. The `renv` package helps you to create a
reproducible environment for your R project. Read more here:
<https://rstudio.github.io/renv/>.

It saves information about R and loaded packages. So if you later (after
any R updates or changes in the packages) or other people open your
Rproj, it will recreate the same environment, and will not use the
central libraries installed on a computer ([Joseph
2022](https://medium.com/@adrian.joseph/renv-make-r-environment-reproducible-414d88c683aa)).

## 2.1. How to work with `renv` package

It is likely you will need to install new packages and would like to
change the saved local libraries. There are three important commands in
the package to do so:

- Call `renv::init()` to initialise a new project-local environment with
  a private R library.
- Call `renv::snapshot()` to save the state of the project library to
  the lockfile (called renv.lock).
- Call `renv::restore()` to recall the packages and version the last
  time you called `renv::snapshot()`.

They are called automatically when you work in RProj and initiate `renv`
at the start.

## 2.2. Trouble shooting with `renv` package

Here is a useful guide by Joseph A. (2022). renv: make R environment
reproducible. URL:
<https://medium.com/@adrian.joseph/renv-make-r-environment-reproducible-414d88c683aa>
(accessed 09/02/2023).

# 3. Before submiting your work

Transparency checklist:

- Are all files organised and saved in relevant folders?
- Are all files, variables and R objects named and organised in a way,
  so their role is clear?
- Have you updated / created a README file introducing your project?
- Is a replication package or any other files provided by the authors
  properly referenced in your work?
- Is your project portable? Are your directory paths relative?
- Have you tested whether your project runs on a different device?

Finally, do not forget about a few technical jobs:

- Remove from the RPoj folder any unused templates before submitting
  your work.
- Make sure you save information about your workspace specifications in
  your README file (see my below).
- Anonymise your work by using Student ID instead of your name.

> Save your project on a university Google Drive, create a shareable
> link to the the folder (Share - Restricted - University of Sheffield -
> ‘Anyone in this group with the link can view’), and copy this link
> into Assessment 1 Reproducibility Check form (box on the final page).

# 4. My enviroment

Below you can find information about versions of R and specific packages
used to create this project.

``` r
sessionInfo()
```

    ## R version 4.2.2 (2022-10-31 ucrt)
    ## Platform: x86_64-w64-mingw32/x64 (64-bit)
    ## Running under: Windows 10 x64 (build 19042)
    ## 
    ## Matrix products: default
    ## 
    ## locale:
    ## [1] LC_COLLATE=English_United Kingdom.utf8 
    ## [2] LC_CTYPE=English_United Kingdom.utf8   
    ## [3] LC_MONETARY=English_United Kingdom.utf8
    ## [4] LC_NUMERIC=C                           
    ## [5] LC_TIME=English_United Kingdom.utf8    
    ## 
    ## attached base packages:
    ## [1] stats     graphics  grDevices utils     datasets  methods   base     
    ## 
    ## loaded via a namespace (and not attached):
    ##  [1] compiler_4.2.2  fastmap_1.1.0   cli_3.6.0       tools_4.2.2    
    ##  [5] htmltools_0.5.4 rstudioapi_0.14 yaml_2.3.7      rmarkdown_2.20 
    ##  [9] knitr_1.42      xfun_0.37       digest_0.6.31   rlang_1.0.6    
    ## [13] evaluate_0.20
