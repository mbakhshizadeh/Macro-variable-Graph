# LOAD YOUR PACKAGES
library(shiny)
library(wbstats)
library(ggplot2)
library(forecast)
library(plotly)
library(ggfortify)
library(tseries)
library(gridExtra)
library(docstring)
library(readr)
library(dygraphs)
library(feedeR)# show news
library(shinyWidgets)
library(here)
library(dplyr)
library(DT) # create table professionally
library(vars)
library(shinydashboard)
library(tidyverse)
library(lubridate)
library(xtable)
library(rmgarch)
library(rCharts)
library(imager)


shinyUI(fluidPage(

  column(6,offset = 4,titlePanel(title = "Macroeconomic Indicators")),
  # SidebarLayout():It creates a layout with a sidebar and main area. 


    # Sidebar panel
    sidebarPanel(
      selectInput("indicator", "Indicator",
                  choices = c("Export", "Population(Millions)","GDP(Billion)")),

      helpText("Note: Data is downloaded from www.worldbank.org directly"),
      img(src='world-bank-logo_700.jpg',height="120%", width="100%",align = "bottom")

    ),


    # Main Panel
    mainPanel(
      tabsetPanel(
        
        tabPanel("Chart",  
                 showOutput("MyPlot","nvd3")),

      tabPanel("Mortgage Rate", plotOutput("MyPlot2"), class = 'rightAlign'))

    )

)

)