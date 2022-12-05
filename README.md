# Greymodels: Shiny App for Grey Forecasting Model

Greymodels is a Shiny application providing an interactive interface for statistical modelling and forecasting using grey-based models. It covers several state of-the-art univariate and multivariate grey models. A user friendly interface allows users to easily compare the performance of different models for prediction and among others, visualize graphical plots of predicted values within user chosen confidence intervals.

## Installation

The latest release can be installed from CRAN:

``` r
install.packages("Greymodels")
```

The latest development version can be installed from GitHub:

``` r
library(devtools)
install_github("havishaJ/Greymodels")

```

## Getting started

To run the app once the package is installed, use the following
commands:

``` r
library(Greymodels)
run_app()
```

## Usage and data requirements

The `Greymodels` package includes a [Help](videos/video1.md) tab that gives the use of the package and the different models implemented and an [About Grey](videos/video3.md) tab that explain the different categories. 

User data from a spreadsheet is easily loaded via ["Browse"](data) and the interface instantly provides information regarding fitted values, forecasts and interval estimates. Further, the user may visualize the raw, fitted, forecasted data along the confidence plot. This further serves in the evaluation of the fitted approach used.  

As a matter of example, download [file1.xlsx](data/file1.xlsx) and using the models under the **Background Values** tab, we follow 

Univariate Models $\rightarrow$ Background Values $\rightarrow$ EPGM (1, 1) model $\rightarrow$ Data Input

See an [animated guide](videos/video2.md) on how to use the data.

An example of how to use the extended grey model **EGM (1, 1) model** under the **Extended Forms** category is illustrated [here](videos/video4.md). The EGM (1, 1) model requires an in-sample data [file3.1.xlsx](data/file3.1.xlsx) and out-sample data [file3.2.xlsx](data/file3.2.xlsx). The in-sample data set is used to construct the model and the out-sample data set is used to evaluate how well it performs in predicting future values.
