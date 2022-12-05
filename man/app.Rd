\name{app_server}
\alias{ui}
\alias{server}
\alias{run_app}

\title{Runs the Shiny app
}

\description{Runs the greymodels Shiny app
}

\usage{
ui()
server(input, output)
run_app()
}

\arguments{
   \item{ui}{Controls the layout and appearance of the greymodels shiny app}
   \item{input}{Stores the current values of all of the widgets in the app}
   \item{output}{Contains all of the code needed to update the R objects in the app}
   \item{server}{Contains the instructions to build the greymodels shiny app}
}


\value{
No return value, runs the app
}


\examples{

# Only run this example in interactive R sessions

if (interactive()) {

library("shiny")
library("shinydashboard")
library("shinyWidgets")
library("readxl")
library("Metrics")
library("particle.swarm.optimisation")
library("cmna")
library("expm")
library("plotly")
library("ggplot2")
library("scales")
library("dplyr")

run_app <- function(){

  shiny::shinyApp(ui, server, options = list(launch.browser = TRUE))
}

}
}
