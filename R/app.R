if (!require("shiny")){install.packages("shiny")}
if (!require("shinydashboard")){install.packages("shinydashboard")}
if (!require("readxl")){install.packages("readxl")}
if (!require("shinyWidgets")){install.packages("shinyWidgets")}
if (!require("Metrics")){install.packages("Metrics")}
if (!require("particle.swarm.optimisation")){install.packages("particle.swarm.optimisation")}
if (!require("cmna")){install.packages("cmna")}
if (!require("expm")){install.packages("expm")}
if (!require("plotly")){install.packages("plotly")}
if (!require("ggplot2")){install.packages("ggplot2")}
if (!require("ggpubr")){install.packages("ggpubr")}
if (!require("tidyft")){install.packages("tidyft")}


# Define UI for application
ui <- dashboardPage(skin = "blue",
                    dashboardHeader(title = "Grey-based Models"),
                    dashboardSidebar(
                      sidebarMenu(
                        menuItem("About Grey", tabName = "menu_1"),
                        
                        menuItem("Univariate Models", tabName = "menu_2",
                                 menuSubItem("GM (1, 1) model", tabName = "sub_1",newtab = TRUE), 
                                 menuSubItem("Background Values", tabName = "sub_2"),
                                 menuSubItem("Extended Forms", tabName = "sub_3"), 
                                 menuSubItem("Combined Models", tabName = "sub_4"),
                                 menuSubItem("Parameters Estimation", tabName = "sub_5"), 
                                 menuSubItem("Optimization", tabName = "sub_6"),
                                 menuSubItem("Residual Modification", tabName = "sub_7")), 
                        
                        menuItem("Multivariate Models", tabName = "menu_3",
                                 menuSubItem("Multivariable Sequences", tabName = "sub_8"), 
                                 menuSubItem("Multivariable Interval Sequence", tabName = "sub_9")
                        ),
                        
                        menuItem("License", tabName = "menu_4"
                        )
                      ),
                      textOutput("res")
                    ),
                    
                    
                    
                    dashboardBody(
                      
                      tabItems(
                        tabItem(tabName = "menu_1", 
                                fluidRow(
                                  h1("A USER INTERFACE FOR GREY FORECASTING MODELS"),
                                  column(width = 12,
                                         box(
                                           title = "About the Package", width = NULL, solidHeader = TRUE, status = "primary",collapsible = TRUE,collapsed = TRUE,
                                           "The greymodels package is an interactive interface for statistical modelling and forecasting using grey-based models.
                                           It covers several state-of-the-art univariate and multivariate grey models. A user friendly interface allows users to 
                                           easily compare the performance of different models for prediction and among others, visualize graphical plots of 
                                           predicted values within user chosen confidence intervals."
                                         ),
                                         box(
                                           title = "GM (1, 1) model", width = NULL, solidHeader = TRUE, status = "primary",collapsible = TRUE,collapsed = TRUE,
                                           "The grey model GM (1, 1) is a time series model for predicting short-term problems and achieves satisfactory results 
                                           with only a few data points. Practically, modelling approaches are often limited by unavailability of sufficient data
                                           or the requirement of some underlying statistical distribution properties in the data. Grey models however are able to 
                                           handle data sets and yield satisfactory prediction results. The GM (1, 1) model works well with sequences that obeys 
                                           pure homogeneous exponential law."
                                         ),
                                         box(
                                           title = "Background Values", width = NULL, solidHeader = TRUE, status = "primary",collapsible = TRUE,collapsed = TRUE,
                                           "The background value is important in grey modelling as it influences the applicability and forecasting performance of 
                                           the model. The grey development coefficient a and the grey controlled variable b in the GM (1, 1) model are obtained by 
                                           the least squares method which depends on the background value. Different background values influence the values of a 
                                           and b and affect the forecasting accuracy of the model. The function of the background value is to improve the modeling 
                                           of the time series by smoothing the data and also explore the components that cause the regular changes in the time 
                                           series. The Improved Background Values category contains different models to calculate new background values to improve 
                                           the accuracy of the grey model."
                                         ),
                                         box(
                                           title = "Extended Forms", width = NULL, solidHeader = TRUE, status = "primary",collapsible = TRUE,collapsed = TRUE,
                                           "The GM (1, 1) model is appropriate when dealing with homogeneous exponential data sequences. The model however 
                                           usually fails to produce good results if the original data sequence lacks conformity to the homogeneous exponential
                                           growth, leading to huge performance defects of the model. To deal with such challenges, several extended forms of 
                                           grey model have been proposed by researchers. For instance, the VSSGM (1, 1) model is a grey forecasting model to 
                                           simulate and forecast non-homogeneous exponential data sequence with perturbation terms."
                                         ),
                                         box(
                                           title = "Combined Models", width = NULL, solidHeader = TRUE, status = "primary",collapsible = TRUE,collapsed = TRUE,
                                           "To improve the forecasting accuracy of the basic grey model, several hybrids and modified grey-based models have
                                           been proposed in the literature, for instance the grey-Bernoulli model (NGBM (1, 1)), trigonometric grey model
                                           (TGM (1, 1)) among others."
                                         ),
                                         box(
                                           title = "Paramters Estimation", width = NULL, solidHeader = TRUE, status = "primary",collapsible = TRUE,collapsed = TRUE,
                                           "The grey model and many improved models are based on sequences having exponential trend while there are other improved grey forecasting 
                                           models which are based on non-homogeneous sequences, for instance the non-linear grey (NGM) model."
                                         ),
                                         box(
                                           title = "Residual Modification", width = NULL, solidHeader = TRUE, status = "primary",collapsible = TRUE,collapsed = TRUE,
                                           "To increase the forecasting accuracy of the original GM (1, 1) model, researchers have developed the residual GM (1,1) model. 
                                           A residual modification model, also called a remnant GM (1, 1) model, is usually constructed by first building the original 
                                           GM (1, 1) model, and then create the residual GM (1, 1) model to modify the predicted values obtained by the original model."
                                         ),
                                         box(
                                           title = "Multivariate Models", width = NULL, solidHeader = TRUE, status = "primary",collapsible = TRUE,collapsed = TRUE,
                                           "The GM (1, n) model has ons system behaviour sequence and n - 1 related factors sequences. The model is the 
                                           extension of the GM (1, 1) model that considers the impact of related factors on the system behaviour data. Many 
                                           researchers have also proposed grey prediction models based on interval grey number sequences, where interval 
                                           information of the variable is considered rather than the real values in the grey forecasting model."
                                         )
                                  )
                                )
                        ),
                        
                        
                        tabItem(tabName = "menu_4", 
                                h1("GNU GENERAL PUBLIC LICENSE (GPL-3)"),
                                p("This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by 
                                the Free Software Foundation (version 3 of the License). This program is distributed in the hope that it will be useful,
                                but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See GNU General Public License for more details. 
                                Link: <https://www.gnu.org/licenses/>.")
                                
                        ),
                        
                        
                        tabItem(tabName = "sub_1", 
                                h1("Forecasting using GM (1, 1) model"),
                                fluidRow(
                                  tabsetPanel(              
                                    tabPanel(title = "Input & Forecasts",
                                             column(width = 6,
                                                    box(
                                                      title = "Data Input", width = NULL, height = 200, solidHeader = TRUE, status = "primary",
                                                      "Step 1: Load data from spreadsheet",
                                                      fileInput('file1', 'Input data: Search for file',
                                                                accept = c(".xlsx")
                                                      )
                                                    ),
                                                    box(
                                                      title = "Actual and Fitted Values", width = NULL, height = 700,solidHeader = TRUE, status = "primary",
                                                      "Actual and fitted values are displayed here.",
                                                      tableOutput("fittedgm")
                                                    )
                                             ),
                                             
                                             column(width = 6,
                                                    box(
                                                      title = "Performance Errors", width = NULL, height = 200,solidHeader = TRUE, status = "primary",
                                                      "MAPE and RMSE are displayed here.",
                                                      tableOutput("errorgm")
                                                    ),
                                                    box(
                                                      title = "Predicted Values", width = NULL, height = 300,solidHeader = TRUE, status = "primary",
                                                      "Step 2: Choose the number of forecast values to be output",
                                                      radioGroupButtons(
                                                        inputId = "radiogm",label = "No of forecasts ahead",
                                                        choices = c("1","2","3","4"),
                                                        status = "primary"
                                                      ),
                                                      verbatimTextOutput("gmpv"),
                                                      tableOutput("predictedgm")
                                                    ),
                                                    box(
                                                      title = "Prediction Intervals", width = NULL, height = 400,solidHeader = TRUE, status = "primary",
                                                      "Step 3: Choose from three possible confidence intervals",
                                                      radioGroupButtons(
                                                        inputId = "radiocigm",label = "Level of confidence (%)",choices = c("90", "95", "99"),
                                                        status = "primary"
                                                      ),
                                                      verbatimTextOutput("ci1"),
                                                      tableOutput("intervalsgm")
                                                    )
                                             )
                                    ),
                                    
                                    tabPanel(title = "Plots",
                                             column(width = 12,
                                                    box(
                                                      title = "Plots", width = NULL, height = 700,solidHeader = TRUE, status = "primary",
                                                      "Graphs are displayed here.",
                                                      plotlyOutput("plotgm")
                                                    )
                                             )
                                    )
                                  )
                                  
                                ),  
                        ), 
                        
                        
                        tabItem(tabName = "sub_2", 
                                fluidRow(
                                  h1("Improved Background Values"),
                                  tabsetPanel(              
                                    tabPanel(title = "Input & Forecasts",
                                             box(
                                               title = "Grey models based on improved background values",width = 12, 
                                               solidHeader = TRUE, status = "primary",
                                               "Step 1: Choose a grey model",
                                               radioGroupButtons(
                                                 inputId = "radiobv",
                                                 choices = c("EPGM (1, 1) model", "TBGM (1, 1) model", "IGM (1, 1) model", "GM (1, 1, 4) model"),
                                                 status = "primary"),
                                               verbatimTextOutput("bv")
                                             ),
                                             
                                             column(width = 6,
                                                    box(
                                                      title = "Data Input",solidHeader = TRUE, width = NULL, height = 175, status = "primary",
                                                      "Step 2: Load data from spreadsheet",
                                                      fileInput('file2', 'Input data: Search for file',
                                                                accept = c(".xlsx")
                                                      )
                                                    ),
                                                    
                                                    box(
                                                      title = "Performance errors", width = NULL, height = 175, solidHeader = TRUE, status = "primary",
                                                      "MAPE and RMSE are displayed here.",
                                                      tableOutput("errorbv")
                                                    ),
                                                    box(
                                                      title = "Predicted Values", width = NULL, height = 300, solidHeader = TRUE, status = "primary",
                                                      "Step 3: Choose the number of forecast values to be output",
                                                      radioGroupButtons(
                                                        inputId = "radiobv1",label = "No of forecasts ahead",
                                                        choices = c("1","2","3","4"),
                                                        status = "primary"
                                                      ),
                                                      verbatimTextOutput("bvpv"),
                                                      tableOutput("predictedbv")
                                                    ),
                                                    box(
                                                      title = "Prediction Intervals",  width = NULL,height = 400, solidHeader = TRUE, status = "primary",
                                                      "Step 4: Choose from three possible confidence intervals",
                                                      radioGroupButtons(
                                                        inputId = "radiobv2",label = "Level of confidence (%)",choices = c("90", "95", "99"),
                                                        status = "primary"
                                                      ),
                                                      verbatimTextOutput("cibv"),
                                                      tableOutput("intervalsbv")
                                                    )
                                             ),
                                             
                                             column(width = 6,
                                                    box(
                                                      title = "Actual and Fitted Data", width = NULL,height = 700, solidHeader = TRUE,status = "primary",
                                                      "Actual and fitted values are displayed here.",
                                                      tableOutput("x0capbv")
                                                    ),
                                                    
                                             )
                                    ),
                                    
                                    tabPanel(title = "Plots",
                                             column(width = 12,
                                                    box(
                                                      title = "Plots", width = NULL, height = 700,solidHeader = TRUE, status = "primary",
                                                      "Graphs are displayed here.",
                                                      plotlyOutput("plotbv")
                                                    )
                                             )
                                    )
                                  )
                                  
                                ), 
                        ), 
                        
                        
                        tabItem(tabName = "sub_3", 
                                fluidRow(
                                  h1("Extended Forms"),
                                  tabsetPanel(              
                                    tabPanel(title = "In sample: Input & Forecasts",
                                             box(
                                               title = "Extended forms of grey models",width = 12, 
                                               solidHeader = TRUE, status = "primary",
                                               "Step 1: Choose a grey model",
                                               radioGroupButtons(
                                                 inputId = "radioef",
                                                 choices = c("DGM (1, 1)", "DGM (2, 1)","ODGM (2, 1)", "NDGM (1, 1)", "VSSGM (1, 1)",
                                                             "GOM (1, 1)", "GOM_IA (1, 1)", "unbiased GOM (1, 1)", 
                                                             "EXGM (1, 1)"),
                                                 status = "primary"
                                               ),
                                               verbatimTextOutput("ef")
                                             ),
                                             
                                             column(width=6,
                                                    box(
                                                      title = "Data Input",solidHeader = TRUE, width = NULL, height = 175, status = "primary",
                                                      "Step 2 : Load data from spreadsheet",
                                                      fileInput('file3', 'Input data: Search for file',
                                                                accept = c(".xlsx")
                                                      )
                                                    ),
                                                    
                                                    box(
                                                      title = "Performance Errors", width = NULL, height = 175, solidHeader = TRUE, status = "primary",
                                                      "MAPE and RMSE are displayed here.",
                                                      tableOutput("erroref")
                                                    ),
                                                    
                                                    box(
                                                      title = "Predicted Values", width = NULL, height = 300, solidHeader = TRUE, status = "primary",
                                                      "Step 3: Choose the number of forecast values to be output",
                                                      radioGroupButtons(
                                                        inputId = "radioef1",label = "No of forecasts ahead",
                                                        choices = c("1","2","3","4"),
                                                        status = "primary"
                                                      ),
                                                      verbatimTextOutput("efpv"),
                                                      tableOutput("predictedef")
                                                    ),
                                                    
                                                    box(
                                                      title = "Prediction Intervals",  width = NULL,height = 400, solidHeader = TRUE, status = "primary",
                                                      "Step 4: Choose from three possible confidence intervals",
                                                      radioGroupButtons(
                                                        inputId = "radioef2",label = "Level of confidence (%)",choices = c("90", "95", "99"),
                                                        status = "primary"
                                                      ),
                                                      verbatimTextOutput("cief"),
                                                      tableOutput("intervalsef")
                                                    )
                                             ),
                                             
                                             column(width = 6,
                                                    box(
                                                      title = "Actual and Fitted Data", width = NULL,height = 700, solidHeader = TRUE,status = "primary",
                                                      "Actual and fitted values are displayed here.",
                                                      tableOutput("x0capef")
                                                    ),
                                             )
                                    ),
                                    
                                    tabPanel(title = "Plots",
                                             column(width = 12,
                                                    box(
                                                      title = "Plots", width = NULL, height = 700,solidHeader = TRUE, status = "primary",
                                                      "Graphs are displayed here.",
                                                      
                                                      plotlyOutput("plotef")
                                                    )
                                             )
                                    ),
                                    
                                    tabPanel(title = "In & Out Samples: Input & Forecasts",
                                             column(width = 12,
                                                    box(
                                                      title = "Extended forms of grey models",width = NULL, 
                                                      solidHeader = TRUE, status = "primary",
                                                      "Step 1: Choose a grey model",
                                                      radioGroupButtons(
                                                        inputId = "radiooutef",
                                                        choices = c("EGM (1, 1) model"),
                                                        status = "primary"
                                                      ),
                                                      verbatimTextOutput("outef")
                                                    ),   
                                                    
                                             ),
                                             
                                             column(width=6,
                                                    box(
                                                      title = "In-Sample Data",solidHeader = TRUE, width = NULL, height = 175, status = "primary",
                                                      "Step 2 : Load training data set from spreadsheet",
                                                      fileInput('file31', 'Input data: Search for file',
                                                                accept = c(".xlsx")
                                                      )
                                                    ),
                                                    
                                                    box(
                                                      title = "Performance Errors", width = NULL, height = 175, solidHeader = TRUE, status = "primary",
                                                      "MAPE and RMSE are displayed here.",
                                                      tableOutput("erroroutef")
                                                    ),
                                                    
                                                    box(
                                                      title = "Predicted Values", width = NULL, height = 300, solidHeader = TRUE, status = "primary",
                                                      "Step 3: Choose the number of forecast values to be output",
                                                      radioGroupButtons(
                                                        inputId = "radiooutef1",label = "No of forecasts ahead",
                                                        choices = c("1","2","3","4"),
                                                        status = "primary"
                                                      ),
                                                      verbatimTextOutput("efoutpv"),
                                                      tableOutput("predictedoutef")
                                                    ),
                                                    
                                                    box(
                                                      title = "Prediction Intervals",  width = NULL,height = 400, solidHeader = TRUE, status = "primary",
                                                      "Step 4: Choose from three possible confidence intervals",
                                                      radioGroupButtons(
                                                        inputId = "radiooutef2",label = "Level of confidence (%)",choices = c("90", "95", "99"),
                                                        status = "primary"
                                                      ),
                                                      verbatimTextOutput("cioutef"),
                                                      tableOutput("intervalsoutef")
                                                    )
                                             ),
                                             
                                             column(width = 6,
                                                    box(
                                                      title = "Out-Sample Data",solidHeader = TRUE, width = NULL, height = 175, status = "primary",
                                                      "Step 3: Load testing data set from spreadsheet",
                                                      fileInput('file311', 'Input data: Search for file',
                                                                accept = c(".xlsx")
                                                      )
                                                    ),
                                                    
                                                    box(
                                                      title = "Actual and Fitted Data", width = NULL,height = 700, solidHeader = TRUE,status = "primary",
                                                      "Actual and fitted values are displayed here.",
                                                      tableOutput("x0capoutef")
                                                    ),
                                             )
                                             
                                             
                                    ),
                                    
                                    tabPanel(title = "Plots",
                                             column(width = 12,
                                                    box(
                                                      title = "Plots", width = NULL, height = 700,solidHeader = TRUE, status = "primary",
                                                      "Graphs are displayed here.",
                                                      plotlyOutput("plotoutef"),
                                                      
                                                    )
                                             )
                                    )
                                  )
                                  
                                ), 
                        ),               
                        
                        tabItem(tabName = "sub_4", 
                                fluidRow(
                                  h1("Combined Models"),
                                  tabsetPanel(              
                                    tabPanel(title = "Input & Forecasts",
                                             box(
                                               title = "Grey models combined with other models",width = 12, 
                                               solidHeader = TRUE, status = "primary",
                                               "Step 1: Choose a grey model",
                                               radioGroupButtons(
                                                 inputId = "radiocm",
                                                 choices = c("NGBM (1, 1) model", "GGVM (1, 1) model", "TFDGM (1, 1) model"),
                                                 status = "primary"
                                               ),
                                               verbatimTextOutput("cm")
                                             ),
                                             column(width = 6,
                                                    box(
                                                      title = "Data Input",solidHeader = TRUE, width = NULL, height = 175, status = "primary",
                                                      "Step 2: Load data from spreadsheet",
                                                      fileInput('file4', 'Input data: Search for file',
                                                                accept = c(".xlsx")
                                                      )
                                                    ),
                                                    
                                                    box(
                                                      title = "Performance Errors",  width = NULL, height = 175, solidHeader = TRUE, status = "primary",
                                                      "MAPE and RMSE are displayed here.",
                                                      tableOutput("errorcm")
                                                    ),
                                                    
                                                    box(
                                                      title = "Predicted Values", width = NULL, height = 300, solidHeader = TRUE, status = "primary",
                                                      "Step 3: Choose the number of forecast values to be output",
                                                      radioGroupButtons(
                                                        inputId = "radiocm1",label = "No of forecasts ahead",
                                                        choices = c("1","2","3","4"),
                                                        status = "primary"
                                                      ),
                                                      verbatimTextOutput("cmpv"),
                                                      tableOutput("predictedcm")
                                                    ),
                                                    
                                                    box(
                                                      title = "Prediction Intervals",  width = NULL,height = 400, solidHeader = TRUE, status = "primary",
                                                      "Step 4: Choose from three possible confidence intervals",
                                                      radioGroupButtons(
                                                        inputId = "radiocm2",label = "Level of confidence (%)",choices = c("90", "95", "99"),
                                                        status = "primary"
                                                      ),
                                                      verbatimTextOutput("cicm"),
                                                      tableOutput("intervalscm")
                                                    )
                                             ),
                                             
                                             column(width = 6,
                                                    box(
                                                      title = "Actual and Fitted Data", width = NULL,height = 700, solidHeader = TRUE,status = "primary",
                                                      "Actual and fitted values are displayed here.",
                                                      tableOutput("x0capcm")
                                                    ),
                                             )
                                    ),
                                    tabPanel(title = "Plots",
                                             column(width = 12,
                                                    box(
                                                      title = "Plots", width = NULL, height = 700,solidHeader = TRUE, status = "primary",
                                                      "Graphs are displayed here.",
                                                      plotlyOutput("plotcm")
                                                    )
                                             )
                                    )
                                  )
                                  
                                )
                        ), 
                        
                        
                        tabItem(tabName = "sub_5", 
                                fluidRow(
                                  h1("Paramters Estimation of Grey Models"),
                                  tabsetPanel(              
                                    tabPanel(title = "Input & Forecasts",
                                             box(
                                               title = "Paramters Estimation",width = 12, 
                                               solidHeader = TRUE, status = "primary",
                                               "Step 1: Choose a grey model",
                                               radioGroupButtons(
                                                 inputId = "radiope",
                                                 choices = c("SOGM (2, 1) model", "NGM (1, 1, k) model", 
                                                             "NGM (1, 1, k, c) model", "ONGM (1, 1, k, c) model"),
                                                 status = "primary"
                                               ),
                                               verbatimTextOutput("pe")
                                             ),
                                             column(width = 6,
                                                    box(
                                                      title = "Data Input",solidHeader = TRUE, width = NULL, height = 175, status = "primary",
                                                      "Step 2: Load data from spreadsheet",
                                                      fileInput('file5', 'Input data: Search for file',
                                                                accept = c(".xlsx")
                                                      )
                                                    ),
                                                    
                                                    box(
                                                      title = "Performance errors",  width = NULL, height = 175, solidHeader = TRUE, status = "primary",
                                                      "MAPE and RMSE are displayed here.",
                                                      tableOutput("errorpe")
                                                    ),
                                                    
                                                    box(
                                                      title = "Predicted Values", width = NULL, height = 300, solidHeader = TRUE, status = "primary",
                                                      "Step 3: Choose the number of forecast values to be output",
                                                      radioGroupButtons(
                                                        inputId = "radiope1",label = "No of forecasts ahead",
                                                        choices = c("1","2","3","4"),
                                                        status = "primary"
                                                      ),
                                                      verbatimTextOutput("pepv"),
                                                      tableOutput("predictedpe")
                                                    ),
                                                    
                                                    box(
                                                      title = "Prediction Intervals",  width = NULL,height = 400, solidHeader = TRUE, status = "primary",
                                                      "Step 4: Choose from three possible confidence intervals",
                                                      radioGroupButtons(
                                                        inputId = "radiope2",label = "Level of confidence (%)",choices = c("90", "95", "99"),
                                                        status = "primary"
                                                      ),
                                                      verbatimTextOutput("cipe"),
                                                      tableOutput("intervalspe")
                                                    )
                                             ),
                                             
                                             column(width = 6,
                                                    box(
                                                      title = "Actual and Fitted Data", width = NULL,height = 700, solidHeader = TRUE,status = "primary",
                                                      "Actual and fitted values are displayed here.",
                                                      tableOutput("x0cappe")
                                                    ),
                                             )
                                    ),
                                    
                                    tabPanel(title = "Plots",
                                             column(width = 12,
                                                    box(
                                                      title = "Plots", width = NULL, height = 700,solidHeader = TRUE, status = "primary",
                                                      "Graphs are displayed here.",
                                                      plotlyOutput("plotpe")
                                                    )
                                             )
                                    )
                                  )
                                  
                                )
                        ), 
                        
                        
                        tabItem(tabName = "sub_6", 
                                fluidRow(
                                  h1("Optimization"),
                                  tabsetPanel(              
                                    tabPanel(title = "Input & Forecasts",
                                             box(
                                               title = "Grey models based on Optimization",width = 12, 
                                               solidHeader = TRUE, status = "primary",
                                               "Step 1: Choose a grey model",
                                               radioGroupButtons(
                                                 inputId = "radioopt",
                                                 choices = c("PSO-GM (1, 1) model", "EGM (1, 1, r) model", "ANDGM (1, 1) model"),
                                                 status = "primary"
                                               ),
                                               verbatimTextOutput("opt")
                                             ),
                                             column(width = 6,
                                                    
                                                    box(
                                                      title = "Data Input",solidHeader = TRUE, width = NULL, height = 175, status = "primary",
                                                      "Step 2: Load data from spreadsheet",
                                                      fileInput('file6', 'Input data: Search for file',
                                                                accept = c(".xlsx")
                                                      )
                                                    ),
                                                    
                                                    box(
                                                      title = "Performance errors",  width = NULL, height = 175, solidHeader = TRUE, status = "primary",
                                                      "MAPE and RMSE are displayed here.",
                                                      tableOutput("erroropt")
                                                    ),
                                                    
                                                    box(
                                                      title = "Predicted Values", width = NULL, height = 300, solidHeader = TRUE, status = "primary",
                                                      "Step 3: Choose the number of forecast values to be output",
                                                      radioGroupButtons(
                                                        inputId = "radioopt1",label = "No of forecasts ahead",
                                                        choices = c("1","2","3","4"),
                                                        status = "primary"
                                                      ),
                                                      verbatimTextOutput("optpv"),
                                                      tableOutput("predictedopt")
                                                    ),
                                                    
                                                    box(
                                                      title = "Prediction Intervals",  width = NULL,height = 400, solidHeader = TRUE, status = "primary",
                                                      "Step 4: Choose from three possible confidence intervals",
                                                      radioGroupButtons(
                                                        inputId = "radioopt2",label = "Level of confidence (%)",choices = c("90", "95", "99"),
                                                        status = "primary"
                                                      ),
                                                      verbatimTextOutput("ciopt"),
                                                      tableOutput("intervalsopt")
                                                    )
                                             ),
                                             column(width = 6,
                                                    box(
                                                      title = "Optimized Value",  width = NULL, height = 175, solidHeader = TRUE, status = "primary",
                                                      "Optimal value of parameter(s) displayed here.",
                                                      tableOutput("optval")
                                                    ),
                                                    
                                                    box(
                                                      title = "Actual and Fitted Data", width = NULL,height = 700, solidHeader = TRUE,
                                                      status = "primary",
                                                      "Actual and fitted values are displayed here.",
                                                      tableOutput("x0capopt")
                                                    ),
                                             )
                                    ),
                                    
                                    tabPanel(title = "Plots",
                                             column(width = 12,
                                                    box(
                                                      title = "Plots", width = NULL, height = 700,solidHeader = TRUE, status = "primary",
                                                      "Graphs are displayed here.",
                                                      plotlyOutput("plotopt")
                                                    )
                                             )
                                    )
                                  )
                                  
                                )
                        ), 
                        
                        tabItem(tabName = "sub_7", 
                                fluidRow(
                                  h1("Residual Modification"),
                                  tabsetPanel(              
                                    tabPanel(title = "Input & Forecasts",
                                             box(
                                               title = "Grey models based on residual modification",width = 12, 
                                               solidHeader = TRUE, status = "primary",
                                               "Step 1: Choose a grey model",
                                               radioGroupButtons(
                                                 inputId = "radiorm",
                                                 choices = c("Remnant GM (1, 1) model", "TGM (1, 1) model"),
                                                 status = "primary"
                                               ),
                                               verbatimTextOutput("rm")
                                             ),
                                             
                                             column(width = 6,
                                                    box(
                                                      title = "In-Sample Data",solidHeader = TRUE, width = NULL, height = 175, status = "primary",
                                                      "Step 2: Load data from spreadsheet",
                                                      fileInput('file7', 'Input data: Search for file',
                                                                accept = c(".xlsx")
                                                      )
                                                    ),
                                                    box(
                                                      title = "Performance errors",  width = NULL, height = 175, solidHeader = TRUE, status = "primary",
                                                      "MAPE and RMSE are displayed here.",
                                                      tableOutput("errorrm")
                                                    ),
                                                    
                                                    box(
                                                      title = "Predicted Values", width = NULL, height = 300, solidHeader = TRUE, status = "primary",
                                                      "Step 4: Choose the number of forecast values to be output",
                                                      radioGroupButtons(
                                                        inputId = "radiorm1",label = "No of forecasts ahead",
                                                        choices = c("1","2","3","4"),
                                                        status = "primary"
                                                      ),
                                                      verbatimTextOutput("rmpv"),
                                                      tableOutput("predictedrm")
                                                    ),
                                                    
                                                    box(
                                                      title = "Prediction Intervals",  width = NULL,height = 400, solidHeader = TRUE, status = "primary",
                                                      "Step 5: Choose from three possible confidence intervals",
                                                      radioGroupButtons(
                                                        inputId = "radiorm2",label = "Level of confidence (%)",choices = c("90", "95", "99"),
                                                        status = "primary"
                                                      ),
                                                      verbatimTextOutput("cirm"),
                                                      tableOutput("intervalsrm")
                                                    )
                                             ),
                                             column(width = 6,
                                                    box(
                                                      title = "Out-Sample Data",solidHeader = TRUE, width = NULL, height = 175, status = "primary",
                                                      "Step 3: Load out-of-data from spreadsheet",
                                                      fileInput('file71', 'Input data: Search for file',
                                                                accept = c(".xlsx")
                                                      )
                                                    ),
                                                    box(
                                                      title = "Actual and Fitted Data", width = NULL,height = 700, solidHeader = TRUE,
                                                      status = "primary",
                                                      "Actual and fitted values are displayed here.",
                                                      tableOutput("x0caprm")
                                                    ),
                                             )
                                    ),
                                    
                                    tabPanel(title = "Plots",
                                             column(width = 12,
                                                    box(
                                                      title = "Plots", width = NULL, height = 700,solidHeader = TRUE, status = "primary",
                                                      "Graphs are displayed here.",
                                                      plotlyOutput("plotrm")
                                                    )
                                             )
                                    )
                                  )
                                  
                                )
                        ), 
                        
                        
                        
                        tabItem(tabName = "sub_8", 
                                fluidRow(
                                  h1("Multivariable Sequences"),
                                  tabsetPanel(              
                                    tabPanel(title = "In-sample: Input & Forecasts",
                                             box(
                                               title = "Multivariate Grey models",width = 12, 
                                               solidHeader = TRUE, status = "primary",
                                               "Step 1: Choose a grey model",
                                               radioGroupButtons(
                                                 inputId = "radiomv",
                                                 choices = c("GM (1, 3) model", "IGM (1, 3) model", 
                                                             "NHMGM_1 (1, 2) model","NHMGM_2 (1, 2) model"),
                                                 status = "primary"
                                               ),
                                               verbatimTextOutput("mv")
                                             ),
                                             column(width = 6,
                                                    box(
                                                      title = "Data Input",solidHeader = TRUE, width = NULL, height = 175, status = "primary",
                                                      "Step 2: Load data from spreadsheet",
                                                      fileInput('file8', 'Input data: Search for file',
                                                                accept = c(".xlsx")
                                                      )
                                                    ),
                                                    box(
                                                      title = "Performance errors",  width = NULL, height = 175, solidHeader = TRUE, status = "primary",
                                                      "MAPE and RMSE are displayed here.",
                                                      tableOutput("errormv")
                                                    ),
                                                    
                                                    box(
                                                      title = "Predicted Values", width = NULL, height = 400, solidHeader = TRUE, status = "primary",
                                                      "Step 3: Choose the number of forecast values to be output",
                                                      radioGroupButtons(
                                                        inputId = "radiomv1",label = "No of forecasts ahead",
                                                        choices = c("1","2","3","4"),
                                                        status = "primary"
                                                      ),
                                                      verbatimTextOutput("mvpv"),
                                                      tableOutput("predictedmv")
                                                    ),
                                                    
                                                    box(
                                                      title = "Prediction Intervals",  width = NULL,height = 400, solidHeader = TRUE, status = "primary",
                                                      "Step 4: Choose from three possible confidence intervals",
                                                      radioGroupButtons(
                                                        inputId = "radiomv2",label = "Level of confidence (%)",choices = c("90", "95", "99"),
                                                        status = "primary"
                                                      ),
                                                      verbatimTextOutput("cimv"),
                                                      tableOutput("intervalsmv")
                                                    )
                                             ),
                                             
                                             column(width = 6,
                                                    box(
                                                      title = "Actual and Fitted Data", width = NULL,height = 700, solidHeader = TRUE,
                                                      status = "primary",
                                                      "Actual and fitted values are displayed here.",
                                                      tableOutput("x0capmv")
                                                    ),
                                             )
                                    ),
                                    
                                    tabPanel(title = "Plots",
                                             column(width = 12,
                                                    box(
                                                      title = "Plots", width = NULL, height = 700,solidHeader = TRUE, status = "primary",
                                                      "Graphs are displayed here.",
                                                      
                                                      plotlyOutput("plotmv")
                                                    )
                                             )
                                    ),
                                    
                                    
                                    tabPanel(title = "In & Out Samples: Input & Forecasts",
                                             column(width = 12,
                                                    box(
                                                      title = "Extended forms of grey models",width = NULL, 
                                                      solidHeader = TRUE, status = "primary",
                                                      "Step 1: Choose a grey model",
                                                      radioGroupButtons(
                                                        inputId = "radiooutmv",
                                                        choices = c("GMC_g (1, 2) model","GMC (1, 2) model","DBGM (1, 2) model"),
                                                        status = "primary"
                                                      ),
                                                      verbatimTextOutput("outmv")
                                                    ),   
                                                    
                                             ),
                                             
                                             column(width=6,
                                                    box(
                                                      title = "In-Sample Data",solidHeader = TRUE, width = NULL, height = 175, status = "primary",
                                                      "Step 2 : Load data from spreadsheet",
                                                      fileInput('file81', 'Input data: Search for file',
                                                                accept = c(".xlsx")
                                                      )
                                                    ),
                                                    
                                                    box(
                                                      title = "Performance Errors", width = NULL, height = 175, solidHeader = TRUE, status = "primary",
                                                      "MAPE and RMSE are displayed here.",
                                                      tableOutput("erroroutmv")
                                                    ),
                                                    
                                                    box(
                                                      title = "Predicted Values", width = NULL, height = 300, solidHeader = TRUE, status = "primary",
                                                      "Step 3: Choose the number of forecast values to be output",
                                                      radioGroupButtons(
                                                        inputId = "radiooutmv1",label = "No of forecasts ahead",
                                                        choices = c("1","2","3","4"),
                                                        status = "primary"
                                                      ),
                                                      verbatimTextOutput("efoutmv"),
                                                      tableOutput("predictedoutmv")
                                                    ),
                                                    
                                                    box(
                                                      title = "Prediction Intervals",  width = NULL,height = 400, solidHeader = TRUE, status = "primary",
                                                      "Step 4: Choose from three possible confidence intervals",
                                                      radioGroupButtons(
                                                        inputId = "radiooutmv2",label = "Level of confidence (%)",choices = c("90", "95", "99"),
                                                        status = "primary"
                                                      ),
                                                      verbatimTextOutput("cioutmv"),
                                                      tableOutput("intervalsoutmv")
                                                    )
                                             ),
                                             
                                             column(width = 6,
                                                    box(
                                                      title = "Out-Sample Data",solidHeader = TRUE, width = NULL, height = 175, status = "primary",
                                                      "Step 3: Load out-of-data from spreadsheet",
                                                      fileInput('file811', 'Input data: Search for file',
                                                                accept = c(".xlsx")
                                                      )
                                                    ),
                                                    
                                                    box(
                                                      title = "Actual and Fitted Data", width = NULL,height = 700, solidHeader = TRUE,status = "primary",
                                                      "Actual and fitted values are displayed here.",
                                                      tableOutput("x0capoutmv")
                                                    ),
                                             )
                                             
                                             
                                    ),
                                    
                                    
                                    tabPanel(title = "Plot",
                                             column(width = 12,
                                                    box(
                                                      title = "Plots", width = NULL, height = 700,solidHeader = TRUE, status = "primary",
                                                      "Graphs are displayed here.",
                                                      plotlyOutput("plotoutmv")
                                                    )
                                             )
                                    )
                                  )
                                  
                                )
                        ), 
                        
                        tabItem(tabName = "sub_9", 
                                fluidRow(
                                  h1("Multivariable Interval Sequences"),
                                  tabsetPanel(              
                                    tabPanel(title = "In Sample: Input & Forecasts",
                                             box(
                                               title = " Interval Multivariate Grey models",width = 12, 
                                               solidHeader = TRUE, status = "primary",
                                               "Step 1: Choose a grey model",
                                               radioGroupButtons(
                                                 inputId = "radioimv",
                                                 choices = c("IG-NDGM (1, 2) model"),
                                                 status = "primary"
                                               ),
                                               verbatimTextOutput("imv")
                                             ),
                                             
                                             column(width = 6,
                                                    box(
                                                      title = "In Sample Data",solidHeader = TRUE, width = NULL, height = 175, status = "primary",
                                                      "Step 2: Load data from spreadsheet",
                                                      fileInput('file9', 'Input data: Search for file',
                                                                accept = c(".xlsx")
                                                      )
                                                    ),
                                                    box(
                                                      title = "Performance errors",  width = NULL, height = 175, solidHeader = TRUE, status = "primary",
                                                      "MAPE and RMSE are displayed here.",
                                                      tableOutput("errorimv")
                                                    ),
                                                    
                                                    box(
                                                      title = "Predicted Values", width = NULL, height = 400, solidHeader = TRUE, status = "primary",
                                                      "Step 3: Choose the number of forecast values to be output",
                                                      radioGroupButtons(
                                                        inputId = "radioimv1",label = "No of forecasts ahead",
                                                        choices = c("1","2","3","4"),
                                                        status = "primary"
                                                      ),
                                                      verbatimTextOutput("imvpv"),
                                                      tableOutput("predictedimv")
                                                    ),
                                                    
                                                    box(
                                                      title = "Prediction Intervals",  width = NULL,height = 400, solidHeader = TRUE, status = "primary",
                                                      "Step 4: Choose from three possible confidence intervals",
                                                      radioGroupButtons(
                                                        inputId = "radioimv2",label = "Level of confidence (%)",choices = c("90", "95", "99"),
                                                        status = "primary"
                                                      ),
                                                      verbatimTextOutput("ciimv"),
                                                      tableOutput("intervalsimv")
                                                    )
                                             ),
                                             
                                             column(width = 6,
                                                    box(
                                                      title = "Actual and Fitted Data", width = NULL,height = 700, solidHeader = TRUE,
                                                      status = "primary",
                                                      "Actual and fitted values are displayed here.",
                                                      tableOutput("x0capimv")
                                                    ),
                                             )
                                    ),
                                    tabPanel(title = "Plot",
                                             column(width = 12,
                                                    box(
                                                      title = "Plots", width = NULL, height = 700,solidHeader = TRUE, status = "primary",
                                                      "Graphs are displayed here.",
                                                      plotlyOutput("plotimv")
                                                    )
                                             )
                                    ),
                                    
                                    tabPanel(title = "In & Out Samples: Input & Forecasts",
                                             column(width = 12,
                                                    box(
                                                      title = "Interval Multivariate Grey models",width = NULL, 
                                                      solidHeader = TRUE, status = "primary",
                                                      "Step 1: Choose a grey model",
                                                      radioGroupButtons(
                                                        inputId = "radiooutimv",
                                                        choices = c("MDBGM (1, 2) model"),
                                                        status = "primary"
                                                      ),
                                                      verbatimTextOutput("outimv")
                                                    ),   
                                                    
                                             ),
                                             
                                             column(width=6,
                                                    box(
                                                      title = "In-Sample Data",solidHeader = TRUE, width = NULL, height = 175, status = "primary",
                                                      "Step 2 : Load data from spreadsheet",
                                                      fileInput('file91', 'Input data: Search for file',
                                                                accept = c(".xlsx")
                                                      )
                                                    ),
                                                    
                                                    box(
                                                      title = "Performance Errors", width = NULL, height = 200, solidHeader = TRUE, status = "primary",
                                                      "MAPE and RMSE are displayed here.",
                                                      tableOutput("erroroutimv")
                                                    ),
                                                    
                                                    box(
                                                      title = "Predicted Values", width = NULL, height = 350, solidHeader = TRUE, status = "primary",
                                                      "Step 3: Choose the number of forecast values to be output",
                                                      radioGroupButtons(
                                                        inputId = "radiooutimv1",label = "No of forecasts ahead",
                                                        choices = c("1","2","3","4"),
                                                        status = "primary"
                                                      ),
                                                      verbatimTextOutput("imvoutpv"),
                                                      tableOutput("predictedoutimv")
                                                    ),
                                                    
                                                    box(
                                                      title = "Prediction Intervals",  width = NULL,height = 400, solidHeader = TRUE, status = "primary",
                                                      "Step 4: Choose from three possible confidence intervals",
                                                      radioGroupButtons(
                                                        inputId = "radiooutimv2",label = "Level of confidence (%)",choices = c("90", "95", "99"),
                                                        status = "primary"
                                                      ),
                                                      verbatimTextOutput("cioutimv"),
                                                      tableOutput("intervalsoutimv")
                                                    )
                                             ),
                                             
                                             column(width = 6,
                                                    box(
                                                      title = "Out-Sample Data",solidHeader = TRUE, width = NULL, height = 175, status = "primary",
                                                      "Step 3: Load out-of-data from spreadsheet",
                                                      fileInput('file911', 'Input data: Search for file',
                                                                accept = c(".xlsx")
                                                      )
                                                    ),
                                                    
                                                    box(
                                                      title = "Actual and Fitted Data", width = NULL,height = 700, solidHeader = TRUE,status = "primary",
                                                      "Actual and fitted values are displayed here.",
                                                      tableOutput("x0capoutimv")
                                                    ),
                                             )
                                             
                                             
                                    ),
                                    
                                    tabPanel(title = "Plots",
                                             column(width = 12,
                                                    box(
                                                      title = "Plots", width = NULL, height = 700,solidHeader = TRUE, status = "primary",
                                                      "Graphs are displayed here.",
                                                      plotlyOutput("plotoutimv"),
                                                      
                                                    )
                                             )
                                    )
                                  )
                                  
                                )
                        )               
                      )
                      
                    )
)



# Define server logic
server <- function(input, output){
  
  output$res <- renderText({
    req(input$sidebarItemExpanded)
    paste("Expanded menuItem:", input$sidebarItemExpanded)
  })
  
  #' GM (1, 1) model
  #' Input original data from excel 
  dat <- reactive({
    inFile <- input$file1
    if (is.null(inFile))
      return(NULL)
    req(input$file1)
    
    dat1 <- read_excel(inFile$datapath, 1)
    dat2 <- c(dat1) 
    dat3 <- as.numeric(unlist(dat2))
    
  })
  
  #' Input original data from excel - Improved Background Values
  datbv <- reactive({
    inFile <- input$file2
    if (is.null(inFile))
      return(NULL)
    req(input$file2)
    
    dat1 <- read_excel(inFile$datapath, 1)
    dat2 <- c(dat1) 
    dat3 <- as.numeric(unlist(dat2))
    
  })
  
  
  #' Input original data from excel - Extended Forms
  datef <- reactive({
    inFile <- input$file3
    if (is.null(inFile))
      return(NULL)
    req(input$file3)
    
    dat1 <- read_excel(inFile$datapath, 1)
    dat2 <- c(dat1) 
    dat3 <- as.numeric(unlist(dat2))
    
  })   
  
  #' Input original data from excel - Extended Forms - In-sample
  datinef <- reactive({
    inFile <- input$file31
    if (is.null(inFile))
      return(NULL)
    req(input$file31)
    dat1 <- read_excel(inFile$datapath, 1)
    
    if (ncol(dat1) == 2 ) {
      dat2 <- data.frame(dat1)
    } else {
      dat2 <- c(dat1) 
      dat3 <- as.numeric(unlist(dat2))
    }
    
  })  
  
  #' Input original data from excel - Extended Forms - Out-sample
  datoutef <- reactive({
    inFile <- input$file311
    if (is.null(inFile))
      return(NULL)
    req(input$file311)
    dat1 <- read_excel(inFile$datapath, 1)
    
    if (ncol(dat1) == 2 ) {
      dat2 <- data.frame(dat1)
    } else {
      dat2 <- c(dat1) 
      dat3 <- as.numeric(unlist(dat2))
    }
    
  })    
  
  #' Input original data from excel - Combined Models
  datcm <- reactive({
    inFile <- input$file4
    if (is.null(inFile))
      return(NULL)
    req(input$file4)
    
    dat1 <- read_excel(inFile$datapath, 1)
    dat2 <- c(dat1) 
    dat3 <- as.numeric(unlist(dat2))
    
  })     
  
  #' Input original data from excel - Parameters Estimation
  datpe <- reactive({
    inFile <- input$file5
    if (is.null(inFile))
      return(NULL)
    req(input$file5)
    
    dat1 <- read_excel(inFile$datapath, 1)
    dat2 <- c(dat1) 
    dat3 <- as.numeric(unlist(dat2))
    
  })     
  
  #' Input original data from excel - Optimization
  datopt <- reactive({
    inFile <- input$file6
    if (is.null(inFile))
      return(NULL)
    req(input$file6)
    
    dat1 <- read_excel(inFile$datapath, 1)
    dat2 <- c(dat1) 
    dat3 <- as.numeric(unlist(dat2))
    
  })     
  
  #' Input original data from excel - Residual Modification - In-sample
  datrm <- reactive({
    inFile <- input$file7
    if (is.null(inFile))
      return(NULL)
    req(input$file7)
    
    dat1 <- read_excel(inFile$datapath, 1)
    dat2 <- c(dat1) 
    dat3 <- as.numeric(unlist(dat2))
    
  })    
  
  #' Input original data from excel - Residual Modification - Out-sample
  datoutrm <- reactive({
    inFile <- input$file71
    if (is.null(inFile))
      return(NULL)
    req(input$file71)
    
    dat1 <- read_excel(inFile$datapath, 1)
    dat2 <- c(dat1) 
    dat3 <- as.numeric(unlist(dat2))
    
  })    
  
  #' Input original data from excel - Multivariate Grey Models 
  datmv <- reactive({
    inFile <- input$file8
    if (is.null(inFile))
      return(NULL)
    req(input$file8)
    
    dat1 <- read_excel(inFile$datapath, 1)
    dat2 <- data.frame(dat1)
    
  })  
  
  
  #' Input original data from excel - Multivariate Grey Models - in sample
  datinmv <- reactive({
    inFile <- input$file81
    if (is.null(inFile))
      return(NULL)
    req(input$file81)
    
    dat1 <- read_excel(inFile$datapath, 1)
    dat2 <- data.frame(dat1)
    
  })  
  
  
  #' Input original data from excel - Multivariate Grey Models - out sample
  datoutmv <- reactive({
    inFile <- input$file811
    if (is.null(inFile))
      return(NULL)
    req(input$file811)
    
    dat1 <- read_excel(inFile$datapath, 1)
    dat2 <- data.frame(dat1)
    
  }) 
  
  
  #' Input original data from excel - Interval Multivariate Grey Models 
  datimv <- reactive({
    inFile <- input$file9
    if (is.null(inFile))
      return(NULL)
    req(input$file9)
    
    dat1 <- read_excel(inFile$datapath, 1)
    dat2 <- data.frame(dat1)
    
  }) 
  
  #' Input original data from excel - Interval Multivariate Grey Models - in sample
  datinimv <- reactive({
    inFile <- input$file91
    if (is.null(inFile))
      return(NULL)
    req(input$file91)
    
    dat1 <- read_excel(inFile$datapath, 1)
    dat2 <- data.frame(dat1)
    
  }) 
  
  
  
  #' Input original data from excel - Interval Multivariate Grey Models - out sample
  datoutimv <- reactive({
    inFile <- input$file911
    if (is.null(inFile))
      return(NULL)
    req(input$file911)
    
    dat1 <- read_excel(inFile$datapath, 1)
    dat2 <- data.frame(dat1)
    
  })      
  
  
  
  #' GM (1,1) model Fitted - reactive
  #' Fitted values 
  x0capgm11 <- reactive({
    x0 <- dat()
    x1 <- cumsum(x0)
    n <- length(x0)
    b <- numeric(n)
    for (i in 1:n){
      b[i] <- -(0.5*x1[i + 1] + 0.5*x1[i])
    }
    b1 <- b[1:n-1]
    B <- matrix(1,nrow=n-1,ncol=2)
    B[,1] <- t(t(b1[1:n-1]))
    yn <- matrix(c(x0),ncol=1)
    yn <- t(t(x0[2:n]))
    xcap <- solve (t(B) %*% B) %*% t(B) %*% yn
    a <- xcap[1,1]
    b <- xcap[2,1]
    scale_with <- function(k)
    {
      (x0[1] - (b/a)) * exp(-a*k) * (1 - exp(a))
    }
    fitted <- scale_with(1:n)
    x0cap <- c(x0[1],fitted[1:n-1])
    A <- 4
    # Predicted values
    x0cap4 <- scale_with(1 : n+A-1)
    x0cap5 <- tail(x0cap4,A)
    x0cap2 <- c(x0cap,x0cap5)
    
  })
  
  #' GM (1,1) model Actual and Fitted - render
  #' original and fitted data  
  output$fittedgm <- renderTable({
    
    Actual <- dat()
    actual2 <- t(Actual)
    n <- length(actual2)
    fitted1 <- x0capgm11()
    fitted2 <- t(fitted1)
    Fitted <- fitted2[1:n]
    dfgm11 <- data.frame(Actual,Fitted)
    
  })
  
  #' GM (1,1) model predicted data  - render
  output$predictedgm <- renderTable({
    
    output$gmpv <- renderPrint({input$radiogm})
    
    actual1 <- dat()
    actual2 <- t(dat())
    n <- length(actual2)
    fitted1 <- x0capgm11()
    x <- input$radiogm
    fitted3 <- tail(fitted1,4)
    predicted <- t(fitted3[1:x])
    
  })
  
  
  #' GM (1,1) model Error - render
  #' MAPE and RMSE
  output$errorgm <- renderTable({
    
    Actual <- dat()
    actual2 <- t(Actual)
    n <- length(actual2)
    fitted1 <- x0capgm11()
    fitted2 <- t(fitted1)
    Fitted <- fitted2[1:n]
    gm11 <- data.frame(Actual,Fitted)
    
    MAPE <- mape(Actual,Fitted)*100
    RMSE <- rmse(Actual,Fitted)
    pe <- data.frame(MAPE,RMSE)
    
  })
  
  
  #' GM (1,1) model Error - render
  #' CI for GM (1, 1) model - reactive
  output$intervalsgm <- renderTable({
    
    if (input$radiocigm == "90") {
      
      output$ci1 <- renderPrint({input$radiocigm})
      
      fp1 <- x0capgm11()
      fp2 <- t(fp1)
      w <- length(fp2)
      actual1 <- dat()
      actual2 <- t(actual1)
      n <- length(actual2)
      fitted1 <- fp2[1:n]
      fitted2 <- tail(fp1,4)
      x <- input$radiogm
      predicted <- t(fitted2[1:x])
      t <- length(predicted)
      s <- rmse(actual2, fitted1)
      sse <- sum((actual2 - fitted1)^2)
      mse <- sse / (n - 2)
      cc <- (90 + 100)/200
      t.val <- qt(cc, n - 2)
      u <- numeric(t)
      l <- numeric(t)
      for (i in 1:t) {
        u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
        l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
      }
      UpperBound <- c(u[1:t])
      LowerBound <- c(l[1:t])
      CIset <- data.frame(LowerBound,UpperBound)
      
      
    } else if (input$radiocigm == "95") {
      
      output$ci1 <- renderPrint({input$radiocigm})
      
      fp1 <- x0capgm11()
      fp2 <- t(fp1)
      w <- length(fp2)
      actual1 <- dat()
      actual2 <- t(actual1)
      n <- length(actual2)
      fitted1 <- fp2[1:n]
      fitted2 <- tail(fp1,4)
      x <- input$radiogm
      predicted <- t(fitted2[1:x])
      t <- length(predicted)
      s <- rmse(actual2, fitted1)
      sse <- sum((actual2 - fitted1)^2)
      mse <- sse / (n - 2)
      cc <- (95 + 100)/200
      t.val <- qt(cc, n - 2)
      u <- numeric(t)
      l <- numeric(t)
      for (i in 1:t) {
        u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
        l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
      }
      UpperBound <- c(u[1:t])
      LowerBound <- c(l[1:t])
      CIset <- data.frame(LowerBound,UpperBound)
      
    } else if (input$radiocigm == "99") {
      
      output$ci1 <- renderPrint({input$radiocigm})
      
      fp1 <- x0capgm11()
      fp2 <- t(fp1)
      w <- length(fp2)
      actual1 <- dat()
      actual2 <- t(actual1)
      n <- length(actual2)
      fitted1 <- fp2[1:n]
      fitted2 <- tail(fp1,4)
      x <- input$radiogm
      predicted <- t(fitted2[1:x])
      t <- length(predicted)
      s <- rmse(actual2, fitted1)
      sse <- sum((actual2 - fitted1)^2)
      mse <- sse / (n - 2)
      ci <- 99
      cc <- (ci + 100)/200
      t.val <- qt(cc, n - 2)
      u <- numeric(t)
      l <- numeric(t)
      for (i in 1:t) {
        u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
        l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
      }
      UpperBound <- c(u[1:t])
      LowerBound <- c(l[1:t])
      CIset <- data.frame(LowerBound,UpperBound)
    }
    
  })
  
  #' GM (1,1) model - render
  #' Plots for GM (1, 1) model 
  output$plotgm <- renderPlotly({
    
    if (input$radiocigm == "90") {
      
      x0 <- dat()
      n <- length(x0)
      x0cap2 <- x0capgm11()
      fitted2 <- t(x0cap2)
      x0cap <- x0cap2[1:n]
      fitted3 <- tail(x0cap2,4)
      x0cap5 <- fitted3
      w <- length(x0cap2)
      t <- length(x0cap5)
      s <- rmse(x0, x0cap)
      sse <- sum((x0 - x0cap)^2)
      mse <- sse / (n - 2)
      cc <- (90 + 100)/200
      t.val <- qt(cc, n - 2)
      u <- numeric(t)
      l <- numeric(t)
      for (i in 1:t) {
        u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
        l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
      }
      UB <- c(u[1:t])
      LB <- c(l[1:t])
      LB1 <- c(x0cap[n],LB)
      UB2 <- c(x0cap[n],UB)
      l1 <- length(LB1)
      d3 <- seq(1, l1, 1)
      u1 <- length(UB2)
      d4 <- seq(1, u1, 1)
      set3 <- data.frame(x=d3, y=LB1)
      set4 <- data.frame(x=d4, y=UB2)
      d0 <- seq(1, n, 1)
      xy1 <- data.frame(x=d0, y=x0)
      d1 <- seq(1, w, 1)
      xy2 <- data.frame(x=d1, y=x0cap2)
      df <- rbind(xy1, xy2, set3, set4)
      colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
      CI <- c(n:w)
      p <- ggplot(df) +
        theme_bw() +
        labs(title = 'Forecasting using GM (1, 1) Model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
        scale_x_continuous(breaks=1:w) +
        scale_y_continuous(labels = scales::comma) +
        geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
        geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
        geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
        geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
        geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
        geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
        geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
        geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
        scale_color_manual(name = "Label",values = colors)
      r <- ggplotly(p)
      
      
    } else if (input$radiocigm == "95") {
      
      
      x0 <- dat()
      n <- length(x0)
      x0cap2 <- x0capgm11()
      fitted2 <- t(x0cap2)
      x0cap <- x0cap2[1:n]
      fitted3 <- tail(x0cap2,4)
      x0cap5 <- fitted3
      w <- length(x0cap2)
      t <- length(x0cap5)
      s <- rmse(x0, x0cap)
      sse <- sum((x0 - x0cap)^2)
      mse <- sse / (n - 2)
      cc <- (95 + 100)/200
      t.val <- qt(cc, n - 2)
      u <- numeric(t)
      l <- numeric(t)
      for (i in 1:t) {
        u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
        l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
      }
      UB <- c(u[1:t])
      LB <- c(l[1:t])
      LB1 <- c(x0cap[n],LB)
      UB2 <- c(x0cap[n],UB)
      l1 <- length(LB1)
      d3 <- seq(1, l1, 1)
      u1 <- length(UB2)
      d4 <- seq(1, u1, 1)
      set3 <- data.frame(x=d3, y=LB1)
      set4 <- data.frame(x=d4, y=UB2)
      d0 <- seq(1, n, 1)
      xy1 <- data.frame(x=d0, y=x0)
      d1 <- seq(1, w, 1)
      xy2 <- data.frame(x=d1, y=x0cap2)
      df <- rbind(xy1, xy2, set3, set4)
      colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
      CI <- c(n:w)
      p <- ggplot(df) +
        theme_bw() +
        labs(title = 'Grey Forecasting model GM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
        scale_x_continuous(breaks=1:w) +
        scale_y_continuous(labels = scales::comma) +
        geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
        geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
        geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
        geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
        geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
        geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
        geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
        geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
        scale_color_manual(name = "Label",values = colors)
      r <- ggplotly(p)
      
    } else if (input$radiocigm == "99") {
      
      x0 <- dat()
      n <- length(x0)
      x0cap2 <- x0capgm11()
      fitted2 <- t(x0cap2)
      x0cap <- x0cap2[1:n]
      fitted3 <- tail(x0cap2,4)
      x0cap5 <- fitted3
      w <- length(x0cap2)
      t <- length(x0cap5)
      s <- rmse(x0, x0cap)
      sse <- sum((x0 - x0cap)^2)
      mse <- sse / (n - 2)
      cc <- (99 + 100)/200
      t.val <- qt(cc, n - 2)
      u <- numeric(t)
      l <- numeric(t)
      for (i in 1:t) {
        u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
        l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
      }
      UB <- c(u[1:t])
      LB <- c(l[1:t])
      LB1 <- c(x0cap[n],LB)
      UB2 <- c(x0cap[n],UB)
      l1 <- length(LB1)
      d3 <- seq(1, l1, 1)
      u1 <- length(UB2)
      d4 <- seq(1, u1, 1)
      set3 <- data.frame(x=d3, y=LB1)
      set4 <- data.frame(x=d4, y=UB2)
      d0 <- seq(1, n, 1)
      xy1 <- data.frame(x=d0, y=x0)
      d1 <- seq(1, w, 1)
      xy2 <- data.frame(x=d1, y=x0cap2)
      df <- rbind(xy1, xy2, set3, set4)
      colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
      CI <- c(n:w)
      p <- ggplot(df) +
        theme_bw() +
        labs(title = 'Grey Forecasting model GM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
        scale_x_continuous(breaks=1:w) +
        scale_y_continuous(labels = scales::comma) +
        geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
        geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
        geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
        geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
        geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
        geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
        geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
        geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
        scale_color_manual(name = "Label",values = colors)
      r <- ggplotly(p)
      
    }
    
  })  
  
  
  
  #' Improved Background Values Models
  #' EPGM (1,1) model Fitted - reactive
  #' Fitted values 
  x0capepgm <- reactive({
    x0 <- datbv()
    x1 <- cumsum(x0)
    n <- length(x0)
    b <- numeric(n)
    for (i in 2:n){
      b[i] <- x1[i] + (0.5 * x0[i])
    }
    b1 <- b[2:n]
    b2 <- -b1
    B <- matrix(1,nrow=n-1,ncol=2)
    B[,1] <- t(t(b2[1:n-1]))
    yn <- matrix(c(x0),ncol=1)
    yn <- t(t(x0[2:n]))
    xcap <- solve (t(B) %*% B) %*% t(B) %*% yn
    a <- xcap[1,1]
    b <- xcap[2,1]
    scale_with <- function(k)
    {
      (x0[1] - (b/a)) * exp(-a*k) + (b/a)
    }
    x1cap <- scale_with(1:n)
    x0cap1 <- numeric(n)
    for (i in 1:n){
      x0cap1[i] <- x1cap[i+1] - x1cap[i]
    }
    x0cap <- c(x0[1],x0cap1[1:n-1])
    A <- 4
    x1cap4 <- scale_with(1 : n+A )
    t4 <- length(x1cap4)
    x0cap4 <- numeric(t4)
    for (i in 1:t4-1) {
      x0cap4[i] <- x1cap4[i+1] - x1cap4[i]
    }
    x0cap4 <- c(x0[1],x0cap4[1:t4-1])
    x0cap5 <- tail(x0cap4,A)
    # Fitted & Predicted values
    x0cap2 <- c(x0cap,x0cap5)
    
    
  })
  
  #' TBGM (1,1) model Fitted - reactive
  #' Fitted values   
  x0captbgm <- reactive({
    x0 <- datbv()
    nn <- length(x0)
    x01 <- log(x0)
    x02 <- c(1, x01)
    x1 <- cumsum(x02)
    n <- length(x02)
    b <- replicate(n,0)
    for (i in 1:n){
      b[i] <- -((x1[i+1]-x1[i])/( log(x1[i+1]-x1[1]) - log(x1[i]) ) - ( x1[1]*x1[i] / (x02[i+1]-x02[1]) ) )
    }
    b1 <- b[1:n-1]
    B <- matrix(1,nrow=n-1,ncol=2)
    B[,1] <- t(t(b1[1:n-1]))
    yn <- matrix(c(x02),ncol=1)
    yn <- t(t(x02[2:n]))
    xcap <- solve (t(B) %*% B) %*% t(B) %*% yn
    a <- xcap[1,1]
    b <- xcap[2,1]
    m <- length(x0)
    scale_with <- function(k)
    {
      (x02[1] - (b/a)) * exp(-a*k) * (1 - exp(a))
    }
    forecast <- scale_with(2:m)
    x0cap1 <- c(forecast)
    x03cap <- exp(x0cap1)
    x0cap <- c(x0[1],x03cap[1:m-1])
    A <- 4
    x1cap4 <- scale_with(1 : m +A )
    x0cap44 <- exp(x1cap4)
    x0cap4 <- c(x0cap44[1:m])
    x0cap5 <- tail(x0cap4,A)
    # Fitted & Predicted values
    x0cap2 <- c(x0cap,x0cap5 )
    
  })
  
  #' IGM (1,1) model Fitted - reactive
  #' Fitted values 
  x0capigm <- reactive({
    x0 <- datbv()
    x1 <- cumsum(x0)
    n <- length(x0)
    b <- numeric(n)
    for (i in 2:n){
      b[i] <- -(( (x1[i]-x1[i-1]) / ( log(x0[i])-log(x0[i-1]) ) ) + x1[i] - (x0[i]^2 / (x0[i]-x0[i-1]) ))
    }
    b1 <- b[2:n]
    B <- matrix(1,nrow=n-1,ncol=2)
    B[,1] <- t(t(b1[1:n-1]))
    yn <- matrix(c(x0),ncol=1)
    yn <- t(t(x0[2:n]))
    xcap <- solve (t(B) %*% B) %*% t(B) %*% yn
    a <- xcap[1,1]
    b <- xcap[2,1]
    scale_with <- function(k)
    {
      (x0[1] - (b/a)) * exp(-a*(k-1)) + (b/a)
    }
    forecast <- scale_with(1:n)
    x1cap <- c(forecast)
    x0cap <- numeric(n)
    for (i in 1:n-1){
      x0cap[i] <- x1cap[i+1] - x1cap[i]
    }
    x0cap1 <- c(x0[1],x0cap[1:n-1])
    A <- 4
    x1cap4 <- scale_with(1 : n+A )
    t4 <- length(x1cap4)
    x0cap4 <- numeric(t4-1)
    for (i in 1:t4-1) {
      x0cap4[i] <- x1cap4[i+1] - x1cap4[i]
    }
    x0cap4 <- c(x0cap4[1:t4-1])
    x0cap5 <- tail(x0cap4,A)
    # Fitted & Predicted values
    x0cap2 <- c(x0cap1,x0cap5)
    
  })
  
  #' GM (1,1,4) model Fitted - reactive
  #' Fitted values   
  x0capgm114 <- reactive({
    x0 <- datbv()
    x1 <- cumsum(x0)
    n <- length(x0)
    b <- numeric(n)
    for (i in 4:n){
      b[i] <- -0.25 * (x1[i] + x1[i-1] + x1[i-2] + x1[i-3] )
    }
    b1 <- b[4:n]
    mat1 <- matrix(c(b1),ncol=1)
    mat2 <- matrix(4:n,ncol=1)
    mat3 <- matrix(1,nrow=n-3, ncol=1)
    B <- cbind(mat1, mat2, mat3)
    y <- matrix(c(x0),ncol=1)
    y <- t(t(x0[4:n]))
    xcap <- solve (t(B) %*% B) %*% t(B) %*% y
    a <- xcap[1,1]
    b <- xcap[2,1]
    c <- xcap[3,1]
    matrix2 <- matrix("",1,n)
    matrix2 <- as.numeric(matrix2)
    matrix2[1] <- x1[1]
    matrix2[2] <- x1[2]
    matrix2[3] <- x1[3]
    for (i in 4:length(matrix2)) {
      matrix2[i] <- ((4-a)/(4+a) * matrix2[i-1]) - ( a/(4+a) * matrix2[i-2]) - ( a/(4+a) * matrix2[i-3]) + ((4*b)/(4+a) * i) + (4*c)/(4+a) 
    }
    x1cap <- matrix2
    x0cap1 <- numeric(n)
    for (i in 1:n){
      x0cap1[i] <- x1cap[i+1] - x1cap[i]
    }
    x0cap <- c(x0[1],x0cap1[1:n-1])
    A <- 4
    n <- length(x0)
    nn <- n + A
    matrix2A <- matrix("",1,nn)
    matrix2A <- as.numeric(matrix2A)
    matrix2A[1] <- x1[1]
    matrix2A[2] <- x1[2]
    matrix2A[3] <- x1[3]
    for (i in 4:length(matrix2A)) {
      matrix2A[i] <- ((4-a)/(4+a) * matrix2A[i-1]) - ( a/(4+a) * matrix2A[i-2]) - ( a/(4+a) * matrix2A[i-3]) + ((4*b)/(4+a) * i) + (4*c)/(4+a) 
    }
    
    x1capA <- matrix2A
    x0cap1A <- numeric(nn)
    for (i in 1:nn){
      x0cap1A[i] <- x1capA[i+1] - x1capA[i]
    }
    x0cap4 <- c(x0[1],x0cap1A[1:nn-1])
    x0cap5 <- tail(x0cap4,A)
    # Fitted & Predicted values
    x0cap2 <- c(x0cap,x0cap5)
    
  })  
  
  #' Improved Background Values model Actual and Fitted - render
  #' original and fitted data   
  output$x0capbv <- renderTable({
    if (input$radiobv == "EPGM (1, 1) model") {
      
      output$bv <- renderText({
        paste("EPGM (1, 1) model: Extrapolation-based grey model", 
              "The EPGM (1, 1) function takes as input raw values and output predicted values following the paper by", 
              "Chang C (2019). Extrapolation-based Grey Model for Small-Dataset Forecasting.", 
              "Economic Computation and Economic Cybernetics Studies and Research, 53(1), 171-182.",
              sep = "\n") 
      })
      
      Actual <- datbv()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capepgm()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      epgm11 <- data.frame(Actual,Fitted)
      
    } else if (input$radiobv == "TBGM (1, 1) model") {
      
      output$bv <- renderText({
        paste("TBGM (1, 1) model: Data transformation-based grey model", 
              "The TBGM (1, 1) function takes as input raw values and output predicted values following the paper by", 
              "Li K, Zhang T (2019). A Novel Grey Forecasting Model and its Application in Forecasting the",
              "Energy Consumption in Shanghai. Energy Systems, pp. 1-16.",
              sep = "\n") 
      })
      
      Actual <- datbv()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0captbgm()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      tbgm11 <- data.frame(Actual,Fitted)
      
    } else if (input$radiobv == "IGM (1, 1) model") {
      
      output$bv <- renderText({
        paste("IGM (1, 1) model: Improved grey model", 
              "The IGM (1, 1) function takes as input raw values and output predicted values following the paper by", 
              "Ou S (2012). Forecasting Agricultural Output with an Improved Grey Forecasting Model based on", 
              "the Genetic Algorithm. Computers and Electronics in Agriculture, 85, 33-39.",
              sep = "\n") 
      })
      
      Actual <- datbv()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capigm()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      igm11 <- data.frame(Actual,Fitted)
      
    } else if (input$radiobv == "GM (1, 1, 4) model") {
      
      output$bv <- renderText({
        paste("GM (1, 1, 4) model: Grey model with single variable, one first-order variable and four background values",
              "The GM (1, 1, 4) function takes as input raw values and output predicted values following the paper by",
              "Li S, Zhou M, Meng W, Zhou W (2019). A new Prediction Model for Forecasting the Automobiles",
              "Ownership in China. Journal of Control and Decision, 8(2), 155-164.",
              sep = "\n") 
      })
      
      Actual <- datbv()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capgm114()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      gm114 <- data.frame(Actual,Fitted)
      
    }
  })
  
  
  #' Predicted values - render 
  #' Improved Background Value Models 
  output$predictedbv <- renderTable({
    
    if (input$radiobv == "EPGM (1, 1) model") {
      
      output$bvpv <- renderPrint({input$radiobv1})
      
      actual1 <- datbv()
      actual2 <- t(datbv())
      n <- length(actual2)
      fitted1 <- x0capepgm()
      x <- input$radiobv1
      fitted3 <- tail(fitted1,4)
      fitted4 <- t(fitted3[1:x])
      
      
    } else if (input$radiobv == "TBGM (1, 1) model") {
      
      output$bvpv <- renderPrint({input$radiobv1})
      
      actual1 <- datbv()
      actual2 <- t(datbv())
      n <- length(actual2)
      fitted1 <- x0captbgm()
      x <- input$radiobv1
      fitted3 <- tail(fitted1,4)
      fitted4 <- t(fitted3[1:x])
      
      
    } else if (input$radiobv == "IGM (1, 1) model") {
      
      output$bvpv <- renderPrint({input$radiobv1})
      
      actual1 <- datbv()
      actual2 <- t(datbv())
      n <- length(actual2)
      fitted1 <- x0capigm()
      x <- input$radiobv1
      fitted3 <- tail(fitted1,4)
      fitted4 <- t(fitted3[1:x])
      
      
    } else if (input$radiobv == "GM (1, 1, 4) model") {
      
      output$bvpv <- renderPrint({input$radiobv1})
      
      actual1 <- datbv()
      actual2 <- t(datbv())
      n <- length(actual2)
      fitted1 <- x0capgm114()
      x <- input$radiobv1
      fitted3 <- tail(fitted1,4)
      fitted4 <- t(fitted3[1:x])
    }
  })
  
  
  #' Improved Background Values - Error - render
  #' MAPE and RMSE
  output$errorbv <- renderTable({
    
    if (input$radiobv == "EPGM (1, 1) model") {
      
      Actual <- datbv()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capepgm()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      MAPE <- mape(Actual,Fitted)*100
      RMSE <- rmse(Actual,Fitted)
      pe <- data.frame(MAPE,RMSE)
      
    } else if (input$radiobv == "TBGM (1, 1) model") {
      
      Actual <- datbv()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0captbgm()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      MAPE <- mape(Actual,Fitted)*100
      RMSE <- rmse(Actual,Fitted)
      pe <- data.frame(MAPE,RMSE)
      
    } else if (input$radiobv == "IGM (1, 1) model") {
      
      Actual <- datbv()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capigm()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      MAPE <- mape(Actual,Fitted)*100
      RMSE <- rmse(Actual,Fitted)
      pe <- data.frame(MAPE,RMSE)
      
    } else if (input$radiobv == "GM (1, 1, 4) model") {
      
      Actual <- datbv()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capgm114()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      MAPE <- mape(Actual,Fitted)*100
      RMSE <- rmse(Actual,Fitted)
      pe <- data.frame(MAPE,RMSE)
    }
    
  })
  
  
  #' Improved Background Values - Prediction Intervals - render
  #' CI  - reactive
  output$intervalsbv <- renderTable({
    
    if (input$radiobv == "EPGM (1, 1) model") {
      
      if (input$radiobv2 == "90") {
        
        output$cibv <- renderPrint({input$radiobv2})
        
        fp1 <- x0capepgm()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datbv()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiobv1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 90
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
        
      } else if (input$radiobv2 == "95") {
        
        output$cibv <- renderPrint({input$radiobv2})
        
        fp1 <- x0capepgm()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datbv()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiobv1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 95
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
      } else if (input$radiobv2 == "99") {
        
        output$cibv <- renderPrint({input$radiobv2})
        
        fp1 <- x0capepgm()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datbv()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiobv1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 99
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
      }
      
    } else if (input$radiobv == "TBGM (1, 1) model") {
      
      if (input$radiobv2 == "90") {
        
        output$cibv <- renderPrint({input$radiobv2})
        
        fp1 <- x0captbgm()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datbv()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiobv1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 90
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
        
      } else if (input$radiobv2 == "95") {
        
        output$cibv <- renderPrint({input$radiobv2})
        
        fp1 <- x0captbgm()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datbv()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiobv1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 95
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
      } else if (input$radiobv2 == "99") { 
        
        output$cibv <- renderPrint({input$radiobv2})
        
        fp1 <- x0captbgm()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datbv()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiobv1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 99
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
      }
      
    } else if (input$radiobv == "IGM (1, 1) model") {
      
      if (input$radiobv2 == "90") {
        
        output$cibv <- renderPrint({input$radiobv2})
        
        fp1 <- x0capigm()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datbv()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiobv1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 90
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
      } else if (input$radiobv2 == "95") {
        
        output$cibv <- renderPrint({input$radiobv2})
        
        fp1 <- x0capigm()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datbv()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiobv1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 95
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
      } else if (input$radiobv2 == "99") { 
        
        output$cibv <- renderPrint({input$radiobv2})
        
        fp1 <- x0capigm()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datbv()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiobv1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 99
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
      }
      
    } else if (input$radiobv == "GM (1, 1, 4) model") {
      
      if (input$radiobv2 == "90") {
        
        output$cibv <- renderPrint({input$radiobv2})
        
        fp1 <- x0capgm114()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datbv()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiobv1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 90
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
      } else if (input$radiobv2 == "95") {
        
        output$cibv <- renderPrint({input$radiobv2})
        
        fp1 <- x0capgm114()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datbv()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiobv1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 95
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
        
      } else if (input$radiobv2 == "99") { 
        
        output$cibv <- renderPrint({input$radiobv2})
        
        fp1 <- x0capgm114()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datbv()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiobv1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 99
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
      }
    }   
  })
  
  #' Improved Background Values - Plots - render
  #' Tab 2
  output$plotbv <- renderPlotly({
    
    if (input$radiobv == "EPGM (1, 1) model") {
      
      if (input$radiobv2 == "90") {
        
        x0 <- datbv()
        n <- length(x0)
        x0cap2 <- x0capepgm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (90 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'EPGM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
      } else if (input$radiobv2 == "95") {
        
        x0 <- datbv()
        n <- length(x0)
        x0cap2 <- x0capepgm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (95 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'EPGM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
      } else if (input$radiobv2 == "99") {
        
        x0 <- datbv()
        n <- length(x0)
        x0cap2 <- x0capepgm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (99 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'EPGM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      }
      
    } else if (input$radiobv == "TBGM (1, 1) model") {
      
      if (input$radiobv2 == "90") {
        
        x0 <- datbv()
        n <- length(x0)
        x0cap2 <- x0captbgm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (90 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'TBGM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p) 
        
        
      } else if (input$radiobv2 == "95") {
        
        x0 <- datbv()
        n <- length(x0)
        x0cap2 <- x0captbgm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (95 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'TBGM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p) 
        
        
      } else if (input$radiobv2 == "99") { 
        
        x0 <- datbv()
        n <- length(x0)
        x0cap2 <- x0captbgm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (99 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'TBGM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p) 
        
      }
      
      
    } else if (input$radiobv == "IGM (1, 1) model") {
      
      if (input$radiobv2 == "90") {
        
        x0 <- datbv()
        n <- length(x0)
        x0cap2 <- x0capigm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (90 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'IGM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p) 
        
      } else if (input$radiobv2 == "95") {
        
        x0 <- datbv()
        n <- length(x0)
        x0cap2 <- x0capigm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (95 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'IGM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p) 
        
        
        
      } else if (input$radiobv2 == "99") { 
        
        x0 <- datbv()
        n <- length(x0)
        x0cap2 <- x0capigm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (99 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'IGM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p) 
        
        
        
      }
      
    } else if (input$radiobv == "GM (1, 1, 4) model") {
      
      if (input$radiobv2 == "90") {
        
        x0 <- datbv()
        n <- length(x0)
        x0cap2 <- x0capgm114()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (90 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'GM (1, 1, 4) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p) 
        
      } else if (input$radiobv2 == "95") {
        
        x0 <- datbv()
        n <- length(x0)
        x0cap2 <- x0capgm114()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (95 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'GM (1, 1, 4) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p) 
        
        
      } else if (input$radiobv2 == "99") { 
        
        x0 <- datbv()
        n <- length(x0)
        x0cap2 <- x0capgm114()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (99 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'GM (1, 1, 4) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p) 
        
      }
    }   
  })
  
  
  #' Extended Forms of Grey Models 
  #' DGM (1,1) model Fitted - reactive
  #' Fitted values and predicted values  
  x0capdgm11 <- reactive({  
    x0 <- datef()
    x1 <- cumsum(x0)
    n <- length(x0)
    yn <- matrix(c(x1),ncol=1)
    yn <- t(t(x1[2:n]))
    mat1 <- matrix(c(x1),ncol=1)
    mat1 <- t(t(x1[1:n-1]))
    mat2 <- matrix(1,nrow=n-1,ncol=1)
    B <- cbind(mat1, mat2)
    xcap <- solve (t(B) %*% B) %*% t(B) %*% yn
    beta1 <- xcap[1,1]
    beta2 <- xcap[2,1]
    scale_with <- function(k)
    {
      beta1^k *( x0[1]-beta2/(1-beta1) ) + beta2/(1-beta1)
    }
    fitted <- scale_with(1:n-1)
    x0cap <- numeric(n-1)
    for (i in 1:n-1) {
      x0cap[i] <- fitted[i+1] - fitted[i]
    }
    x0cap1 <- c(x0[1],x0cap[1:n-1])
    a <- 4
    x1cap4 <- scale_with(1 : n+a-1 )
    t4 <- length(x1cap4)
    x0cap4 <- numeric(t4)
    for (i in 1:t4-1) {
      x0cap4[i] <- x1cap4[i+1] - x1cap4[i]
    }
    x0cap4 <- c(x0[1],x0cap4[1:t4-1])
    x0cap5 <- tail(x0cap4,a)
    x0cap2 <- c(x0cap1,x0cap5)
    
  }) 
  
  #' DGM (2,1) model Fitted - reactive
  #' Fitted values and predicted values 
  x0capdgm21 <- reactive({  
    x0 <- datef()
    x1 <- cumsum(x0)
    n <- length(x0)
    d <- -x0
    mat1 <- matrix(c(d[2:n]),ncol=1)
    mat2 <- matrix(1,nrow=n-1,ncol=1)
    B <- cbind(mat1,mat2)
    f <- numeric(n)
    for (i in 1:n){
      f[i] <- x0[i+1]-x0[i]
    }
    y <- matrix(c(f[1:n-1]),ncol=1)
    m <- length(y)
    xcap <- solve (t(B) %*% B) %*% t(B) %*% y
    a <- xcap[1,1]
    b <- xcap[2,1]
    scale_with <- function(k)
    {
      ( (b/(a^2)) - (x0[1]/a) )* ( 1 - exp(a) )* exp(-a*k) + (b/a)
    }
    fitted <- scale_with(1:m)
    x0cap <- c(x0[1],fitted)
    A <- 4
    x0cap4 <- scale_with(1 : n+A-1 )
    x0cap5 <- tail(x0cap4,A)
    x0cap2 <- c(x0cap,x0cap5)
    
  })   
  
  
  #' ODGM (2,1) model Fitted - reactive
  #' Fitted values and predicted values  
  x0capodgm21 <- reactive({  
    x0 <- datef()
    n <- length(x0)
    d <- -x0
    mat1 <- matrix(c(d[3:n]),ncol=1)
    mat2 <- matrix(1,nrow=n-2,ncol=1)
    B <- cbind(mat1,mat2)
    z <- length(mat1)
    f <- numeric(n)
    for (i in 3:n){
      f[i] <- (((x0[i]-x0[i-1])^2) /(x0[i]-(2*x0[i-1])+x0[i-2])) * (log((x0[i]-x0[i-1])/(x0[i-1]-x0[i-2])))
    }
    y <- matrix(c(f[3:n]),ncol=1)
    m <- length(y)
    xcap <- solve (t(B) %*% B) %*% t(B) %*% y
    a <- xcap[1,1]
    b <- xcap[2,1]
    for (k in 1:n-1){
      sm1 <- 0
      sm2 <- 0
      for (i in 1:k){
        sm1 <- sm1 + ( (b/(a^2))*(1-exp(a))*exp(-2*a*(i-1)) ) + ( (b/a)*exp(-a*(i-1)) ) - (x0[i]*exp(-a*(i-1)))
        sm2 <- sm2 + ((1-exp(a))/a)*exp(-2*a*(i-1))
      }
    }
    gamma <- sm1/sm2
    m <- length(y)
    scale_with <- function(k)
    {
      ( (b/(a^2)) - (gamma/a) )* exp(-a*k) + ((b/a)*(k+1)) + ((gamma-(b/a))*((1+a)/a))
    }
    forecast <- scale_with(0:n)
    x1cap <- c(x0[1],forecast)
    x0cap1 <- numeric(n)
    for (i in 1:n) {
      x0cap1[i] <- x1cap[i+1] - x1cap[i]
    }
    x0cap <- c(x0[1],x0cap1[2:n])
    A <- 4
    x1cap4 <- scale_with(1 : n+A-1 )
    t4 <- length(x1cap4)
    x0cap4 <- numeric(t4)
    for (i in 1:t4-1) {
      x0cap4[i] <- x1cap4[i+1] - x1cap4[i]
    }
    x0cap4 <- c(x0[1],x0cap4[1:t4-1])
    x0cap5 <- tail(x0cap4,A)
    x0cap2 <- c(x0cap,x0cap5)
    
  })  
  
  
  #' NDGM (1,1) model Fitted - reactive
  #' Fitted values and predicted values 
  x0capndgm <- reactive({  
    x0 <- datef()
    x1 <- cumsum(x0)
    n <- length(x0)
    y <- matrix(c(x1),ncol=1)
    y <- t(t(x1[2:n]))
    m <- length(y)
    mat1 <- matrix(c(x1),ncol=1)
    mat1 <- t(t(x1[1:m]))
    c <- numeric(m)
    for (i in 1:m){
      c[i] <- (i)
      c1 <- c[1:m]
    }
    mat2 <-matrix(c(c1),ncol=1)
    mat3 <- matrix(1,nrow=m,ncol=1)
    B <- cbind(mat1,mat2,mat3)
    betacap <- (solve (t(B) %*% B)) %*% t(B) %*% y
    beta1 <- betacap[1,1]
    beta2 <- betacap[2,1]
    beta3 <- betacap[3,1]
    xL <- replicate (n-1,0)
    for (k in 1:n-1){
      sm <- 0
      for (j in 1:k){
        sm <- sm + j*beta1^(k-j)
      }
      xL[k+1] <- (beta1^k)*x1[1] + beta2*(sm) + ((1 - beta1^k)/(1 - beta1))*beta3
    }
    x1cap <- c(x0[1],xL[2:n])
    x0cap1 <- numeric(n)
    for (i in 1:n){
      x0cap1[i] <- x1cap[i+1] - x1cap[i]
    }
    x0cap <- c(x0[1],x0cap1[1:n-1])
    a <- 4
    #' Predicted values
    xLa <- replicate (n+a,0)
    for (k in 1:n+a){
      sm <- 0
      for (j in 1:k){
        sm <- sm + j*beta1^(k-j)
      }
      xLa[k+1] <- (beta1^k)*x1[1] + beta2*(sm) + ((1 - beta1^k)/(1 - beta1))*beta3
    }
    x1capa <- c(xLa[1:n+a])
    at <- length(x1capa)
    x0cap1a <- numeric(at)
    for (i in 1:at-1){
      x0cap1a[i] <- x1capa[i+1] - x1capa[i]
    }
    x0cap4 <- c(x0[1],x0cap1a[1:at-1])
    x0cap5 <- tail(x0cap4,a)
    x0cap2 <- c(x0cap,x0cap5)
    
  })   
  
  
  #' EGM (1,1) model Fitted - reactive 
  #' Fitted values  
  x0capegm <- reactive({ 
    dfdata1 <- datinef()
    dfdata2 <- data.frame(dfdata1)
    k  <- dfdata2[ ,1]
    x0 <- dfdata2[ ,2]
    n <- length(x0)
    deltak <- replicate(n-1,0)
    for (i in 1:n){
      deltak[i] <- k[i+1]-k[i]
    }
    delta_k <- c(0,deltak[1:n-1])
    
    g <- replicate(n,0)
    for (i in 1:n){
      g[i] <- ( delta_k[i]/(k[n]-k[1]) )* (n-1)
    }
    
    sk <- replicate(n-1,0)
    for (i in 2:n){
      sm <- 0
      for (j in 2:i){
        sm <- sm + x0[j]*g[j]
      }
      sk[i] <- x0[1] + sm
    }
    x1_k <- c(x0[1],sk[2:n])
    
    b <- numeric(n)
    for (i in 1:n)
      b[i] <- -(0.5*x1_k[i + 1] + 0.5*x1_k[i])
    b1 <- b[1:n-1]
    B <- matrix(1,nrow=n-1,ncol=2)
    B[,1] <- t(t(b1[1:n-1]))
    
    yn <- matrix(c(x0),ncol=1)
    yn <- t(t(x0[2:n]))
    
    xcap <- solve (t(B) %*% B) %*% t(B) %*% yn
    a <- xcap[1,1]
    b <- xcap[2,1]
    
    K <- replicate(n-1,0)
    for (i in 2:n){
      K[i] <- ((k[i]-k[1])/(k[n]-k[1]))*(n-1)
    }
    
    vector_K <- c(K)
    
    x0cap1 = function(vector_K) {
      
      if(vector_K == 0) {
        x0[1]
        
      } else if( vector_K == as.integer(vector_K)) {
        (x0[1] - (b/a)) * exp(-a*vector_K) + (b/a) - ( (x0[1] - (b/a)) * exp(-a*(vector_K-1)) + (b/a) )
        
      } else if (vector_K == as.numeric(vector_K))  {
        
        ( (x0[1] - (b/a)) * exp(-a*vector_K) + (b/a) - ( (x0[1] - (b/a)) * exp(-a*(floor(vector_K))) + (b/a) ) ) / (vector_K - floor(vector_K))
      }
    }
    
    x0cap <- sapply(vector_K, x0cap1)
    
    data_A <- datoutef()
    dfdata_A <- data.frame(data_A)
    k_A <- dfdata_A[ ,1]
    x0_A <- dfdata_A[ ,2]
    
    m <- length(k_A)
    
    KA <- replicate(m,0)
    for (i in 1:m){
      KA[i] <- ((k_A[i]-k_A[1])/(k[n]-k_A[1]))*(n-1)
    }
    
    vector_KA <- c(KA)
    
    x0capA = function(vector_KA) {
      
      if(vector_KA == 0) {
        x0[1]
        
      } else if( vector_KA == as.integer(vector_KA)) {
        (x0[1] - (b/a)) * exp(-a*vector_KA) + (b/a) - ( (x0[1] - (b/a)) * exp(-a*(vector_KA-1)) + (b/a) )
        
      } else if (vector_KA == as.numeric(vector_KA))  {
        
        ( (x0[1] - (b/a)) * exp(-a*vector_KA) + (b/a) - ( (x0[1] - (b/a)) * exp(-a*(floor(vector_KA))) + (b/a) ) ) / (vector_KA - floor(vector_KA))
      }
    }
    
    x0cap4 <- sapply(vector_KA, x0capA)
    A <- 4
    x0cap5 <- tail(x0cap4,A)
    x0cap2 <- c(x0cap,x0cap5)
    
    
  })   
  
  
  #' VSSGM (1,1) model Fitted - reactive
  #' Fitted values and predicted values 
  x0capvssgm <- reactive({  
    x0 <- datef()
    x1 <- cumsum(x0)
    n <- length(x0)
    d <- numeric(n)
    for (i in 1:n){
      d[i] <- -0.5*(x1[i+1] + x1[i])
    }
    d1 <- d[1:n-1]
    mat1 <- matrix(c(d1),ncol=1)
    y <- matrix(c(x0),ncol=1)
    y <- t(t(x0[2:n]))
    c <- numeric(n)
    for (i in 1:n){
      c[i] <- (i^3)
    }
    c1 <- c[2:n]
    mat2 <-matrix(c(c1),ncol=1)
    f <- numeric(n)
    for (i in 1:n){
      f[i] <- (i^2)
    }
    f1 <- f[2:n]
    mat3 <-matrix(c(f1),ncol=1)
    g <- numeric(n)
    for (i in 1:n){
      g[i] <- (i)
    }
    g1 <- g[2:n]
    mat4 <-matrix(c(g1),ncol=1)
    mat5 <- matrix(1,nrow=n-1,ncol=1)
    B <- cbind(mat1, mat2, mat3, mat4, mat5)
    acap <- (solve (t(B) %*% B)) %*% t(B) %*% y
    a <- acap[1,1]
    b1 <- acap[2,1]
    b2 <- acap[3,1]
    b3 <- acap[4,1]
    b4 <- acap[5,1]
    b <- c(b1,b2,b3,b4)
    m <- (1-(0.5*a))/(1+(0.5*a))
    nn <- 1/(1+(0.5*a))
    scale_with <- function(k)
    {
      m^(k-1) * x0[1]
    }
    forecast1 <- scale_with(2:n)
    M1 <- matrix(c(forecast1),nrow=n-1,ncol=1)
    forecast2 <- replicate(n-1,0)
    for (k in 2:n){
      sm <- 0
      for (i in 2:k){
        for (j in 1:4){
          sm <- sm + nn*( b[j] * ( m^(k-i) * i^(4-j) ) )
        }
        forecast2[k] <- 1*sm
      }
    }
    M2 <- matrix(c(forecast2[2:n]),nrow=n-1,ncol=1)
    Total <- M1 + M2
    total <- matrix(c(Total),nrow=n-1,ncol=1)
    xcap1 <- c(x0[1],total)
    x0cap2 <- numeric(n)
    for (i in 1:n){
      x0cap2[i] <- xcap1[i+1] - xcap1[i]
    }
    x0cap <- c(x0[1],x0cap2[1:n-1])
    A <- 4
    newn <- n + A
    scale_with <- function(k)
    {
      m^(k-1) * x0[1]
    }
    forecast1new <- scale_with(2:newn)
    M1new <- matrix(c(forecast1new),nrow=newn-1,ncol=1)
    forecast2new <- replicate(newn-1,0)
    for (k in 2:newn){
      sm <- 0
      for (i in 2:k){
        for (j in 1:4){
          sm <- sm + nn*( b[j] * ( m^(k-i) * i^(4-j) ) )
        }
        forecast2new[k] <- 1*sm
      }
    }
    M2new <- matrix(c(forecast2new[2:newn]),nrow=newn-1,ncol=1)
    Totalnew <- M1new + M2new
    totalnew <- matrix(c(Totalnew),nrow=newn-1,ncol=1)
    xcap1new <- c(x0[1],totalnew)
    x0cap2new <- numeric(newn)
    for (i in 1:newn){
      x0cap2new[i] <- xcap1new[i+1] - xcap1new[i]
    }
    x0cap4 <- c(x0[1],x0cap2new[1:newn-1]) 
    x0cap5 <- tail(x0cap4,A)
    x0cap2 <- c(x0cap,x0cap5)
    
  })  
  
  
  
  #' GOM (1, 1) model Fitted - reactive
  #' Fitted values and predicted values  
  x0capgom <- reactive({
    x0 <- datef()
    n <- length(x0)
    x1 <- numeric(n)
    for (i in 1:n){
      x1[i] <- sum(x0[i:n])
    }
    n <- length(x0)
    b <- numeric(n)
    for (i in 2:n){
      b[i] <- -( (x1[i]-x1[i-1]) / (log (x1[i])-log (x1[i-1])) )
    }
    mat1 <- matrix(c(b[2:n]),ncol=1)
    mat2 <- matrix(1,nrow=n-1,ncol=1)
    B <- cbind(mat1,mat2)
    r <- -x0
    y <- matrix(c(r),ncol=1)
    y <- t(t(r[1:n-1]))
    xcap <- solve (t(B) %*% B) %*% t(B) %*% y
    a <- xcap[1,1]
    b <- xcap[2,1]
    scale_with <- function(k)
    {
      (x1[1] - (b/a)) * exp(-a*k) * (exp(a)-1)
    }
    x0cap <- scale_with(1:n)
    A <- 4
    x0cap4 <- scale_with(1 : n+A )
    x0cap5 <- tail(x0cap4,A)
    # Fitted & Predicted values
    x0cap2 <- c(x0cap,x0cap5)
    
  })
  
  #' GOM_IA (1, 1) model Fitted - reactive
  #' Fitted values and predicted values  
  x0capgomia <- reactive({
    x0 <- datef()
    n <- length(x0)
    x1 <- numeric(n)
    for (i in 1:n){
      x1[i] <- sum(x0[i:n])
    }
    b <- numeric(n)
    alpha <- 0.5
    for (i in 1:n){
      b[i] <- (-alpha*x0[i])-((1-alpha)*x0[i+1])
    }
    y <- matrix(c(b[1:n-1]),ncol=1)
    x11 <- -x1
    mat1 <- matrix(c(x11),ncol=1)
    mat1 <- t(t(x11[2:n]))
    mat2 <- matrix(1,nrow=n-1,ncol=1)
    B <- cbind(mat1,mat2)
    xcap <- solve (t(B) %*% B) %*% t(B) %*% y
    a <- xcap[1,1]
    b <- xcap[2,1]
    scale_with <- function(k)
    {
      (x1[n] - (b/a)) * exp(-a*(k-n)) + (b/a)
    }
    forecast <- scale_with(1:n)
    x1cap <- c(forecast)
    x0cap1 <- numeric(n)
    for (i in 1:n-1)
      x0cap1[i] <- x1cap[i] - x1cap[i+1]
    x0cap <- c(x0cap1[1:n-1],x1[n])
    A <- 4
    x1cap4 <- scale_with(1 : n+A )
    t4 <- length(x1cap4)
    x0cap1a <- numeric(t4)
    for (i in 1:t4){
      x0cap1a[i] <- x1cap4[i] - x1cap4[i+1]
    }
    x0cap4 <- c(x0cap1a[1:t4-1])
    x0cap5 <- tail(x0cap4,A)
    # Fitted & Predicted values
    x0cap2 <- c(x0cap,x0cap5)
    
  })  
  
  
  #' unbiased GOM (1, 1) model Fitted - reactive
  #' Fitted values and predicted values  
  x0capungom <- reactive({ 
    x0 <- datef()
    n <- length(x0)
    x1 <- numeric(n)
    for (i in 1:n){
      x1[i] <- sum(x0[i:n])
    }
    mat1 <- matrix(c(x1),ncol=1)
    mat1 <- t(t(x1[1:n-1]))
    mat2 <- matrix(1,nrow=n-1,ncol=1)
    B <- cbind(mat1,mat2)
    y <- matrix(c(x1),ncol=1)
    y <- t(t(x1[2:n]))
    xcap <- solve (t(B) %*% B) %*% t(B) %*% y
    beta1 <- xcap[1,1]
    beta2 <- xcap[2,1]
    a <- - log(beta1)
    b <- (beta2/(1-beta1))*a
    scale_with <- function(k)
    {
      (x1[n] - (b/a)) * exp(-a*(k-n)) + (b/a)
    }
    forecast <- scale_with(1:n)
    x1cap <- c(forecast)
    x0cap1 <- numeric(n)
    for (i in 1:n-1){
      x0cap1[i] <- x1cap[i] - x1cap[i+1]
    }
    x0cap <- c(x0cap1[1:n-1],x1[n])
    A <- 4
    x1cap4 <- scale_with(1 : n+A )
    t4 <- length(x1cap4)
    x0cap1a <- numeric(t4)
    for (i in 1:t4){
      x0cap1a[i] <- x1cap4[i] - x1cap4[i+1]
    }
    x0cap4 <- c(x0cap1a[1:t4-1])
    x0cap5 <- tail(x0cap4,A)
    x0cap2 <- c(x0cap,x0cap5)
    
  })   
  
  
  #' MGM (1, 1) model Fitted - reactive
  #' Fitted values  
  x0capmgm <- reactive({
    x0 <- datef()
    x1 <- cumsum(x0)
    n <- length(x0)
    b <- numeric(n)
    for (i in 1:n){
      b[i] <- -(0.5*x1[i + 1] + 0.5*x1[i])
      b1 <- b[1:n-1]
    }
    B <- matrix(1,nrow=n-1,ncol=2)
    B[,1] <- t(t(b1[1:n-1]))
    yn <- matrix(c(x0),ncol=1)
    yn <- t(t(x0[2:n]))
    m <- length(yn)
    xcap <- solve (t(B) %*% B) %*% t(B) %*% yn
    a <- xcap[1,1]
    b <- xcap[2,1]
    scale_with <- function(k)
    {
      (x0[1] - (b/a)) * exp(-a*k) * (1 - exp(a))
    }
    x0cap <- c(x0[1],scale_with(1:m))
    
  }) 
  
  
  #' IMGM (1, 1) model Fitted - reactive
  #' Fitted values  
  x0capimgm <- reactive({ 
    x0a <- datef()
    x1a <- cumsum(x0a)
    n <- length(x0a)
    b <- numeric(n)
    for (i in 1:n){
      b[i] <- -(0.5*x1a[i + 1] + 0.5*x1a[i])
      b1 <- b[1:n-1]
    }
    B <- matrix(1,nrow=n-1,ncol=2)
    B[,1] <- t(t(b1[1:n-1]))
    yn <- matrix(c(x0a),ncol=1)
    yn <- t(t(x0a[2:n]))
    m <- length(yn)
    xcap <- solve (t(B) %*% B) %*% t(B) %*% yn
    a <- xcap[1,1]
    b <- xcap[2,1]
    scale_with <- function(k)
    {
      (x0a[1] - (b/a)) * exp(-a*k) * (1 - exp(a))
    }
    new1 <- scale_with(m)
    x0 <- c(x0a[1:m],new1)
    x1 <- cumsum(x0)
    n <- length(x0)
    b <- numeric(n)
    for (i in 1:n){
      b[i] <- -(0.5*x1[i + 1] + 0.5*x1[i])
      b1 <- b[1:n-1]
    }
    B <- matrix(1,nrow=n-1,ncol=2)
    B[,1] <- t(t(b1[1:n-1]))
    yn <- matrix(c(x0),ncol=1)
    yn <- t(t(x0[2:n]))
    xcap <- solve (t(B) %*% B) %*% t(B) %*% yn
    a <- xcap[1,1]
    b <- xcap[2,1]
    scale_with <- function(k)
    {
      (x0[1] - (b/a)) * exp(-a*k) * (1 - exp(a))
    }
    fitted <- scale_with(1:n)
    x0cap <- c(x0[1],fitted[1:n-1])
    
  })   
  
  
  #' EXGM (1, 1) model Fitted - reactive
  #' Fitted values and predicted values
  x0capexgm <- reactive({
    x0 <- datef()
    x1 <- cumsum(x0)
    n <- length(x0)
    y <- matrix(c(x0),ncol=1)
    y <- t(t(x0[2:n]))
    b <- numeric(n)
    for (i in 1:n){
      b[i] <- -0.5*(x1[i+1] + x1[i])
    }
    b1 <- b[1:n-1]
    mat1 <- matrix(c(b1),ncol=1)
    mat2 <- matrix(1,nrow=n-1,ncol=1)
    f <- numeric(n)
    for (i in 1:n){
      f[i] <- ( exp(1) - 1) * exp(-i)
    }
    f1 <- f[2:n]
    mat3 <- matrix(c(f1),ncol=1)
    B2 <- cbind(mat1, mat2, mat3)
    rcap <- (solve (t(B2) %*% B2)) %*% t(B2) %*% y
    a <- rcap[1,1]
    b <- rcap[2,1]
    c <- rcap[3,1]
    scale_with <- function(k)
    {
      ( x1[1] - (b/a) - ( ( c/(a-1) )*exp(-1) ) ) * exp(a*(1-k)) + (b/a) + ( c/(a-1) )*exp(-k) 
    }
    forecast1 <- scale_with(1:n)
    x1cap <- c(forecast1)
    x0cap1 <- numeric(n)
    for (i in 1:n){
      x0cap1[i] <- x1cap[i+1] - x1cap[i]
    }
    x0cap <- c(x0[1],x0cap1[1:n-1])
    A <- 4
    x1cap4 <- scale_with(1 : n+A )
    t4 <- length(x1cap4)
    x0cap4 <- numeric(t4-1)
    for (i in 1:t4-1) {
      x0cap4[i] <- x1cap4[i+1] - x1cap4[i]
    }
    x0cap4 <- c(x0[1],x0cap4[1:t4-1])
    x0cap5 <- tail(x0cap4,A)
    x0cap2 <- c(x0cap,x0cap5)
    
  })    
  
  
  #' Extended Forms - Actual and Fitted - render
  #' original and fitted data   
  output$x0capef <- renderTable({
    if (input$radioef == "DGM (1, 1)") {
      
      output$ef <- renderText({
        paste("DGM (1, 1): Discrete grey model with single variable and first order differential equation", 
              "The DGM (1, 1) function takes as input raw values and output predicted values following the paper by",
              "Xie N, Liu S (2009). Discrete Grey Forecasting Model and its Application.",
              "Applied Mathematical Modelling, 33(2), 1173-1186.",sep = "\n") 
      })
      
      Actual <- datef()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capdgm11()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      dfdgm11 <- data.frame(Actual,Fitted)
      
    } else if (input$radioef == "DGM (2, 1)") {
      
      output$ef <- renderText({
        paste("DGM (2, 1): Discrete grey model with single variable and second order differential equation model", 
              "The DGM (2, 1) function takes as input raw values and output predicted values following the paper by",
              "Shao Y, Su H (2012). On Approximating Grey Model DGM (2, 1).",
              "2012 AASRI Conference on Computational Intelligence and Bioinformatics, 1, 8-13.",sep = "\n") 
      })
      
      Actual <- datef()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capdgm21()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      dfdgm21 <- data.frame(Actual,Fitted)
      
    } else if (input$radioef == "ODGM (2, 1)") {
      
      output$ef <- renderText({
        paste("ODGM (2, 1): Optimized discrete grey model with single variable and second order differential equation", 
              "The ODGM (2, 1) function takes as input raw values and output predicted values following the paper by",
              "Shao Y, Su H (2012). On Approximating Grey Model DGM (2, 1).",
              "2012 AASRI Conference on Computational Intelligence and Bioinformatics, 1, 8-13.",sep = "\n") 
      })
      
      Actual <- datef()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capodgm21()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      dfodgm21 <- data.frame(Actual,Fitted)
      
    } else if (input$radioef == "NDGM (1, 1)") {
      
      output$ef <- renderText({
        paste("NDGM (1, 1): Non-homogeneous discrete grey model", 
              "The NDGM function takes as input raw values and output predicted values following the paper by",
              "Xie N, Liu S, Yang Y, Yuan C (2013). On Novel Grey Forecasting Model based on Non-homogeneous",
              "Index Sequence. Applied Mathematical Modelling, 37, 5059-5068.",sep = "\n") 
      })
      
      Actual <- datef()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capndgm()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      dfndgm <- data.frame(Actual,Fitted)
      
      
    }else if (input$radioef == "VSSGM (1, 1)") {
      
      output$ef <- renderText({
        paste("VSSGM (1, 1): Variable speed and adaptive structure-based grey model", 
              "The VSSGM (1, 1) function takes as input raw values and output predicted values following the paper by",
              "Li S, Miao Y, Li G, Ikram M (2020). A Novel Varistructure Grey Forecasting Model with Speed",
              "Adaptation and its Application. Mathematical and Computers in Simulation, 172, 45-70.",sep = "\n") 
      })
      
      Actual <- datef()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capvssgm()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      dfvssgm <- data.frame(Actual,Fitted)
      
    } else if (input$radioef == "GOM (1, 1)") {
      
      output$ef <- renderText({
        paste("GOM (1, 1): Grey opposite-direction model based on inverse accumulation and traditional interpolation method", 
              "The GOM function takes as input raw values and output predicted values following the paper by",
              "Che X, Luo Y, He Z (2013). Grey New Information GOM (1, 1) Model based Opposite-Direction",
              "Accumulated Generating and its Application. Applied Mechanics and Materials, 364, 207-210.",sep = "\n") 
      })
      
      Actual <- datef()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capgom()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      dfgom <- data.frame(Actual,Fitted)
      
    } else if (input$radioef == "GOM_IA (1, 1)") {
      
      output$ef <- renderText({
        paste("GOM_IA (1, 1): Grey opposite-direction model based on inverse accumulation", 
              "The GOM_IA function takes as input raw values and output predicted values following the paper by",
              "Zhu J, Xu Y, Leng H, Tang H, Gong H, Zhang Z (2016).",
              "Power Load Forecasting based on GOM (1, 1) Model under the Condition of Missing Data.",
              "2016 IEEEPES Asia-Pacific Power and Energy Engineering Conference (APPEEC), pp. 2461-2464.",sep = "\n") 
      })
      
      Actual <- datef()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capgomia()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      dfgomia <- data.frame(Actual,Fitted)
      
    } else if (input$radioef == "unbiased GOM (1, 1)") {
      
      output$ef <- renderText({
        paste("unbiased GOM (1, 1): Unbiased grey opposite-direction model based on inverse accumulation", 
              "The unbiased GOM function takes as input raw values and output predicted values following the paper by",
              "Luo Y, Liao D (2012). Grey New Information Unbiased GOM (1, 1) Model based on Opposite-Direction", 
              "Accumulated Generating and its Application. Advanced Materials Research, 507, 265-268.",sep = "\n") 
      })
      
      Actual <- datef()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capungom()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      dfungom <- data.frame(Actual,Fitted)
      
    } else if (input$radioef == "MGM (1, 1)") {
      
      output$ef <- renderText({
        paste("MGM (1, 1): Metabolism grey model", 
              "The MGM (1, 1) function takes as input raw values and output predicted values following the paper by",
              "Zhou W, Zhang D (2016). An Improved Metabolism Grey Model for Predicting Small Samples with a",
              "Singular Datum and its Application to Sulfur Dioxide Emissions in China.",
              "Discrete Dynamics in Nature and Society, 2016(5), 1-11.",sep = "\n") 
      })
      
      actual <- datef()
      fitted <- x0capmgm()
      dfmgm <- data.frame(actual,fitted)
      
    } else if (input$radioef == "IMGM (1, 1)") {
      
      output$ef <- renderText({
        paste("IMGM (1, 1): Improved metabolism grey model", 
              "The IMGM (1, 1) function takes as input raw values and output predicted values following the paper by",
              "Zhou W, Zhang D (2016). An Improved Metabolism Grey Model for Predicting Small Samples with a",
              "Singular Datum and its Application to Sulfur Dioxide Emissions in China.",
              "Discrete Dynamics in Nature and Society, 2016(5), 1-11.",sep = "\n") 
      })
      
      actual <- datef()
      fitted <- x0capimgm()
      dfimgm <- data.frame(actual,fitted)
      
    } else if (input$radioef == "EXGM (1, 1)") {
      
      output$ef <- renderText({
        paste("EXGM (1, 1): Exponential grey model", 
              "The EXGM (1, 1) function takes as input raw values and output predicted values following the paper by",
              "Bilgil H (2020). New Grey Forecasting Model with its Application and Computer Code.",
              "AIMS Mathematics, 6(2), 1497-1514",sep = "\n") 
      })
      
      Actual <- datef()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capexgm()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      dfexgm <- data.frame(Actual,Fitted)
    }
  }) 
  
  
  #' Predicted values - render  
  output$predictedef <- renderTable({
    
    if (input$radioef == "DGM (1, 1)") {
      
      actual1 <- datef()
      actual2 <- t(datef())
      n <- length(actual2)
      fitted1 <- x0capdgm11()
      x <- input$radioef1
      fitted3 <- tail(fitted1,4)
      fitted4 <- t(fitted3[1:x])
      
    } else if (input$radioef == "DGM (2, 1)") {
      
      actual1 <- datef()
      actual2 <- t(datef())
      n <- length(actual2)
      fitted1 <- x0capdgm21()
      x <- input$radioef1
      fitted3 <- tail(fitted1,4)
      fitted4 <- t(fitted3[1:x])
      
    } else if (input$radioef == "ODGM (2, 1)") {
      
      actual1 <- datef()
      actual2 <- t(datef())
      n <- length(actual2)
      fitted1 <- x0capodgm21()
      x <- input$radioef1
      fitted3 <- tail(fitted1,4)
      fitted4 <- t(fitted3[1:x])
      
    } else if (input$radioef == "NDGM (1, 1)") {
      
      actual1 <- datef()
      actual2 <- t(datef())
      n <- length(actual2)
      fitted1 <- x0capndgm()
      x <- input$radioef1
      fitted3 <- tail(fitted1,4)
      fitted4 <- t(fitted3[1:x])
      
    } else if (input$radioef == "VSSGM (1, 1)") {
      
      actual1 <- datef()
      actual2 <- t(datef())
      n <- length(actual2)
      fitted1 <- x0capvssgm()
      x <- input$radioef1
      fitted3 <- tail(fitted1,4)
      fitted4 <- t(fitted3[1:x])
      
    } else if (input$radioef == "GOM (1, 1)") {
      
      actual1 <- datef()
      actual2 <- t(datef())
      n <- length(actual2)
      fitted1 <- x0capgom()
      x <- input$radioef1
      fitted3 <- tail(fitted1,4)
      fitted4 <- t(fitted3[1:x])
      
    } else if (input$radioef == "GOM_IA (1, 1)") {
      
      actual1 <- datef()
      actual2 <- t(datef())
      n <- length(actual2)
      fitted1 <- x0capgomia()
      x <- input$radioef1
      fitted3 <- tail(fitted1,4)
      fitted4 <- t(fitted3[1:x])
      
    } else if (input$radioef == "unbiased GOM (1, 1)") {
      
      actual1 <- datef()
      actual2 <- t(datef())
      n <- length(actual2)
      fitted1 <- x0capungom()
      x <- input$radioef1
      fitted3 <- tail(fitted1,4)
      fitted4 <- t(fitted3[1:x])
      
    } else if (input$radioef == "EXGM (1, 1)") {
      
      actual1 <- datef()
      actual2 <- t(datef())
      n <- length(actual2)
      fitted1 <- x0capexgm()
      x <- input$radioef1
      fitted3 <- tail(fitted1,4)
      fitted4 <- t(fitted3[1:x])
    }
  })
  
  
  #' EGM - In & Out sample - Acutal & Fitted 
  output$x0capoutef<- renderTable({  
    
    if (input$radiooutef == "EGM (1, 1) model") {
      
      output$outef <- renderText({
        paste("EGM (1, 1): Extended grey model", 
              "The EGM function takes as input raw values and output predicted values following the paper by",
              "Li D, Chang C, Chen W, Chen C (2011).",
              "An Extended Grey Forecasting Model for Omnidirectional Forecasting considering Data Gap Difference.",
              "Applied Mathematical Modeling, 35, 5051-5058.",sep = "\n") 
      })
      
      actual1 <- datinef()
      dfdata2 <- data.frame(actual1)
      k  <- dfdata2[ ,1]
      x0 <- dfdata2[ ,2]
      n <- length(x0)
      fitted1 <- x0capegm()
      fitted <- fitted1[1:n]
      dfegm <- data.frame(x0,fitted)
      colnames(dfegm , do.NULL = FALSE)
      colnames(dfegm) <- c("Original","Fitted")
      dfegm
      
      
    }
  })
  
  #' Predicted values - render  - EGM 
  output$predictedoutef <- renderTable({
    
    if (input$radiooutef == "EGM (1, 1) model") {
      
      actual1 <- datinef()
      dfdata2 <- data.frame(actual1)
      k  <- dfdata2[ ,1]
      x0 <- dfdata2[ ,2]
      n <- length(x0)
      fitted1 <- x0capegm()
      x <- input$radiooutef1
      fitted3 <- tail(fitted1,4)
      fitted4 <- t(fitted3[1:x])
      
      
    }
  })
  
  
  #' Extended Forms of GM - Error - render
  #' MAPE and RMSE
  output$erroref <- renderTable({
    
    if (input$radioef == "DGM (1, 1)") {
      
      Actual <- datef()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capdgm11()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      MAPE <- mape(Actual,Fitted)*100
      RMSE <- rmse(Actual,Fitted)
      pe <- data.frame(MAPE,RMSE)
      
    } else if (input$radioef == "DGM (2, 1)") {
      
      Actual <- datef()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capdgm21()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      MAPE <- mape(Actual,Fitted)*100
      RMSE <- rmse(Actual,Fitted)
      pe <- data.frame(MAPE,RMSE)
      
    } else if (input$radioef == "ODGM (2, 1)") {
      
      Actual <- datef()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capodgm21()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      MAPE <- mape(Actual,Fitted)*100
      RMSE <- rmse(Actual,Fitted)
      pe <- data.frame(MAPE,RMSE)
      
    } else if (input$radioef == "NDGM (1, 1)") {
      
      Actual <- datef()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capndgm()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      MAPE <- mape(Actual,Fitted)*100
      RMSE <- rmse(Actual,Fitted)
      pe <- data.frame(MAPE,RMSE)
      
    } else if (input$radioef == "VSSGM (1, 1)") {
      
      Actual <- datef()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capvssgm()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      MAPE <- mape(Actual,Fitted)*100
      RMSE <- rmse(Actual,Fitted)
      pe <- data.frame(MAPE,RMSE)
      
    } else if (input$radioef == "GOM (1, 1)") {
      
      Actual <- datef()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capgom()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      MAPE <- mape(Actual,Fitted)*100
      RMSE <- rmse(Actual,Fitted)
      pe <- data.frame(MAPE,RMSE)
      
    } else if (input$radioef == "GOM_IA (1, 1)") {
      
      Actual <- datef()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capgomia()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      MAPE <- mape(Actual,Fitted)*100
      RMSE <- rmse(Actual,Fitted)
      pe <- data.frame(MAPE,RMSE)
      
    } else if (input$radioef == "unbiased GOM (1, 1)") {
      
      Actual <- datef()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capungom()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      MAPE <- mape(Actual,Fitted)*100
      RMSE <- rmse(Actual,Fitted)
      pe <- data.frame(MAPE,RMSE)
      
    } else if (input$radioef == "MGM (1, 1)") {
      
      Actual <- datef()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capmgm()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      MAPE <- mape(Actual,Fitted)*100
      RMSE <- rmse(Actual,Fitted)
      pe <- data.frame(MAPE,RMSE)
      
    } else if (input$radioef == "IMGM (1, 1)") {
      
      Actual <- datef()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capimgm()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      MAPE <- mape(Actual,Fitted)*100
      RMSE <- rmse(Actual,Fitted)
      pe <- data.frame(MAPE,RMSE)
      
    }else if (input$radioef == "EXGM (1, 1)") {
      
      Actual <- datef()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capexgm()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      MAPE <- mape(Actual,Fitted)*100
      RMSE <- rmse(Actual,Fitted)
      pe <- data.frame(MAPE,RMSE)
      
    }
  })
  
  
  #' Extended Forms of GM - Error - render EGM
  #' MAPE and RMSE
  output$erroroutef <- renderTable({
    
    if (input$radiooutef == "EGM (1, 1) model") {
      
      actual1 <- datinef()
      dfdata2 <- data.frame(actual1)
      k  <- dfdata2[ ,1]
      x0 <- dfdata2[ ,2]
      n <- length(x0)
      fitted1 <- x0capegm()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      MAPE <- mape(x0,Fitted)*100
      RMSE <- rmse(x0,Fitted)
      pe <- data.frame(MAPE,RMSE) 
      
    }
  })
  
  
  #' Extended Forms of Grey Models - Prediction Intervals - render - EGM
  #' CI  - reactive
  output$intervalsoutef <- renderTable({
    
    if (input$radiooutef == "EGM (1, 1) model") {
      
      if (input$radiooutef2 == "90") {
        
        output$cioutef <- renderPrint({input$radiooutef2})
        
        fp1 <- x0capegm()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datinef()
        dfdata2 <- data.frame(actual1)
        k  <- dfdata2[ ,1]
        actual2 <- dfdata2[ ,2]
        n <- length( actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiooutef1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 90
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
        
      } else if (input$radiooutef2 == "95") {
        
        output$cioutef <- renderPrint({input$radiooutef2})
        
        fp1 <- x0capegm()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datinef()
        dfdata2 <- data.frame(actual1)
        k  <- dfdata2[ ,1]
        actual2 <- dfdata2[ ,2]
        n <- length( actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiooutef1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 95
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
        
      } else if (input$radiooutef2 == "99") {
        
        output$cioutef <- renderPrint({input$radiooutef2})
        
        fp1 <- x0capegm()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datinef()
        dfdata2 <- data.frame(actual1)
        k  <- dfdata2[ ,1]
        actual2 <- dfdata2[ ,2]
        n <- length( actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiooutef1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 99
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
      }
    }   
  })
  
  #' Extended Forms of Grey Models - Plots - render _ EGM
  #' CI  - reactive
  output$plotoutef <- renderPlotly({
    
    if (input$radiooutef == "EGM (1, 1) model") {
      
      if (input$radiooutef2 == "90") {
        
        actual1 <- datinef()
        dfdata2 <- data.frame(actual1)
        k  <- dfdata2[ ,1]
        x0 <- dfdata2[ ,2]
        n <- length(x0)
        
        x0cap2 <- x0capegm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (90 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'EGM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
      } else if (input$radiooutef2 == "95") {
        
        actual1 <- datinef()
        dfdata2 <- data.frame(actual1)
        k  <- dfdata2[ ,1]
        x0 <- dfdata2[ ,2]
        n <- length(x0)
        
        x0cap2 <- x0capegm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (95 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'EGM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
      } else if (input$radiooutef2 == "99") {
        
        actual1 <- datinef()
        dfdata2 <- data.frame(actual1)
        k  <- dfdata2[ ,1]
        x0 <- dfdata2[ ,2]
        n <- length(x0)
        
        x0cap2 <- x0capegm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (99 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'EGM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      }
    }
  })
  
  
  
  #' Extended Forms of Grey Models - Prediction Intervals - render
  #' CI  - reactive
  output$intervalsef <- renderTable({
    
    if (input$radioef == "DGM (1, 1)") {
      
      if (input$radioef2 == "90") {
        
        output$cief <- renderPrint({input$radioef2})
        
        fp1 <- x0capdgm11()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datef()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radioef1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 90
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
        
      } else if (input$radioef2 == "95") {
        
        output$cief <- renderPrint({input$radioef2})
        
        fp1 <- x0capdgm11()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datef()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radioef1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 95
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
      } else if (input$radioef2 == "99") {
        
        output$cief <- renderPrint({input$radioef2})
        
        fp1 <- x0capdgm11()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datef()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radioef1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 99
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
      }
      
    } else if (input$radioef == "DGM (2, 1)") {
      
      if (input$radioef2 == "90") {
        
        output$cief <- renderPrint({input$radioef2})
        
        fp1 <- x0capdgm21()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datef()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radioef1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 90
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
        
      } else if (input$radioef2 == "95") {
        
        output$cief <- renderPrint({input$radioef2})
        
        fp1 <- x0capdgm21()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datef()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radioef1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 95
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
      } else if (input$radioef2 == "99") {
        
        output$cief <- renderPrint({input$radioef2})
        
        fp1 <- x0capdgm21()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datef()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radioef1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 99
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
      }
    } else if (input$radioef == "ODGM (2, 1)") {
      
      if (input$radioef2 == "90") {
        
        output$cief <- renderPrint({input$radioef2})
        
        fp1 <- x0capodgm21()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datef()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radioef1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 90
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
        
      } else if (input$radioef2 == "95") {
        
        output$cief <- renderPrint({input$radioef2})
        
        fp1 <- x0capodgm21()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datef()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radioef1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 95
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
      } else if (input$radioef2 == "99") {
        
        output$cief <- renderPrint({input$radioef2})
        
        fp1 <- x0capodgm21()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datef()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radioef1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 99
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
      }
      
    } else if (input$radioef == "NDGM (1, 1)") {
      
      if (input$radioef2 == "90") {
        
        output$cief <- renderPrint({input$radioef2})
        
        fp1 <- x0capndgm()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datef()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radioef1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 90
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
        
      } else if (input$radioef2 == "95") {
        
        output$cief <- renderPrint({input$radioef2})
        
        fp1 <- x0capndgm()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datef()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radioef1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 95
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
      } else if (input$radioef2 == "99") {
        
        output$cief <- renderPrint({input$radioef2})
        
        fp1 <- x0capndgm()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datef()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radioef1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 99
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
      }
      
    } else if (input$radioef == "VSSGM (1, 1)") {
      
      if (input$radioef2 == "90") {
        
        output$cief <- renderPrint({input$radioef2})
        
        fp1 <- x0capvssgm()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datef()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radioef1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 90
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
        
      } else if (input$radioef2 == "95") {
        
        output$cief <- renderPrint({input$radioef2})
        
        fp1 <- x0capvssgm()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datef()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radioef1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 95
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
      } else if (input$radioef2 == "99") {
        
        output$cief <- renderPrint({input$radioef2})
        
        fp1 <- x0capvssgm()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datef()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radioef1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 99
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
      }
    } else if (input$radioef == "GOM (1, 1)") {
      
      if (input$radioef2 == "90") {
        
        output$cief <- renderPrint({input$radioef2})
        
        fp1 <- x0capgom()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datef()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radioef1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 90
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
        
      } else if (input$radioef2 == "95") {
        
        output$cief <- renderPrint({input$radioef2})
        
        fp1 <- x0capgom()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datef()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radioef1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 95
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
      } else if (input$radioef2 == "99") {
        
        output$cief <- renderPrint({input$radioef2})
        
        fp1 <- x0capgom()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datef()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radioef1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 99
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
      }
      
    } else if (input$radioef == "GOM_IA (1, 1)") {
      
      if (input$radioef2 == "90") {
        
        output$cief <- renderPrint({input$radioef2})
        
        fp1 <- x0capgomia()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datef()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radioef1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 90
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
        
      } else if (input$radioef2 == "95") {
        
        output$cief <- renderPrint({input$radioef2})
        
        fp1 <- x0capgomia()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datef()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radioef1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 95
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
      } else if (input$radioef2 == "99") {
        
        output$cief <- renderPrint({input$radioef2})
        
        fp1 <- x0capgomia()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datef()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radioef1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 99
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
      }
    } else if (input$radioef == "unbiased GOM (1, 1)") {
      
      if (input$radioef2 == "90") {
        
        output$cief <- renderPrint({input$radioef2})
        
        fp1 <- x0capungom()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datef()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radioef1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 90
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
        
      } else if (input$radioef2 == "95") {
        
        output$cief <- renderPrint({input$radioef2})
        
        fp1 <- x0capungom()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datef()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radioef1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 95
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
      } else if (input$radioef2 == "99") {
        
        output$cief <- renderPrint({input$radioef2})
        
        fp1 <- x0capungom()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datef()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radioef1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 99
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
      }
    } else if (input$radioef == "EXGM (1, 1)") {
      
      if (input$radioef2 == "90") {
        
        output$cief <- renderPrint({input$radioef2})
        
        fp1 <- x0capexgm()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datef()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radioef1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 90
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
        
      } else if (input$radioef2 == "95") {
        
        output$cief <- renderPrint({input$radioef2})
        
        fp1 <- x0capexgm()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datef()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radioef1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 95
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
      } else if (input$radioef2 == "99") {
        
        output$cief <- renderPrint({input$radioef2})
        
        fp1 <- x0capexgm()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datef()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radioef1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 99
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
      }
    }   
  })
  
  
  
  #' Extended Forms of Grey Models - Plots - render
  #' CI  - reactive
  output$plotef <- renderPlotly({
    
    if (input$radioef == "DGM (1, 1)") {
      
      if (input$radioef2 == "90") {
        
        x0 <- datef()
        n <- length(x0)
        x0cap2 <- x0capdgm11()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (90 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'DGM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
      } else if (input$radioef2 == "95") {
        
        x0 <- datef()
        n <- length(x0)
        x0cap2 <- x0capdgm11()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (95 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'DGM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
      } else if (input$radioef2 == "99") {
        
        x0 <- datef()
        n <- length(x0)
        x0cap2 <- x0capdgm11()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (99 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'DGM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      }
      
    } else if (input$radioef == "DGM (2, 1)") {
      
      if (input$radioef2 == "90") {
        
        x0 <- datef()
        n <- length(x0)
        x0cap2 <- x0capdgm21()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (90 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'DGM (2, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      } else if (input$radioef2 == "95") {
        
        x0 <- datef()
        n <- length(x0)
        x0cap2 <- x0capdgm21()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (95 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'DGM (2, 1)) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
      } else if (input$radioef2 == "99") {
        
        x0 <- datef()
        n <- length(x0)
        x0cap2 <- x0capdgm21()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (99 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'DGM (2, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      }
    } else if (input$radioef == "ODGM (2, 1)") {
      
      if (input$radioef2 == "90") {
        
        x0 <- datef()
        n <- length(x0)
        x0cap2 <- x0capodgm21()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (90 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'ODGM (2, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      } else if (input$radioef2 == "95") {
        
        x0 <- datef()
        n <- length(x0)
        x0cap2 <- x0capodgm21()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (95 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'ODGM (2, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
      } else if (input$radioef2 == "99") {
        
        x0 <- datef()
        n <- length(x0)
        x0cap2 <- x0capodgm21()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (99 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'ODGM (2, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      }
      
    } else if (input$radioef == "NDGM (1, 1)") {
      
      if (input$radioef2 == "90") {
        
        x0 <- datef()
        n <- length(x0)
        x0cap2 <- x0capndgm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (90 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'NDGM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      } else if (input$radioef2 == "95") {
        
        x0 <- datef()
        n <- length(x0)
        x0cap2 <- x0capndgm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (95 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'NDGM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
      } else if (input$radioef2 == "99") {
        
        x0 <- datef()
        n <- length(x0)
        x0cap2 <- x0capndgm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (99 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'NDGM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
      }
      
    } else if (input$radioef == "VSSGM (1, 1)") {
      
      if (input$radioef2 == "90") {
        
        x0 <- datef()
        n <- length(x0)
        x0cap2 <- x0capvssgm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (90 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'VSSGM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      } else if (input$radioef2 == "95") {
        
        x0 <- datef()
        n <- length(x0)
        x0cap2 <- x0capvssgm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (95 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'VSSGM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
      } else if (input$radioef2 == "99") {
        
        x0 <- datef()
        n <- length(x0)
        x0cap2 <- x0capvssgm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (99 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'VSSGM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
      }
    } else if (input$radioef == "GOM (1, 1)") {
      
      if (input$radioef2 == "90") {
        
        x0 <- datef()
        n <- length(x0)
        x0cap2 <- x0capgom()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (90 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'GOM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      } else if (input$radioef2 == "95") {
        
        x0 <- datef()
        n <- length(x0)
        x0cap2 <- x0capgom()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (95 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'GOM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      } else if (input$radioef2 == "99") {
        
        x0 <- datef()
        n <- length(x0)
        x0cap2 <- x0capgom()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (99 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'GOM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      }
    } else if (input$radioef == "GOM_IA (1, 1)") {
      
      if (input$radioef2 == "90") {
        
        x0 <- datef()
        n <- length(x0)
        x0cap2 <- x0capgomia()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (90 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'GOM_IA (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      } else if (input$radioef2 == "95") {
        
        x0 <- datef()
        n <- length(x0)
        x0cap2 <- x0capgomia()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (95 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'GOM_IA (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      } else if (input$radioef2 == "99") {
        
        
        x0 <- datef()
        n <- length(x0)
        x0cap2 <- x0capgomia()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (99 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'GOM_IA (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
      }
    } else if (input$radioef == "unbiased GOM (1, 1)") {
      
      if (input$radioef2 == "90") {
        
        x0 <- datef()
        n <- length(x0)
        x0cap2 <- x0capungom()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (90 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'Unbiased GOM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      } else if (input$radioef2 == "95") {
        
        x0 <- datef()
        n <- length(x0)
        x0cap2 <- x0capungom()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (95 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'Unbiased GOM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      } else if (input$radioef2 == "99") {
        
        x0 <- datef()
        n <- length(x0)
        x0cap2 <- x0capungom()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (99 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'Unbiased GOM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      }
    } else if (input$radioef == "EXGM (1, 1)") {
      
      if (input$radioef2 == "90") {
        
        x0 <- datef()
        n <- length(x0)
        x0cap2 <- x0capexgm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (90 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'EXGM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
      } else if (input$radioef2 == "95") {
        
        x0 <- datef()
        n <- length(x0)
        x0cap2 <- x0capexgm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (95 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'EXGM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
      } else if (input$radioef2 == "99") {
        
        x0 <- datef()
        n <- length(x0)
        x0cap2 <- x0capexgm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (99 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'EXGM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
        
      }
    }   
  })
  
  
  
  
  #' Combined models
  
  #' NGBM (1, 1) model Fitted - reactive
  #' Fitted values  
  x0capngbm <- reactive({
    x0 <- datcm()
    p <- seq(-1,0.999,by=0.001)
    set_p <- data.frame(p)
    fitness <- function(set_p)
    {
      p <- set_p[1]
      x1 <- cumsum(x0)
      n <- length(x0)
      b <- numeric(n)
      for (i in 1:n){
        b[i] <- -(0.5*x1[i + 1] + (1-0.5)*x1[i])
      }
      b1 <- b[1:n-1]
      mat1 <- matrix(c(b1),ncol=1)
      b2 <- -b1
      b2
      c <- numeric(n)
      for (i in 1:n){
        c[i] <- b2[i]^p
      }
      c1 <- c[1:n-1]
      mat2 <- matrix(c(c1), ncol = 1)
      B <- cbind(mat1,mat2)
      B[,1] <- t(t(b1[1:n-1]))
      yn <- matrix(c(x0),ncol=1)
      yn <- t(t(x0[2:n]))
      xcap <- solve (t(B) %*% B,tol = 1e-20) %*% t(B) %*% yn
      a <- xcap[1,1]
      b <- xcap[2,1]
      scale_with <- function(k)
      {
        ((x0[1]^(1-p) -(b/a)) * exp(-a*(1-p)*k) + (b/a)) ^ (1/(1-p))
      }
      forecast <- scale_with(0:n)
      x1cap <- c(forecast)
      x0cap <- numeric(n)
      for (i in 1:n){
        x0cap[i] <- x1cap[i+1] - x1cap[i]
      }
      x0cap1 <- x0cap[1:n-1]
      particule_result <- c(x0[1],x0cap1)
      fitness <- (1/n)*sum(abs((x0-particule_result)/x0)*100, na.rm=TRUE)
      return(fitness)
    }
    mape_values <- apply(set_p, 1, FUN = 'fitness')
    fitness_matrix <- matrix(c(mape_values),ncol=1)
    min_error <- which(mape_values == min(mape_values), arr.ind = TRUE)
    opt_values <- set_p[min_error,]
    #' NGBM model with optimized p
    x1 <- cumsum(x0)
    n <- length(x0)
    b <- numeric(n)
    for (i in 1:n){
      b[i] <- -(0.5*x1[i + 1] + (1-0.5)*x1[i])
    }
    b1 <- b[1:n-1]
    mat1 <- matrix(c(b1),ncol=1)
    b2 <- -b1
    c <- numeric(n)
    for (i in 1:n){
      c[i] <- b2[i]^(opt_values)
    }
    c1 <- c[1:n-1]
    mat2 <- matrix(c(c1), ncol = 1)
    B <- cbind(mat1,mat2)
    B[,1] <- t(t(b1[1:n-1]))
    yn <- matrix(c(x0),ncol=1)
    yn <- t(t(x0[2:n]))
    xcap <- solve (t(B) %*% B) %*% t(B) %*% yn
    a <- xcap[1,1]
    b <- xcap[2,1]
    scale_with <- function(k,opt_values)
    {
      ((x0[1]^(1-opt_values) -(b/a)) * exp(-a*(1-opt_values)*k) + (b/a)) ^ (1/(1-opt_values))
    }
    forecast <- scale_with(0:n, opt_values)
    x1cap <- c(forecast)
    x0cap <- numeric(n)
    for (i in 1:n){
      x0cap[i] <- x1cap[i+1] - x1cap[i]
    }
    x0cap1 <- x0cap[1:n-1]
    x0cap <- c(x0[1],x0cap1)
    A <- 4
    x1cap4 <- scale_with(1 : n+A-1, opt_values )
    t4 <- length(x1cap4)
    x0cap4 <- numeric(t4)
    for (i in 1:t4-1) {
      x0cap4[i] <- x1cap4[i+1] - x1cap4[i]
    }
    x0cap4 <- c(x0[1],x0cap4[1:t4-1])
    x0cap5 <- tail(x0cap4,A)
    # Fitted & Predicted values
    x0cap2 <- c(x0cap,x0cap5)
    
  })
  
  #' GGVM (1, 1) model Fitted - reactive
  #' Fitted values  
  x0capggvm <- reactive({
    x0 <- datcm()
    x1 <- cumsum(x0)
    n <- length(x0)
    y <- matrix(c(x0),ncol=1)
    y <- t(t(x0[2:n]))
    b <- numeric(n)
    for (i in 1:n){
      b[i] <- -0.5*(x1[i+1] + x1[i])
    }
    b1 <- b[1:n-1]
    mat1 <- matrix(c(b1),ncol=1)
    c <- numeric(n)
    for (i in 1:n){
      c[i] <- (b1[i])^2
    }
    c1 <- c[1:n-1]
    mat2 <-matrix(c(c1),ncol=1)
    mat3 <- matrix(1,nrow=n-1,ncol=1)
    B <- cbind(mat1, mat2, mat3)
    Bcap <- (solve (t(B) %*% B)) %*% t(B) %*% y
    alpha <- Bcap[1,1]
    beta <- Bcap[2,1]
    miu <- Bcap[3,1]
    alpha2 <- alpha^2
    lambda <- sqrt( alpha2 - (4*beta*miu) )
    v <- (2*beta*x0[1] - alpha - lambda)
    w <- (2*beta*x0[1] - alpha + lambda)
    phi1 <- abs(v/w)
    phi <- 1 - (  ((1/lambda)*log(phi1)) )
    scale_with <- function(k)
    {
      alpha/(2*beta) - ((lambda/(2*beta))*( 1 - (2/(exp(lambda*(k-phi))+1))))
    }
    forecast <- scale_with(1:n)
    x1cap <- c(forecast)
    x0cap1 <- numeric(n)
    for (i in 1:n){
      x0cap1[i] <- x1cap[i+1] - x1cap[i]
    }
    x0cap <- c(x0[1],x0cap1[1:n-1])
    A <- 4
    x1cap4 <- scale_with(1 : n+A )
    t4 <- length(x1cap4)
    x0cap4 <- numeric(t4)
    for (i in 1:t4-1) {
      x0cap4[i] <- x1cap4[i+1] - x1cap4[i]
    }
    x0cap4 <- c(x0[1],x0cap4[1:t4-1])
    x0cap5 <- tail(x0cap4,A)
    # Fitted & Predicted values
    x0cap2 <- c(x0cap,x0cap5)
    
  })  
  
  #' TFDGM(1, 1) model Fitted - reactive
  #' Fitted values  
  x0captfdgm <- reactive({
    x0 <- datcm()
    x1 <- cumsum(x0)
    n <- length(x0)
    z <- numeric(n)
    for (i in 1:n){
      z[i] <- 0.5*(x1[i+1] + x1[i])
    }
    z1 <- z[1:n-1]
    mat2 <- matrix(c(z1),ncol=1)
    for (i in 1:n){
      z[i] <- (0.5*(x1[i+1] + x1[i]))^2
    }
    z2 <- z[1:n-1]
    mat1 <- matrix(c(z2),ncol=1)
    mat3 <- matrix(1,nrow=n-1,ncol=1)
    B <- cbind(mat1, mat2, mat3)
    y <- matrix(c(x0),ncol=1)
    y <- t(t(x0[2:n]))
    pcap <- (solve (t(B) %*% B)) %*% t(B) %*% y
    a <- pcap[1,1]
    b <- pcap[2,1]
    lambda <- pcap[3,1]
    p <- b/(2*a)
    q <- ((b^2)/(4*(a^2))) - (lambda/a)
    forecast <- numeric(n)
    for (k in 1:n){
      if (q == 0){
        C2 <- (-1 / (x0[1] + p)) - a
        forecast[k] <-  ( -1 / ((a*k) + C2) ) - p
      } else if (q < 0) {
        c3 <- (1/sqrt(-q)) * atan( (x0[1]+p) / sqrt(-q) ) - a
        forecast[k] <-  sqrt(-q)* tan( sqrt(-q) * ( (a*k) + c3 ) ) - p
      }
    }
    x1cap <- c(forecast)
    x0cap <- numeric(n)
    for (i in 1:n){
      x0cap[i] <- x1cap[i+1] - x1cap[i]
    }
    x0cap1 <- x0cap[1:n-1]
    x0cap <- c(x0[1],x0cap1)
    A <- 4
    forecasta <- numeric(n)
    for (k in 1:n+A){
      if (q == 0){
        C2 <- (-1 / (x0[1] + p)) - a
        forecast[k] <-  ( -1 / ((a*k) + C2) ) - p
      } else if (q < 0) {
        c3 <- (1/sqrt(-q)) * atan( (x0[1]+p) / sqrt(-q) ) - a
        forecasta[k] <-  sqrt(-q)* tan( sqrt(-q) * ( (a*k) + c3 ) ) - p
      }
    }
    x1cap4 <- c(forecasta)
    t4 <- length(x1cap4)
    x0cap4 <- numeric(t4)
    for (i in 1:t4-1) {
      x0cap4[i] <- x1cap4[i+1] - x1cap4[i]
    }
    x0cap4 <- c(x0[1],x0cap4[1:t4-1])
    x0cap5 <- tail(x0cap4,A)
    # Fitted & Predicted values
    x0cap2 <- c(x0cap,x0cap5)
    
  }) 
  
  
  #' Combined Models - Actual and Fitted - render
  #' original and fitted data   
  output$x0capcm <- renderTable({
    if (input$radiocm == "NGBM (1, 1) model") {
      
      output$cm <- renderText({
        paste("NGBM (1, 1) model: Non-linear grey Bernoulli model", 
              "The NGBM (1, 1) model function takes as input raw values and output predicted values following the paper by", 
              "Chen C (2008). Application of the Novel Nonlinear Grey Bernoulli Model for Forecasting Unemployment Rate.", 
              "Chaos, Solitons and Fractals, 37(1), 278-287.",
              sep = "\n") 
      })
      
      Actual <- datcm()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capngbm()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      epgm11 <- data.frame(Actual,Fitted)
      
    } else if (input$radiocm == "GGVM (1, 1) model") {
      
      output$cm <- renderText({
        paste("GGVM (1, 1) model: Grey generalized Verhulst model", 
              "The GGVM (1, 1) model function takes as input raw values and output predicted values following the paper by", 
              "Zhou W, Pei L (2020). The Grey Generalized Verhulst model and its Application for Forecasting Chinese Pig",
              "Price Index. Soft Computing, 24, 4977-4990.",
              sep = "\n") 
      })
      
      Actual <- datcm()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capggvm()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      epgm11 <- data.frame(Actual,Fitted)
      
    } else if (input$radiocm == "TFDGM (1, 1) model") {
      
      output$cm <- renderText({
        paste("TFDGM (1, 1) model: Traffic flow mechanics grey model", 
              "The TFDGM (1, 1) model function takes as input raw values and output predicted values following the paper by", 
              "Xiao X, Duan H (2020). A New Grey Model for Traffic Fow Mechanisms. Engineering Applications of Artificial",
              "Intelligence, 88(2020), 103350.",
              sep = "\n") 
      })
      
      Actual <- datcm()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0captfdgm()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      epgm11 <- data.frame(Actual,Fitted)
      
    }
  })
  
  #' Predicted values - render 
  #' Combined Models 
  output$predictedcm <- renderTable({
    
    if (input$radiocm == "NGBM (1, 1) model") {
      
      output$cmpv <- renderPrint({input$radiocm1})
      
      actual1 <- datcm()
      actual2 <- t(datcm())
      n <- length(actual2)
      fitted1 <- x0capngbm()
      x <- input$radiocm1
      fitted3 <- tail(fitted1,4)
      fitted4 <- t(fitted3[1:x])
      
    } else if (input$radiocm == "GGVM (1, 1) model") {
      
      output$cmpv <- renderPrint({input$radiocm1})
      
      actual1 <- datcm()
      actual2 <- t(datcm())
      n <- length(actual2)
      fitted1 <- x0capggvm()
      x <- input$radiocm1
      fitted3 <- tail(fitted1,4)
      fitted4 <- t(fitted3[1:x])
      
    } else if (input$radiocm == "TFDGM (1, 1) model") {
      
      output$cmpv <- renderPrint({input$radiocm1})
      
      actual1 <- datcm()
      actual2 <- t(datcm())
      n <- length(actual2)
      fitted1 <- x0captfdgm()
      x <- input$radiocm1
      fitted3 <- tail(fitted1,4)
      fitted4 <- t(fitted3[1:x])
      
    }
  }) 
  
  #' Combined Models - Error - render
  #' MAPE and RMSE  
  output$errorcm <- renderTable({
    
    if (input$radiocm == "NGBM (1, 1) model") {
      
      Actual <- datcm()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capngbm()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      MAPE <- mape(Actual,Fitted)*100
      RMSE <- rmse(Actual,Fitted)
      pe <- data.frame(MAPE,RMSE)
      
    } else if (input$radiocm == "GGVM (1, 1) model") {
      
      Actual <- datcm()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capggvm()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      MAPE <- mape(Actual,Fitted)*100
      RMSE <- rmse(Actual,Fitted)
      pe <- data.frame(MAPE,RMSE)
      
    } else if (input$radiocm == "TFDGM (1, 1) model") {
      
      Actual <- datcm()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0captfdgm()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      MAPE <- mape(Actual,Fitted)*100
      RMSE <- rmse(Actual,Fitted)
      pe <- data.frame(MAPE,RMSE)
      
    }
  })
  
  
  #' Combined Models - Prediction Intervals - render
  #' CI  - reactive
  output$intervalscm <- renderTable({
    
    if (input$radiocm == "NGBM (1, 1) model") {
      
      if (input$radiocm2 == "90") {
        
        output$cicm <- renderPrint({input$radiocm2})
        
        fp1 <- x0capngbm()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datcm()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiocm1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 90
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
        
      } else if (input$radiocm2 == "95") {
        
        output$cicm <- renderPrint({input$radiocm2})
        
        fp1 <- x0capngbm()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datcm()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiocm1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 95
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
      } else if (input$radiocm2 == "99") {
        
        output$cicm<- renderPrint({input$radiocm2})
        
        fp1 <- x0capngbm()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datcm()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiocm1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 99
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
      }
      
    } else if (input$radiocm == "GGVM (1, 1) model") { 
      
      if (input$radiocm2 == "90") {
        
        output$cicm <- renderPrint({input$radiocm2})
        
        fp1 <- x0capggvm()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datcm()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiocm1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 90
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
      } else if (input$radiocm2 == "95") {
        
        output$cicm <- renderPrint({input$radiocm2})
        
        fp1 <- x0capggvm()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datcm()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiocm1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 95
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
      } else if (input$radiocm2 == "99") {
        
        output$cicm<- renderPrint({input$radiocm2})
        
        fp1 <- x0capggvm()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datcm()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiocm1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 99
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
      }
      
    } else if (input$radiocm == "TFDGM (1, 1) model") { 
      
      if (input$radiocm2 == "90") {
        
        output$cicm <- renderPrint({input$radiocm2})
        
        fp1 <- x0captfdgm()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datcm()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiobv1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 90
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
        
      } else if (input$radiocm2 == "95") {
        
        output$cicm <- renderPrint({input$radiocm2})
        
        fp1 <- x0captfdgm()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datcm()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiocm1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 95
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
      } else if (input$radiocm2 == "99") {
        
        output$cicm<- renderPrint({input$radiocm2})
        
        fp1 <- x0captfdgm()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datcm()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiocm1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 99
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
      }
    }   
  })
  
  
  
  #' Combined Models - Plots - render
  output$plotcm <- renderPlotly({
    
    if (input$radiocm == "NGBM (1, 1) model") {
      
      if (input$radiocm2 == "90") {
        
        x0 <- datcm()
        n <- length(x0)
        x0cap2 <- x0capngbm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (90 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'NGBM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      } else if (input$radiocm2 == "95") {
        
        x0 <- datcm()
        n <- length(x0)
        x0cap2 <- x0capngbm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (95 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'NGBM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
        
      } else if (input$radiocm2 == "99") {
        
        x0 <- datcm()
        n <- length(x0)
        x0cap2 <- x0capngbm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (99 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'NGBM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      }
      
    } else if (input$radiocm == "GGVM (1, 1) model") { 
      
      if (input$radiocm2 == "90") {
        
        x0 <- datcm()
        n <- length(x0)
        x0cap2 <- x0capggvm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (90 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'GGVM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
      } else if (input$radiocm2 == "95") {
        
        x0 <- datcm()
        n <- length(x0)
        x0cap2 <- x0capggvm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (95 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'GGVM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
      } else if (input$radiocm2 == "99") {
        
        x0 <- datcm()
        n <- length(x0)
        x0cap2 <- x0capggvm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (99 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'GGVM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
      }
      
    } else if (input$radiocm == "TFDGM (1, 1) model") { 
      
      if (input$radiocm2 == "90") {
        
        x0 <- datcm()
        n <- length(x0)
        x0cap2 <- x0captfdgm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (90 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'TFDGM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
      } else if (input$radiocm2 == "95") {
        
        x0 <- datcm()
        n <- length(x0)
        x0cap2 <- x0captfdgm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (95 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'TFDGM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      } else if (input$radiocm2 == "99") {
        
        x0 <- datcm()
        n <- length(x0)
        x0cap2 <- x0captfdgm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (99 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'TFDGM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
      }
    }   
  }) 
  
  
  #' Parameters Estimation 
  #' SOGM (2,1) model Fitted - reactive
  #' Fitted values  
  x0capsogm21 <- reactive({
    x0 <- datpe()
    n <- length(x0)
    x1 <- cumsum(x0)
    y <- matrix(c(x0),ncol=1)
    y <- t(t(x0[2:n]))
    xminus <- numeric(n)
    for (i in 1:n){
      xminus[i] <- -(x0[i+1] - x0[i])
    }
    xminus1 <- xminus[1:n-1]
    mat1 <- matrix(c(xminus1),ncol=1)
    d <- numeric(n)
    for (i in 1:n){
      d[i] <- -0.5*(x1[i+1] + x1[i])
    }
    d1 <- d[1:n-1]
    mat2 <- matrix(c(d1),ncol=1)
    mat3 <- matrix(1,nrow=n-1,ncol=1)
    B2 <- cbind(mat1, mat2, mat3)
    p <- (solve (t(B2) %*% B2)) %*% t(B2) %*% y
    alpha1 <- p[1,1]
    alpha2 <- p[2,1]
    b <- p[3,1]
    omega1 <- quadratic(alpha1,1,alpha2)
    omega <- matrix(c(omega1),ncol=1)
    r1 <- omega[1,1]
    r2 <- omega[2,1]
    delta <- r1*r2
    # Calculate c1 and c2
    c1 <- ( (r2*exp(r2*(n-1))*x0[n]) - (r2*exp(r2*(n))*x0[n-1]) ) / ( (r1*r2*exp((r1*n)+(r2*(n-1)))) - (r1*r2*exp((r2*n)+(r1*(n-1)))) )
    c2 <- ( (r1*exp(r1*(n))*x0[n-1]) - (r1*exp(r1*(n-1))*x0[n]) ) / ( (r1*r2*exp((r1*n)+(r2*(n-1)))) - (r1*r2*exp((r2*n)+(r1*(n-1)))) )
    x0cap1 <- numeric(n)
    for (k in 1:n){
      if (delta < 1/4){
        x0cap1[k] <- (c1*r1*exp(r1*k)) + (c2*r2*exp(r2*k))
      } else if (delta <- 1/4) {
        r <- r1
        x0cap1[k] <- ( (r*c1) + (r*c2*k) + c2 )*exp(r*k)
      }
    }
    x0cap <- c(x0cap1)
    A <- 4
    x0cap4 <- numeric(n+A)
    for (k in 1:n+A){
      if (delta < 1/4){
        x0cap4[k] <- (c1*r1*exp(r1*k)) + (c2*r2*exp(r2*k))
      } else if (delta <- 1/4) {
        r <- r1
        x0cap4[k] <- ( (r*c1) + (r*c2*k) + c2 )*exp(r*k)
      }
    }
    x0cap5 <- tail(x0cap4,A)
    # Fitted & Predicted values
    x0cap2 <- c(x0cap,x0cap5)
  })  
  
  
  #' NGM (1,1,k) model Fitted - reactive
  #' Fitted values  
  x0capngm11k <- reactive({
    x0 <- datpe()  
    x1 <- cumsum(x0)
    n <- length(x0)
    yn <- matrix(c(x0),ncol=1)
    yn <- t(t(x0[2:n]))
    b <- numeric(n)
    for (i in 1:n){
      b[i] <- -0.5*(x1[i+1] + x1[i])
      b1 <- b[1:n-1]
    }
    mat1 <- matrix(c(b1),ncol=1)
    c <- numeric(n)
    for (i in 1:n){
      c[i] <- (i)
      c1 <- c[2:n]
    }
    mat2 <-matrix(c(c1),ncol=1)
    B2 <- cbind(mat1, mat2)
    rcap <- (solve (t(B2) %*% B2)) %*% t(B2) %*% yn
    a <- rcap[1,1]
    b <- rcap[2,1]
    scale_with <- function(k)
    {
      (1 - exp(a)) * (x1[1] - (b/a) + (b/(a^2)) ) * (exp(-a * (k-1))) + (b/a)
    }
    forecast1 <- scale_with(2:n)
    x0cap <- c(x0[1],forecast1)
    A <- 4
    x0cap4 <- scale_with(1 : n+A)
    x0cap5 <- tail(x0cap4,A)
    # Fitted & Predicted values
    x0cap2 <- c(x0cap,x0cap5)
  })  
  
  
  #' NGM (1,1,k,c) model Fitted - reactive
  #' Fitted values  
  x0capngm11kc <- reactive({
    x0 <- datpe()  
    x1 <- cumsum(x0)
    n <- length(x0)
    y <- matrix(c(x0),ncol=1)
    y <- t(t(x0[2:n]))
    b <- numeric(n)
    for (i in 1:n){
      b[i] <- -0.5*(x1[i+1] + x1[i])
      b1 <- b[1:n-1]
    }
    mat1 <- matrix(c(b1),ncol=1)
    mat2 <-matrix(2:n, nrow=n-1,ncol=1)
    mat3 <- matrix(1,nrow=n-1,ncol=1)
    B2 <- cbind(mat1, mat2, mat3)
    rcap <- (solve (t(B2) %*% B2)) %*% t(B2) %*% y
    a <- rcap[1,1]
    b <- rcap[2,1]
    c <- rcap[3,1]
    scale_with <- function(k)
    {
      (x1[1] - (b/a) + (b/(a^2)) - (c/a)) * (1- exp(a)) * exp(-a*k) + (b/a)
    }
    forecast1 <- scale_with(1:n)
    x0cap <- c(x0[1],forecast1[1:n-1])
    A <- 4
    x0cap4 <- scale_with(1 : n+A-1 )
    x0cap5 <- tail(x0cap4,A)
    # Fitted & Predicted values
    x0cap2 <- c(x0cap,x0cap5)
    
  }) 
  
  #' ONGM (1,1,k,c) model Fitted - reactive
  #' Fitted values  
  x0capongm11kc <- reactive({
    x0 <- datpe()  
    x1 <- cumsum(x0)
    tm <- length(x0)
    y <- matrix(c(x0),ncol=1)
    y <- t(t(x0[2:tm]))
    b <- numeric(tm)
    for (i in 1:tm){
      b[i] <- -0.5*(x1[i+1] + x1[i])
    }
    b1 <- b[1:tm-1]
    mat1 <- matrix(c(b1),ncol=1)
    mat2 <-matrix(2:tm, nrow=tm-1,ncol=1)
    mat3 <- matrix(1,nrow=tm-1,ncol=1)
    B2 <- cbind(mat1, mat2, mat3)
    rcap <- (solve (t(B2) %*% B2)) %*% t(B2) %*% y
    a <- rcap[1,1]
    b <- rcap[2,1]
    c <- rcap[3,1]
    m <- log ((2+a)/(2-a))
    n <- (m*b)/a
    p <- (m*c)/a - (n/a) + (n/2) + (n/m)
    scale_with <- function(k)
    {
      (1-exp(a))*(x1[1]-(n/m)+(n/(m^2))-(p/m))*exp(-m*(k-1))+(n/m)
    }
    forecast1 <- scale_with(2:tm)
    x0cap <- c(x0[1],forecast1)
    A <- 4
    x0cap4 <- scale_with(1 : tm+A )
    x0cap5 <- tail(x0cap4,A)
    # Fitted & Predicted values
    x0cap2 <- c(x0cap,x0cap5)
    
  })   
  
  
  #' Parameters Estimations - Actual and Fitted - render
  #' original and fitted data   
  
  output$x0cappe <- renderTable({
    if (input$radiope == "SOGM (2, 1) model") {
      
      output$pe <- renderText({
        paste("SOGM (2, 1) model: Structured optimized grey model with single variable and second order differential equation", 
              "The SOGM (2, 1) function takes as input raw values and output predicted values following the paper by",
              "Xu N, Dang Y (2015). An Optimized Grey GM (2, 1) Model and Forecasting of Highway Subgrade",
              "Settlement. Mathematical Problems in Engineering, 2015(1), 1-6.",
              sep = "\n") 
      })
      
      Actual <- datpe()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capsogm21()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      sogm21 <- data.frame(Actual,Fitted)
      
    } else if (input$radiope == "NGM (1, 1, k) model") {
      
      output$pe <- renderText({
        paste("NGM (1, 1, k) model: Nonlinear grey model", 
              "The NGM (1, 1, k) function takes as input raw values and output predicted values following the paper by",
              "Chen P, Yu H (2014). Foundation Settlement Prediction based on a Novel NGM Model. Mathematical",
              "Problems in Engineering 2014, 242809.", sep = "\n")
      })
      
      Actual <- datpe()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capngm11k()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      sogm21 <- data.frame(Actual,Fitted)
      
    } else if (input$radiope == "NGM (1, 1, k, c) model") {
      
      output$pe <- renderText({
        paste("NGM (1, 1, k, c) model: Nonlinear grey model", 
              "The NGM (1, 1, k, c) function takes as input raw values and output predicted values following the paper by",
              "Chen P, Yu H (2014). Foundation Settlement Prediction based on a Novel NGM Model. Mathematical",
              "Problems in Engineering 2014, 242809.", sep = "\n")
      })
      
      Actual <- datpe()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capngm11kc()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      sogm21 <- data.frame(Actual,Fitted)
      
    } else if (input$radiope == "ONGM (1, 1, k, c) model") {
      
      output$pe <- renderText({
        paste("ONGM (1, 1, k, c) model: Nonlinear grey model", 
              "The ONGM (1, 1, k, c) function takes as input raw values and output predicted values following the paper by",
              "Chen P, Yu H (2014). Foundation Settlement Prediction based on a Novel NGM Model. Mathematical",
              "Problems in Engineering 2014, 242809.", sep = "\n")
      })
      
      Actual <- datpe()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capongm11kc()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      sogm21 <- data.frame(Actual,Fitted)
    }
  })
  
  #' Predicted values - render 
  #' Parameters Estimation Models 
  output$predictedpe <- renderTable({
    
    if (input$radiope == "SOGM (2, 1) model") {
      
      output$pepv <- renderPrint({input$radiope1})
      
      actual1 <- datpe()
      actual2 <- t(datpe())
      n <- length(actual2)
      fitted1 <- x0capsogm21()
      x <- input$radiope1
      fitted3 <- tail(fitted1,4)
      fitted4 <- t(fitted3[1:x])
      
      
    } else if (input$radiope == "NGM (1, 1, k) model") {
      
      output$pepv <- renderPrint({input$radiope1})
      
      actual1 <- datpe()
      actual2 <- t(datpe())
      n <- length(actual2)
      fitted1 <- x0capngm11k()
      x <- input$radiope1
      fitted3 <- tail(fitted1,4)
      fitted4 <- t(fitted3[1:x])
      
      
    } else if (input$radiope == "NGM (1, 1, k, c) model") {
      
      output$pepv <- renderPrint({input$radiope1})
      
      actual1 <- datpe()
      actual2 <- t(datpe())
      n <- length(actual2)
      fitted1 <- x0capngm11kc()
      x <- input$radiope1
      fitted3 <- tail(fitted1,4)
      fitted4 <- t(fitted3[1:x])
      
    } else if (input$radiope == "ONGM (1, 1, k, c) model") {
      
      output$pepv <- renderPrint({input$radiope1})
      
      actual1 <- datpe()
      actual2 <- t(datpe())
      n <- length(actual2)
      fitted1 <- x0capongm11kc()
      x <- input$radiope1
      fitted3 <- tail(fitted1,4)
      fitted4 <- t(fitted3[1:x])
    }
  })
  
  #' Parameters Estimation - Error - render
  #' MAPE and RMSE
  output$errorpe <- renderTable({
    
    if (input$radiope == "SOGM (2, 1) model") {
      
      Actual <- datpe()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capsogm21()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      MAPE <- mape(Actual,Fitted)*100
      RMSE <- rmse(Actual,Fitted)
      pe <- data.frame(MAPE,RMSE)
      
    } else if (input$radiope == "NGM (1, 1, k) model") {  
      
      Actual <- datpe()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capngm11k()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      MAPE <- mape(Actual,Fitted)*100
      RMSE <- rmse(Actual,Fitted)
      pe <- data.frame(MAPE,RMSE)
      
    } else if (input$radiope == "NGM (1, 1, k, c) model") {  
      
      Actual <- datpe()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capngm11kc()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      MAPE <- mape(Actual,Fitted)*100
      RMSE <- rmse(Actual,Fitted)
      pe <- data.frame(MAPE,RMSE)
      
    } else if (input$radiope == "ONGM (1, 1, k, c) model") {  
      
      Actual <- datpe()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capongm11kc()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      MAPE <- mape(Actual,Fitted)*100
      RMSE <- rmse(Actual,Fitted)
      pe <- data.frame(MAPE,RMSE)
    }
  })
  
  
  #' Parameters Estimation - Prediction Intervals - render
  #' CI  - reactive
  output$intervalspe <- renderTable({
    
    if (input$radiope == "SOGM (2, 1) model") {
      
      if (input$radiope2 == "90") {
        
        output$cipe <- renderPrint({input$radiope2})
        
        fp1 <- x0capsogm21()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datpe()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiope1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 90
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
        
      } else if (input$radiope2 == "95") {
        
        output$cipe <- renderPrint({input$radiope2})
        
        fp1 <- x0capsogm21()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datpe()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiope1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 95
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
        
      } else if (input$radiope2 == "99") { 
        
        
        output$cipe <- renderPrint({input$radiope2})
        
        fp1 <- x0capsogm21()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datpe()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiope1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 99
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
      }
      
    } else if (input$radiope == "NGM (1, 1, k) model") {
      
      if (input$radiope2 == "90") {
        
        output$cipe <- renderPrint({input$radiope2})
        
        fp1 <- x0capngm11k()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datpe()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiope1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 90
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
        
      } else if (input$radiope2 == "95") {
        
        output$cipe <- renderPrint({input$radiope2})
        
        fp1 <- x0capngm11k()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datpe()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiope1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 95
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
        
      } else if (input$radiope2 == "99") { 
        
        
        output$cipe <- renderPrint({input$radiope2})
        
        fp1 <- x0capngm11k()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datpe()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiope1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 99
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
      }
      
    } else if (input$radiope == "NGM (1, 1, k, c) model") {
      
      if (input$radiope2 == "90") {
        
        output$cipe <- renderPrint({input$radiope2})
        
        fp1 <- x0capngm11kc()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datpe()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiope1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 90
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
        
      } else if (input$radiope2 == "95") {
        
        output$cipe <- renderPrint({input$radiope2})
        
        fp1 <- x0capngm11kc()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datpe()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiope1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 95
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
        
      } else if (input$radiope2 == "99") { 
        
        
        output$cipe <- renderPrint({input$radiope2})
        
        fp1 <- x0capngm11kc()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datpe()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiope1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 99
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
      }
    } else if (input$radiope == "ONGM (1, 1, k, c) model") {
      
      if (input$radiope2 == "90") {
        
        output$cipe <- renderPrint({input$radiope2})
        
        fp1 <- x0capongm11kc()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datpe()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiope1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 90
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
        
      } else if (input$radiope2 == "95") {
        
        output$cipe <- renderPrint({input$radiope2})
        
        fp1 <- x0capongm11kc()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datpe()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiope1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 95
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
        
      } else if (input$radiope2 == "99") { 
        
        
        output$cipe <- renderPrint({input$radiope2})
        
        fp1 <- x0capongm11kc()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datpe()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiope1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 99
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        LowerBound <- c(l[1:t])
        UpperBound <- c(u[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
      }
    }   
  })
  
  #' Parameters Estimation - Plots- render
  #' CI  - reactive
  output$plotpe <- renderPlotly({
    
    if (input$radiope == "SOGM (2, 1) model") {
      
      if (input$radiope2 == "90") {
        
        x0 <- datpe()
        n <- length(x0)
        x0cap2 <- x0capsogm21()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (90 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'SOGM (2, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
      } else if (input$radiope2 == "95") {
        
        x0 <- datpe()
        n <- length(x0)
        x0cap2 <- x0capsogm21()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (95 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'SOGM (2, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
      } else if (input$radiope2 == "99") { 
        
        x0 <- datpe()
        n <- length(x0)
        x0cap2 <- x0capsogm21()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (99 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'SOGM (2, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
      }
      
    } else if (input$radiope == "NGM (1, 1, k) model") {
      
      if (input$radiope2 == "90") {
        
        x0 <- datpe()
        n <- length(x0)
        x0cap2 <- x0capngm11k()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (90 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'NGM (1, 1, k) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      } else if (input$radiope2 == "95") {
        
        x0 <- datpe()
        n <- length(x0)
        x0cap2 <- x0capngm11k()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (95 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'NGM (1, 1, k) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      } else if (input$radiope2 == "99") { 
        
        x0 <- datpe()
        n <- length(x0)
        x0cap2 <- x0capngm11k()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (99 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'NGM (1, 1, k) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      }
      
    } else if (input$radiope == "NGM (1, 1, k, c) model") {
      
      if (input$radiope2 == "90") {
        
        x0 <- datpe()
        n <- length(x0)
        x0cap2 <- x0capngm11kc()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (90 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'NGM (1, 1, k, c) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
      } else if (input$radiope2 == "95") {
        
        x0 <- datpe()
        n <- length(x0)
        x0cap2 <- x0capngm11kc()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (95 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'NGM (1, 1, k, c) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
      } else if (input$radiope2 == "99") { 
        
        x0 <- datpe()
        n <- length(x0)
        x0cap2 <- x0capngm11kc()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (99 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'NGM (1, 1, k, c) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
      }
    } else if (input$radiope == "ONGM (1, 1, k, c) model") {
      
      if (input$radiope2 == "90") {
        
        x0 <- datpe()
        n <- length(x0)
        x0cap2 <- x0capongm11kc()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (90 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'ONGM (1, 1, k, c) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
      } else if (input$radiope2 == "95") {
        
        x0 <- datpe()
        n <- length(x0)
        x0cap2 <- x0capongm11kc()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (95 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'ONGM (1, 1, k, c) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
      } else if (input$radiope2 == "99") { 
        
        x0 <- datpe()
        n <- length(x0)
        x0cap2 <- x0capongm11kc()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (99 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'ONGM (1, 1, k, c) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
      }
    }   
  })
  
  
  #' Optimization of parameters
  #' PSO-GM (1, 1) model Fitted - reactive
  #' optimal values a and b
  optpsogm <- reactive({  
    x0 <- datopt()
    n <- length(x0)
    fitness_function <- function(values){
      n <- length(x0)
      a <- values[1]
      b <- values[2]
      scale_with <- function(k){
        (x0[1] - (b/a)) * exp(-a*k) * (1 - exp(a))
      }
      fitted <- scale_with(2:n-1)
      particule_result <- c(x0[1],fitted)
      fitness <- -(1/n)*sum(abs((x0-particule_result)/x0)*100, na.rm=TRUE)
      return(fitness)
    }
    values_ranges <- list(c(-1,1),c(0,1000))
    swarm <- ParticleSwarm$new(pop_size = 200,
                               values_names = list("a","b"),
                               fitness_function = fitness_function,
                               max_it = 100,
                               acceleration_coefficient_range = list(c(0.5,1.5),c(0.5,1.5)),
                               inertia = 0.7,
                               ranges_of_values = values_ranges)
    
    swarm$run(plot = FALSE,verbose = FALSE,save_file = FALSE)
    swarm$swarm_best_values
    opt_a <- swarm$swarm_best_values[1]
    opt_b <- swarm$swarm_best_values[2]
    optim_values <- matrix(c(opt_a,opt_b),ncol=2)
    colnames(optim_values, do.NULL = FALSE)
    colnames(optim_values) <- c("optimized value a","optimized value b")
    optim_values
  })
  
  
  #' EGM (1, 1, r) model Fitted - reactive
  #' optimal value r
  optegm11r <- reactive({  
    x0 <- datopt()
    fitness_function <- function(values){
      n <- length(x0)
      r <- values[1]
      xr <- replicate(n,0)
      for (k in 1:n){
        sm <- 0
        for (i in 1:k){
          sm <- sm + ( ( gamma(r+k-i)/( gamma(k-i+1) * gamma(r) ) ) * x0[i] )
        }
        xr[k] <- 1*sm
      }
      z <- numeric(n)
      for (i in 1:n){
        z[i] <- -0.5*(xr[i+1] + xr[i])
      }
      z1 <- z[1:n-1]
      mat1 <- matrix(c(z1),ncol=1)
      mat2 <- matrix(1,nrow=n-1,ncol=1)
      B <- cbind(mat1, mat2)
      f <- numeric(n)
      for (i in 1:n){
        f[i] <- (xr[i+1] - xr[i])
      }
      f1 <- f[1:n-1]
      y <- matrix(c(f1),ncol=1)
      acap <- summary(lm(y~B))$coefficients
      a <-acap[2]
      b <-acap[1]
      delta1 <- (1-(0.5*a))/(1+(0.5*a))
      delta2 <- b/(1+(0.5*a))
      xcap <- replicate(n,0)
      for (k in 2:n){
        sm <- 0
        for (i in 2:k-2){
          sm <- sm + ( (delta1^i) * delta2 )
        }
        xcap[k] <- sm + ( delta1^(k-1) * x0[1])
      }
      f1 <- c(x0[1],xcap[2:n])
      l1 <- length(f1)
      fa <- replicate(n,0)
      for (k in 2:n){
        sm <- 0
        for (i in 1:k-1){
          sm <- sm + ( ((-1)^i)* ( gamma(r+1) / ( gamma(i+1)*gamma(r-i+1) ) ) * f1[k-i] )
        }
        fa[k] <- sm * 1
      }
      f2 <- fa[2:n]
      particule_result <- c(x0[1],f2)
      fitness <- -(1/n)*sum(abs((x0-particule_result)/x0)*100, na.rm=TRUE)
      return(fitness)
    }
    values_ranges <- list(c(-100,100))
    swarm <- ParticleSwarm$new(pop_size = 100,
                               values_names = list("r"),
                               fitness_function = fitness_function,
                               max_it = 100,
                               acceleration_coefficient_range = list(c(0.5,1.5),c(0.5,1.5)),
                               inertia = 0.7,
                               ranges_of_values = values_ranges)
    swarm$run(plot = FALSE,verbose = FALSE,save_file = FALSE)
    opt_r <- swarm$swarm_best_values[1]
    optim_values <- matrix(c(opt_r),ncol=1)
    colnames(optim_values, do.NULL = FALSE)
    colnames(optim_values) <- c("optimized value r")
    optim_values
    
    
  })  
  
  
  #' ANDGM (1, 1) model  - reactive
  #' Optimal value 
  optandgm <- reactive({  
    x0 <- datopt()
    fitness_function <- function(value)
    {
      r <- value[1]
      n <- length(x0)
      xr1 <- numeric(n)
      for (i in 1:n){
        xr1[i] <-  ( (r-1)/r ) * sum(x0[1:i]) + (1/r)*x0[i+1]
      }
      xr <-  c(x0[1],xr1[1:n-1])
      mat1 <-matrix(xr[1:n-1], nrow=n-1,ncol=1)
      mat2 <-matrix(2:n-1, nrow=n-1,ncol=1)
      mat3 <- matrix(1,nrow=n-1,ncol=1)
      B <- cbind(mat1, mat2, mat3)
      y <- t(t(xr[2:n]))
      rcap <- (solve (t(B) %*% B)) %*% t(B) %*% y
      beta1 <- rcap[1,1]
      beta2 <- rcap[2,1]
      beta3 <- rcap[3,1]
      scale_with <- function(k)
      {
        ( beta1^k * x0[1] ) + ( ( 1 - beta1^k )/( 1 - beta1 ) ) * (beta2*k + beta3)
      }
      forecast1 <- scale_with(1:n)
      xrcap <- c(x0[1],forecast1)
      matrix2 <- matrix("",1,n)
      matrix2 <- as.numeric(matrix2)
      matrix2[1] <- x0[1]
      for (i in 2:length(matrix2+1)) {
        matrix2[i] <- r*xrcap[i] - (r-1)*sum(matrix2[1:i-1])
      }
      particule_result <- matrix2
      fitness <- -(1/n)*sum(abs((x0-particule_result)/x0)*100, na.rm=TRUE)
      return(fitness)
    }
    values_ranges <- list(c(0.001,5))
    swarm <- ParticleSwarm$new(pop_size = 100,
                               values_names = list("r"),
                               fitness_function = fitness_function,
                               max_it = 100,
                               acceleration_coefficient_range = list(c(0.5,1.5),c(0.5,1.5)),
                               inertia = 0.7,
                               ranges_of_values = values_ranges)
    swarm$run(plot = FALSE,verbose = FALSE,save_file = FALSE)
    swarm$swarm_best_values
    opt_r <- swarm$swarm_best_values[1]
    optim_values <- matrix(c(opt_r),ncol=1)
    colnames(optim_values, do.NULL = FALSE)
    colnames(optim_values) <- c("optimized value r")
    optim_values
    
  }) 
  
  
  #' Optimization - Actual and Fitted - render
  #' original and fitted data   
  
  output$x0capopt <- renderTable({
    if (input$radioopt == "PSO-GM (1, 1) model") {
      
      output$opt <- renderText({
        paste("PSO-GM (1, 1) model: Particle swarm optimization-based grey model")
      })
      
      Actual <- datopt()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0cappsogm()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      psogm <- data.frame(Actual,Fitted)
      
      
    } else if (input$radioopt == "EGM (1, 1, r) model") {
      
      output$opt <- renderText({
        paste("EGM (1, 1, r) model: Even form of grey model with one variable and one first order equation",
              "with accumulating generation of order r",
              "The EGM (1, 1, r) function takes as input raw values and output predicted values following the paper by",
              "Zeng B, Li S, Meng W, Zhang D (2019). An Improved Grey Prediction Model for China's Beef Comsumption",
              "Forecasting. PLOS ONE, 14(9), 1-18.",sep = "\n")
      })
      
      
      Actual <- datopt()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capegm11r()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      psogm <- data.frame(Actual,Fitted)
      
    } else if (input$radioopt == "ANDGM (1, 1) model") {
      
      output$opt <- renderText({
        paste("ANDGM (1, 1) model: Adjacent non-homogeneous discrete grey model",
              "The ANDGM (1, 1) model function takes as input raw values and output predicted values following the paper by",
              "Liu L, Wu L (2021). Forecasting the Renewable Energy Consumption of the European Countries by an Adjacent",
              "Non-homogeneous Grey Model. Applied Mathematical Modelling, 89, 1932-1948.",sep = "\n")
      })
      
      
      Actual <- datopt()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capandgm()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      psogm <- data.frame(Actual,Fitted)
    }
  })
  
  #' Optimal values - render 
  #' Optimization-based Models 
  output$optval <- renderTable({
    
    if (input$radioopt == "PSO-GM (1, 1) model") {
      
      opt <- optpsogm()
      
    } else if (input$radioopt =="EGM (1, 1, r) model") { 
      
      opt <- optegm11r()
      
    } else if (input$radioopt == "ANDGM (1, 1) model") { 
      
      opt <- optandgm()
      
    }
  })
  
  
  
  
  
  
  #' Optimization-based grey models
  #' PSO-GM (1, 1) model Fitted - reactive
  #' Fitted values  
  x0cappsogm <- reactive({  
    x0 <- datopt()
    n <- length(x0)
    fitness_function <- function(values){
      n <- length(x0)
      a <- values[1]
      b <- values[2]
      scale_with <- function(k){
        (x0[1] - (b/a)) * exp(-a*k) * (1 - exp(a))
      }
      fitted <- scale_with(2:n-1)
      particule_result <- c(x0[1],fitted)
      fitness <- -(1/n)*sum(abs((x0-particule_result)/x0)*100, na.rm=TRUE)
      return(fitness)
    }
    values_ranges <- list(c(-1,1),c(0,1000))
    swarm <- ParticleSwarm$new(pop_size = 200,
                               values_names = list("a","b"),
                               fitness_function = fitness_function,
                               max_it = 100,
                               acceleration_coefficient_range = list(c(0.5,1.5),c(0.5,1.5)),
                               inertia = 0.7,
                               ranges_of_values = values_ranges)
    
    swarm$run(plot = FALSE,verbose = FALSE,save_file = FALSE)
    swarm$swarm_best_values
    opt_a <- swarm$swarm_best_values[1]
    opt_b <- swarm$swarm_best_values[2]
    optim_values <- matrix(c(opt_a,opt_b),ncol=2)
    colnames(optim_values, do.NULL = FALSE)
    colnames(optim_values) <- c("optimized value a","optimized value b")
    scale_with <- function(k)
    {
      (x0[1] - (opt_b/opt_a)) * exp(-opt_a*k) * (1 - exp(opt_a))
    }
    fitted_values <- scale_with(1:n)
    x0cap <- c(x0[1],fitted_values[1:n-1])
    A <- 4
    # Predicted values
    x0cap4 <- scale_with(1 : n+A-1 )
    x0cap5 <- tail(x0cap4,A)
    # Fitted & Predicted values
    x0cap2 <- c(x0cap,x0cap5)
    
  })
  
  
  #' EGM (1, 1, r) model Fitted - reactive
  #' Fitted values  
  x0capegm11r <- reactive({  
    x0 <- datopt()
    fitness_function <- function(values){
      n <- length(x0)
      r <- values[1]
      xr <- replicate(n,0)
      for (k in 1:n){
        sm <- 0
        for (i in 1:k){
          sm <- sm + ( ( gamma(r+k-i)/( gamma(k-i+1) * gamma(r) ) ) * x0[i] )
        }
        xr[k] <- 1*sm
      }
      z <- numeric(n)
      for (i in 1:n){
        z[i] <- -0.5*(xr[i+1] + xr[i])
      }
      z1 <- z[1:n-1]
      mat1 <- matrix(c(z1),ncol=1)
      mat2 <- matrix(1,nrow=n-1,ncol=1)
      B <- cbind(mat1, mat2)
      f <- numeric(n)
      for (i in 1:n){
        f[i] <- (xr[i+1] - xr[i])
      }
      f1 <- f[1:n-1]
      y <- matrix(c(f1),ncol=1)
      acap <- summary(lm(y~B))$coefficients
      a <-acap[2]
      b <-acap[1]
      delta1 <- (1-(0.5*a))/(1+(0.5*a))
      delta2 <- b/(1+(0.5*a))
      xcap <- replicate(n,0)
      for (k in 2:n){
        sm <- 0
        for (i in 2:k-2){
          sm <- sm + ( (delta1^i) * delta2 )
        }
        xcap[k] <- sm + ( delta1^(k-1) * x0[1])
      }
      f1 <- c(x0[1],xcap[2:n])
      l1 <- length(f1)
      fa <- replicate(n,0)
      for (k in 2:n){
        sm <- 0
        for (i in 1:k-1){
          sm <- sm + ( ((-1)^i)* ( gamma(r+1) / ( gamma(i+1)*gamma(r-i+1) ) ) * f1[k-i] )
        }
        fa[k] <- sm * 1
      }
      f2 <- fa[2:n]
      particule_result <- c(x0[1],f2)
      fitness <- -(1/n)*sum(abs((x0-particule_result)/x0)*100, na.rm=TRUE)
      return(fitness)
    }
    values_ranges <- list(c(-100,100))
    swarm <- ParticleSwarm$new(pop_size = 100,
                               values_names = list("r"),
                               fitness_function = fitness_function,
                               max_it = 100,
                               acceleration_coefficient_range = list(c(0.5,1.5),c(0.5,1.5)),
                               inertia = 0.7,
                               ranges_of_values = values_ranges)
    swarm$run(plot = FALSE,verbose = FALSE,save_file = FALSE)
    opt_r <- swarm$swarm_best_values[1]
    n <- length(x0)
    xr <- replicate(n,0)
    for (k in 1:n){
      sm <- 0
      for (i in 1:k){
        sm <- sm + ( ( gamma(opt_r+k-i)/( gamma(k-i+1) * gamma(opt_r) ) ) * x0[i] )
      }
      xr[k] <- 1*sm
    }
    z <- numeric(n)
    for (i in 1:n){
      z[i] <- -0.5*(xr[i+1] + xr[i])
    }
    z1 <- z[1:n-1]
    mat1 <- matrix(c(z1),ncol=1)
    mat2 <- matrix(1,nrow=n-1,ncol=1)
    B <- cbind(mat1, mat2)
    f <- numeric(n)
    for (i in 1:n){
      f[i] <- (xr[i+1] - xr[i])
    }
    f1 <- f[1:n-1]
    y <- matrix(c(f1),ncol=1)
    acap <- summary(lm(y~B))$coefficients
    a <-acap[2]
    b <-acap[1]
    delta1 <- (1-(0.5*a))/(1+(0.5*a))
    delta2 <- b/(1+(0.5*a))
    xcap <- replicate(n,0)
    for (k in 2:n){
      sm <- 0
      for (i in 2:k-2){
        sm <- sm + ( (delta1^i) * delta2 )
      }
      xcap[k] <- sm + ( delta1^(k-1) * x0[1])
    }
    f1 <- c(x0[1],xcap[2:n])
    fa <- replicate(n,0)
    for (k in 2:n){
      sm <- 0
      for (i in 1:k-1){
        sm <- sm + ( ((-1)^i)* ( gamma(opt_r+1) / ( gamma(i+1)*gamma(opt_r-i+1) ) ) * f1[k-i] )
      }
      fa[k] <- sm * 1
    }
    x0cap <- c(x0[1],fa[2:n])
    A <- 4
    nn <- n + A
    xcap_a <- replicate(nn,0)
    for (k in 2:nn){
      sm <- 0
      for (i in 2:k-2){
        sm <- sm + ( (delta1^i) * delta2 )
      }
      xcap_a[k] <- sm + ( delta1^(k-1) * x0[1])
    }
    f1_a <- c(x0[1],xcap_a[2:nn])
    fa_a <- replicate(nn,0)
    for (k in 2:nn){
      sm <- 0
      for (i in 1:k-1){
        sm <- sm + ( ((-1)^i)* ( gamma(opt_r+1) / ( gamma(i+1)*gamma(opt_r-i+1) ) ) * f1_a[k-i] )
      }
      fa_a[k] <- sm * 1
    }
    x0cap4 <- c(x0[1],fa_a[2:nn])
    x0cap5 <- tail(x0cap4,A)
    # Fitted & Predicted values
    x0cap2 <- c(x0cap,x0cap5)
    
  })  
  
  
  #' ANDGM (1, 1) model Fitted - reactive
  #' Fitted values  
  x0capandgm <- reactive({  
    x0 <- datopt()
    fitness_function <- function(value)
    {
      r <- value[1]
      n <- length(x0)
      xr1 <- numeric(n)
      for (i in 1:n){
        xr1[i] <-  ( (r-1)/r ) * sum(x0[1:i]) + (1/r)*x0[i+1]
      }
      xr <-  c(x0[1],xr1[1:n-1])
      mat1 <-matrix(xr[1:n-1], nrow=n-1,ncol=1)
      mat2 <-matrix(2:n-1, nrow=n-1,ncol=1)
      mat3 <- matrix(1,nrow=n-1,ncol=1)
      B <- cbind(mat1, mat2, mat3)
      y <- t(t(xr[2:n]))
      rcap <- (solve (t(B) %*% B)) %*% t(B) %*% y
      beta1 <- rcap[1,1]
      beta2 <- rcap[2,1]
      beta3 <- rcap[3,1]
      scale_with <- function(k)
      {
        ( beta1^k * x0[1] ) + ( ( 1 - beta1^k )/( 1 - beta1 ) ) * (beta2*k + beta3)
      }
      forecast1 <- scale_with(1:n)
      xrcap <- c(x0[1],forecast1)
      matrix2 <- matrix("",1,n)
      matrix2 <- as.numeric(matrix2)
      matrix2[1] <- x0[1]
      for (i in 2:length(matrix2+1)) {
        matrix2[i] <- r*xrcap[i] - (r-1)*sum(matrix2[1:i-1])
      }
      particule_result <- matrix2
      fitness <- -(1/n)*sum(abs((x0-particule_result)/x0)*100, na.rm=TRUE)
      return(fitness)
    }
    values_ranges <- list(c(0.001,5))
    swarm <- ParticleSwarm$new(pop_size = 100,
                               values_names = list("r"),
                               fitness_function = fitness_function,
                               max_it = 100,
                               acceleration_coefficient_range = list(c(0.5,1.5),c(0.5,1.5)),
                               inertia = 0.7,
                               ranges_of_values = values_ranges)
    swarm$run(plot = FALSE,verbose = FALSE,save_file = FALSE)
    swarm$swarm_best_values
    opt_r <- swarm$swarm_best_values[1]
    n <- length(x0)
    xr1r <- numeric(n)
    for (i in 1:n){
      xr1r[i] <-  ( (opt_r-1)/opt_r ) * sum(x0[1:i]) + (1/opt_r)*x0[i+1]
    }
    xoptr <-  c(x0[1],xr1r[1:n-1])
    mat1r <-matrix(xoptr[1:n-1], nrow=n-1,ncol=1)
    mat2r <-matrix(2:n-1, nrow=n-1,ncol=1)
    mat3r <- matrix(1,nrow=n-1,ncol=1)
    Br <- cbind(mat1r, mat2r, mat3r)
    yr <- t(t(xoptr[2:n]))
    rcapr <- (solve (t(Br) %*% Br)) %*% t(Br) %*% yr
    beta1r <- rcapr[1,1]
    beta2r <- rcapr[2,1]
    beta3r <- rcapr[3,1]
    scale_with <- function(k)
    {
      ( beta1r^k * x0[1] ) + ( ( 1 - beta1r^k )/( 1 - beta1r ) ) * (beta2r*k + beta3r)
    }
    forecast1r <- scale_with(1:n)
    xrcapr <- c(x0[1],forecast1r)
    matrix2r <- matrix("",1,n)
    matrix2r <- as.numeric(matrix2r)
    matrix2r[1] <- x0[1]
    for (i in 2:length(matrix2r+1)) {
      matrix2r[i] <- opt_r*xrcapr[i] - (opt_r-1)*sum(matrix2r[1:i-1])
    }
    x0cap <- c(matrix2r)
    A <- 4
    # Predicted values
    n <- length(x0)
    nn <- n + A
    scale_with <- function(k)
    {
      ( beta1r^k * x0[1] ) + ( ( 1 - beta1r^k )/( 1 - beta1r ) ) * (beta2r*k + beta3r)
    }
    forecast1ra <- scale_with(1:nn)
    xrcapra <- c(x0[1],forecast1ra)
    matrix2ra <- matrix("",1,nn)
    matrix2ra <- as.numeric(matrix2ra)
    matrix2ra[1] <- x0[1]
    for (i in 2:length(matrix2ra+1)) {
      matrix2ra[i] <- opt_r*xrcapra[i] - (opt_r-1)*sum(matrix2ra[1:i-1])
    }
    x0cap4 <- c(matrix2ra)
    x0cap5 <- tail(x0cap4,A)
    # Fitted & Predicted values
    x0cap2 <- c(x0cap,x0cap5)
    
  }) 
  

  
  #' Predicted values - render 
  #' Optimization-based Models 
  output$predictedopt <- renderTable({
    
    if (input$radioopt == "PSO-GM (1, 1) model") {
      
      output$optpv <- renderPrint({input$radioopt1})
      
      actual1 <- datopt()
      actual2 <- t(datopt())
      n <- length(actual2)
      fitted1 <- x0cappsogm()
      x <- input$radioopt1
      fitted3 <- tail(fitted1,4)
      fitted4 <- t(fitted3[1:x])
      
    } else if (input$radioopt =="EGM (1, 1, r) model") { 
      
      output$optpv <- renderPrint({input$radioopt1})
      
      actual1 <- datopt()
      actual2 <- t(datopt())
      n <- length(actual2)
      fitted1 <- x0capegm11r()
      x <- input$radioopt1
      fitted3 <- tail(fitted1,4)
      fitted4 <- t(fitted3[1:x])
      
    } else if (input$radioopt == "ANDGM (1, 1) model") { 
      
      actual1 <- datopt()
      actual2 <- t(datopt())
      n <- length(actual2)
      fitted1 <- x0capandgm()
      x <- input$radioopt1
      fitted3 <- tail(fitted1,4)
      fitted4 <- t(fitted3[1:x])
    }
  })
  
  #' Optimization-based grey models - Error - render
  #' MAPE and RMSE
  output$erroropt <- renderTable({
    
    if (input$radioopt == "PSO-GM (1, 1) model") {
      
      Actual <- datopt()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0cappsogm()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      MAPE <- mape(Actual,Fitted)*100
      RMSE <- rmse(Actual,Fitted)
      pe <- data.frame(MAPE,RMSE)
      
    } else if (input$radioopt == "EGM (1, 1, r) model") {  
      
      Actual <- datopt()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capegm11r()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      MAPE <- mape(Actual,Fitted)*100
      RMSE <- rmse(Actual,Fitted)
      pe <- data.frame(MAPE,RMSE)
      
    } else if (input$radioopt == "ANDGM (1, 1) model") { 
      
      Actual <- datopt()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capandgm()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      MAPE <- mape(Actual,Fitted)*100
      RMSE <- rmse(Actual,Fitted)
      pe <- data.frame(MAPE,RMSE)
    }
  })
  
  #' Optimization-based grey models - Prediction Intervals - render
  #' CI  - reactive
  output$intervalsopt <- renderTable({
    
    if (input$radioopt == "PSO-GM (1, 1) model") {
      
      if (input$radioopt2 == "90") {
        
        output$ciopt <- renderPrint({input$radioopt2})
        
        fp1 <- x0cappsogm()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datopt()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radioopt1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 90
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UpperBound <- c(u[1:t])
        LowerBound <- c(l[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
      } else if (input$radioopt2 == "95") {
        
        output$ciopt <- renderPrint({input$radioopt2})
        
        fp1 <- x0cappsogm()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datopt()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radioopt1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 95
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UpperBound <- c(u[1:t])
        LowerBound <- c(l[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
      } else if (input$radioopt2 == "99") {
        
        output$ciopt <- renderPrint({input$radioopt2})
        
        fp1 <- x0cappsogm()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datopt()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radioopt1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 99
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UpperBound <- c(u[1:t])
        LowerBound <- c(l[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
      }
      
    } else if (input$radioopt == "EGM (1, 1, r) model") {
      
      if (input$radioopt2 == "90") {
        
        output$ciopt <- renderPrint({input$radioopt2})
        
        fp1 <- x0capegm11r()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datopt()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radioopt1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 90
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UpperBound <- c(u[1:t])
        LowerBound <- c(l[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
      } else if (input$radioopt2 == "95") {
        
        output$ciopt <- renderPrint({input$radioopt2})
        
        fp1 <- x0capegm11r()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datopt()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radioopt1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 95
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UpperBound <- c(u[1:t])
        LowerBound <- c(l[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
      } else if (input$radioopt2 == "99") {
        
        output$ciopt <- renderPrint({input$radioopt2})
        
        fp1 <- x0capegm11r()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datopt()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radioopt1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 99
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UpperBound <- c(u[1:t])
        LowerBound <- c(l[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
      }
      
    } else if (input$radioopt == "ANDGM (1, 1) model") {
      
      if (input$radioopt2 == "90") {
        
        output$ciopt <- renderPrint({input$radioopt2})
        
        fp1 <- x0capandgm()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datopt()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radioopt1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 90
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UpperBound <- c(u[1:t])
        LowerBound <- c(l[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
      } else if (input$radioopt2 == "95") {
        
        output$ciopt <- renderPrint({input$radioopt2})
        
        fp1 <- x0capandgm()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datopt()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radioopt1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 95
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UpperBound <- c(u[1:t])
        LowerBound <- c(l[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
      } else if (input$radioopt2 == "99") {
        
        output$ciopt <- renderPrint({input$radioopt2})
        
        fp1 <- x0capandgm()
        fp2 <- t(fp1)
        w <- length(fp2)
        actual1 <- datopt()
        actual2 <- t(actual1)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radioopt1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 99
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UpperBound <- c(u[1:t])
        LowerBound <- c(l[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
      }
    }   
  })
  
  
  #' Optimization-based grey models - Plots - render
  
  output$plotopt <- renderPlotly({
    
    if (input$radioopt == "PSO-GM (1, 1) model") {
      
      if (input$radioopt2 == "90") {
        
        x0 <- datopt()
        n <- length(x0)
        x0cap2 <- x0cappsogm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (90 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'PSO-GM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      } else if (input$radioopt2 == "95") {
        
        x0 <- datopt()
        n <- length(x0)
        x0cap2 <- x0cappsogm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (95 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'PSO-GM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      } else if (input$radioopt2 == "99") {
        
        
        x0 <- datopt()
        n <- length(x0)
        x0cap2 <- x0cappsogm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (99 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'PSO-GM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
      }
      
    } else if (input$radioopt == "EGM (1, 1, r) model") {
      
      if (input$radioopt2 == "90") {
        
        x0 <- datopt()
        n <- length(x0)
        x0cap2 <- x0capegm11r()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (90 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'EGM (1, 1, r) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
      } else if (input$radioopt2 == "95") {
        
        x0 <- datopt()
        n <- length(x0)
        x0cap2 <- x0capegm11r()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (95 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'EGM (1, 1, r) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      } else if (input$radioopt2 == "99") {
        
        x0 <- datopt()
        n <- length(x0)
        x0cap2 <- x0capegm11r()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (99 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'EGM (1, 1, r) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      }
      
    } else if (input$radioopt == "ANDGM (1, 1) model") {
      
      if (input$radioopt2 == "90") {
        
        x0 <- datopt()
        n <- length(x0)
        x0cap2 <- x0capandgm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (90 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'ANDGM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
      } else if (input$radioopt2 == "95") {
        
        x0 <- datopt()
        n <- length(x0)
        x0cap2 <- x0capandgm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (90 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'ANDGM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      } else if (input$radioopt2 == "99") {
        
        x0 <- datopt()
        n <- length(x0)
        x0cap2 <- x0capandgm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (99 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'ANDGM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
      }
    }   
  })  
  
  
  #' Residual Modification
  
  #' Remnant (1, 1) model Fitted - reactive
  #' Fitted values 
  x0capremgm <- reactive({  
    x0 <- datrm()
    x1 <- cumsum(x0)
    n <- length(x0)
    b <- numeric(n)
    for (i in 1:n){
      b[i] <- -(0.5*x1[i + 1] + 0.5*x1[i])
    }
    b1 <- b[1:n-1]
    B <- matrix(1,nrow=n-1,ncol=2)
    B[,1] <- t(t(b1[1:n-1]))
    yn <- matrix(c(x0),ncol=1)
    yn <- t(t(x0[2:n]))
    xcap <- solve (t(B) %*% B) %*% t(B) %*% yn
    a <- xcap[1,1]
    b <- xcap[2,1]
    scale_with <- function(k)
    {
      (x0[1] - (b/a)) * exp(-a*k) * (1 - exp(a))
    }
    bestfit <- scale_with(1:n)
    x0cap <- c(x0[1],bestfit)
    error <- numeric(n)
    signe <- numeric(n)
    for (i in 1:n){
      signe[i] <- sign(x0[i] - x0cap[i])
      error[i] <- abs(x0[i] - x0cap[i])
      e <- error[1:n]
    }
    Error <- c(e[2:n])
    x1e <- cumsum(Error)
    m <- length(Error)
    bb <- numeric(m)
    for (i in 1:m)
      bb[i] <- -(0.5*x1e[i + 1] + 0.5*x1e[i])
    b1 <- bb[1:m-1]
    Be <- matrix(1,nrow=m-1,ncol=2)
    Be[,1] <- t(t(b1[1:m-1]))
    Ye <- matrix(c(Error),ncol=1)
    Ye <- t(t(Error[2:m]))
    xcap <- solve (t(Be) %*% Be) %*% t(Be) %*% Ye
    ae <- xcap[1,1]
    be <- xcap[2,1]
    scale_with <- function(k)
    {
      (1-exp(ae))*(Error[1]-(be/ae))*exp(-ae*(k-1))
    }
    forecast1 <- scale_with(3:n)
    forecast <- matrix(c(forecast1[1:m-1]),ncol=1)
    Signe <- matrix(c(signe[3:n]),ncol=1)
    gm_x0cap <- matrix(c(x0cap[3:n]),ncol=1)
    remnant_x0cap1 <-  gm_x0cap + (Signe*forecast)
    remnant_x0cap <- c(x0[1],x0[2],remnant_x0cap1)
    
    A <- 4
    nn <- n + A
    
    scale_with <- function(k)
    {
      (x0[1] - (b/a)) * exp(-a*k) * (1 - exp(a))
    }
    gm_A <- scale_with(1:nn)
    x0cap_A <- c(x0[1],gm_A[1:nn-1])
    
    x0_A <- datoutrm()
    
    error_A <- numeric(nn)
    signe_A <- numeric(nn)
    for (i in 1:nn){
      signe_A[i] <- sign(x0_A[i] - gm_A[i])
      error_A[i] <- abs(x0_A[i] - gm_A[i])
      e_A <- error_A[1:nn]
    }
    Error_A <- c(e_A[1:nn])
    
    scale_with <- function(k)
    {
      (1-exp(ae))*(Error[1]-(be/ae))*exp(-ae*(k-1))
    }
    forecast1_A <- scale_with(1:nn)
    
    forecast_A <- matrix(c(forecast1_A[1:nn]),ncol=1)
    
    Signe_A <- matrix(c(signe_A[1:nn]),ncol=1)
    
    gm_x0capA <- matrix(c(x0cap_A[1:nn]),ncol=1)
    
    remnant_x0cap1A <-  gm_x0capA + (Signe_A*forecast_A)
    
    remnant_x0capA <- c(remnant_x0cap1A)
    
    x0cap5 <- tail(remnant_x0capA,A)
    x0cap2 <- c(remnant_x0cap,x0cap5 )
    
    
    
  })
  
  #' TGM (1, 1) model Fitted - reactive
  #' Fitted values 
  x0captgm <- reactive({  
    x0 <- datrm()
    x1 <- cumsum(x0)
    n <- length(x0)
    b <- numeric(n)
    for (i in 1:n){
      b[i] <- -(0.5*x1[i + 1] + 0.5*x1[i])
    }
    b1 <- b[1:n-1]
    B <- matrix(1,nrow=n-1,ncol=2)
    B[,1] <- t(t(b1[1:n-1]))
    yn <- matrix(c(x0),ncol=1)
    yn <- t(t(x0[2:n]))
    xcap <- solve (t(B) %*% B) %*% t(B) %*% yn
    a <- xcap[1,1]
    b <- xcap[2,1]
    scale_with <- function(k)
    {
      (x0[1] - (b/a)) * exp(-a*k) * (1 - exp(a))
    }
    fitted <- scale_with(1:n)
    x0cap <- c(x0[1],fitted[1:n-1])
    x0cap_GM <- c(x0cap)
    n <- length(x0)
    r0 <- numeric(n)
    for (i in 1:n){
      r0[i] <-x0[i] - x0cap_GM[i]
    }
    R <- r0[2:n]
    rn <- matrix(c(R),ncol=1)
    m <- length(rn)
    L <- 23
    mat1 <- matrix(1,nrow=n-1,ncol=1)
    mat2 <-matrix(1:m,nrow=m,ncol=1)
    s <- replicate(n,0)
    for (i in 1:n){
      s[i] <- sin( (2*(i-1)*pi)/L )
    }
    mat3 <- matrix(c(s[2:n]),ncol=1)
    c <- replicate(n,0)
    for (i in 1:n){
      c[i] <- cos( (2*(i-1)*pi)/L )
    }
    mat4 <- matrix(c(c[2:n]),ncol=1)
    B <- cbind(mat1,mat2,mat3,mat4)
    rcap <- (solve (t(B) %*% B)) %*% t(B) %*% rn
    b0 <- rcap[1,1]
    b1 <- rcap[2,1]
    b2 <- rcap[3,1]
    b3 <- rcap[4,1]
    scale_with <- function(k)
    {
      b0 + (b1*k) + (b2*sin( (2*pi*k)/L )) + (b3*cos( (2*pi*k)/L ))
    }
    forecast <- scale_with(1:m)
    r0cap <- c(0,forecast)
    xcap_tr <- r0cap + x0cap_GM
    
    A <- 4
    scale_with <- function(k)
    {
      (x0[1] - (b/a)) * exp(-a*k) * (1 - exp(a))
    }
    fitted_a <- scale_with(1 : n+A-1)
    x0cap_GMa <- c(fitted_a)
    predicted_a <- tail(x0cap_GMa,A)
    x0_a <- datoutrm()
    n_a <- length(x0_a)
    r0_a <- numeric(n_a)
    for (i in 1:n_a){
      r0_a[i] <-x0_a[i] - x0cap_GMa[i]
    }
    R_a <- r0_a[1:n_a]
    rn_a <- matrix(c(R_a),ncol=1)
    scale_with <- function(k)
    {
      b0 + (b1*k) + (b2*sin( (2*pi*k)/L )) + (b3*cos( (2*pi*k)/L ))
    }
    forecast_a <- scale_with(1:m+A)
    r0cap_a <- tail(forecast_a,A)
    xcap_tra <- r0cap_a +  predicted_a
    x0cap5 <- c(xcap_tra)
    x0cap2 <- c(xcap_tr,x0cap5 )
    
  })
  
  #' Residual Modification - Actual and Fitted - render
  #' original and fitted data   
  
  output$x0caprm <- renderTable({
    if (input$radiorm == "Remnant GM (1, 1) model") {
      
      output$rm <- renderText({
        paste("Remnant GM (1, 1) model: Residual Modification GM (1, 1) grey model", 
              "The remnant GM function takes as input raw values and output predicted values following the paper by",
              "Hu Y (2020). Energy Demand Forecasting using a Novel Remnant GM (1, 1) Model.",
              "Soft Computing, pp. 13903-13912.",
              sep = "\n") 
      })
      
      Actual <- datrm()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capremgm()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      remgm11 <- data.frame(Actual,Fitted)
      
      
    } else if (input$radiorm == "TGM (1, 1) model") {
      
      output$rm <- renderText({
        paste("TGM (1, 1) model: Trigonometric grey model", 
              "The TGM function takes as input raw values and output predicted values following the paper by",
              "Zhou P, Ang B, Poh K (2006). A Trigonometric Grey Prediction Approach to Forecasting",
              "Electricity Demand. Energy, 31(14), 2839-2847.",
              sep ="\n")
      })
      
      Actual <- datrm()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0captgm()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      tgm11 <- data.frame(Actual,Fitted)
      
    } 
  }) 
  
  #' Predicted values - render 
  #' Residual Modification
  output$predictedrm <- renderTable({
    
    if (input$radiorm == "Remnant GM (1, 1) model") {
      
      output$rmpv <- renderPrint({input$radiorm1})
      
      actual1 <- datrm()
      actual2 <- t(datrm())
      n <- length(actual2)
      fitted1 <- x0capremgm()
      x <- input$radiorm1
      fitted3 <- tail(fitted1,4)
      fitted4 <- t(fitted3[1:x])
      
      
    } else if (input$radiorm == "TGM (1, 1) model") {
      
      output$rmpv <- renderPrint({input$radiorm1})
      
      actual1 <- datrm()
      actual2 <- t(datrm())
      n <- length(actual2)
      fitted1 <- x0captgm()
      x <- input$radiorm1
      fitted3 <- tail(fitted1,4)
      fitted4 <- t(fitted3[1:x])
      
      
    }  
  })
  
  #' Residual Modification - Error - render
  #' MAPE and RMSE
  output$errorrm <- renderTable({
    
    if (input$radiorm == "Remnant GM (1, 1) model") {
      
      Actual <- datrm()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0capremgm()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      MAPE <- mape(Actual,Fitted)*100
      RMSE <- rmse(Actual,Fitted)
      pe <- data.frame(MAPE,RMSE)
      
      
    } else if (input$radiorm == "TGM (1, 1) model") {
      
      Actual <- datrm()
      actual2 <- t(Actual)
      n <- length(actual2)
      fitted1 <- x0captgm()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      MAPE <- mape(Actual,Fitted)*100
      RMSE <- rmse(Actual,Fitted)
      pe <- data.frame(MAPE,RMSE)
      
      
    }  
  })
  
  
  #' Residual Modification - Prediction Intervals - render
  #' CI  - reactive
  output$intervalsrm <- renderTable({
    
    if (input$radiorm == "Remnant GM (1, 1) model") {
      
      if (input$radiorm2 == "90") {
        
        output$cirm <- renderPrint({input$radiorm2})
        
        x0 <- datrm()
        n <- length(x0)
        x0cap2 <- x0capremgm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (90 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        CIset <- matrix(c(LB,UB),ncol=2)
        colnames(CIset, do.NULL = FALSE)
        colnames(CIset) <- c("Lower Bound","Upper Bound")
        CIset
        
        
      } else if (input$radiorm2 == "95") {
        
        output$cirm <- renderPrint({input$radiorm2})
        
        x0 <- datrm()
        n <- length(x0)
        x0cap2 <- x0capremgm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (95 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        CIset <- matrix(c(LB,UB),ncol=2)
        colnames(CIset, do.NULL = FALSE)
        colnames(CIset) <- c("Lower Bound","Upper Bound")
        CIset
        
        
      } else if (input$radiorm2 == "99") {
        
        output$cirm <- renderPrint({input$radiorm2})
        
        x0 <- datrm()
        n <- length(x0)
        x0cap2 <- x0capremgm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (99 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        CIset <- matrix(c(LB,UB),ncol=2)
        colnames(CIset, do.NULL = FALSE)
        colnames(CIset) <- c("Lower Bound","Upper Bound")
        CIset
        
      }
      
    } else if (input$radiorm == "TGM (1, 1) model") {
      
      if (input$radiorm2 == "90") {
        
        output$cirm <- renderPrint({input$radiorm2})
        
        x0 <- datrm()
        n <- length(x0)
        x0cap2 <- x0captgm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (90 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        CIset <- matrix(c(LB,UB),ncol=2)
        colnames(CIset, do.NULL = FALSE)
        colnames(CIset) <- c("Lower Bound","Upper Bound")
        CIset
        
        
      } else if (input$radiorm2 == "95") {
        
        output$cirm <- renderPrint({input$radiorm2})
        
        x0 <- datrm()
        n <- length(x0)
        x0cap2 <- x0captgm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (95 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        CIset <- matrix(c(LB,UB),ncol=2)
        colnames(CIset, do.NULL = FALSE)
        colnames(CIset) <- c("Lower Bound","Upper Bound")
        CIset
        
        
      } else if (input$radiorm2 == "99") {
        
        output$cirm <- renderPrint({input$radiorm2})
        
        x0 <- datrm()
        n <- length(x0)
        x0cap2 <- x0captgm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (99 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        CIset <- matrix(c(LB,UB),ncol=2)
        colnames(CIset, do.NULL = FALSE)
        colnames(CIset) <- c("Lower Bound","Upper Bound")
        CIset
        
      }
    }   
  })  
  
  
  #' Residual Modification - Plots - render
  #' Plots  - reactive
  output$plotrm <- renderPlotly({
    
    if (input$radiorm == "Remnant GM (1, 1) model") {
      
      if (input$radiorm2 == "90") {
        
        x0 <- datrm()
        n <- length(x0)
        x0cap2 <- x0capremgm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (90 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'Remnant GM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      } else if (input$radiorm2 == "95") {
        
        x0 <- datrm()
        n <- length(x0)
        x0cap2 <- x0capremgm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (95 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'Remnant GM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      } else if (input$radiorm2 == "99") {
        
        x0 <- datrm()
        n <- length(x0)
        x0cap2 <- x0capremgm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (99 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'Remnant GM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
      }
      
    } else if (input$radiorm == "TGM (1, 1) model") {
      
      if (input$radiorm2 == "90") {
        
        x0 <- datrm()
        n <- length(x0)
        x0cap2 <- x0captgm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (90 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'TGM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
        
      } else if (input$radiorm2 == "95") {
        
        x0 <- datrm()
        n <- length(x0)
        x0cap2 <- x0captgm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (95 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'TGM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      } else if (input$radiorm2 == "99") {
        
        x0 <- datrm()
        n <- length(x0)
        x0cap2 <- x0captgm()
        fitted2 <- t(x0cap2)
        x0cap <- x0cap2[1:n]
        fitted3 <- tail(x0cap2,4)
        x0cap5 <- fitted3
        w <- length(x0cap2)
        t <- length(x0cap5)
        s <- rmse(x0, x0cap)
        sse <- sum((x0 - x0cap)^2)
        mse <- sse / (n - 2)
        cc <- (99 + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = x0cap5[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = x0cap5[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(x0cap[n],LB)
        UB2 <- c(x0cap[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=x0)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=x0cap2)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'TGM (1, 1) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
      }
    }   
  })
  
  
  
  
  
  #' Multivariate Grey Models
  
  #' GM (1, 3) model Fitted - reactive
  #' Fitted values  
  x0capgm13 <- reactive({  
    x0 <- datmv()
    x1 <- x0[ ,1]
    x2 <- x0[ ,2]
    x3 <- x0[ ,3]
    x1_1 <- cumsum(x1)
    x2_1 <- cumsum(x2)
    x3_1 <- cumsum(x3)
    n <- length(x1)
    z <- numeric(n)
    for (i in 1:n){
      z[i] <- -0.5*(x1_1[i + 1] + x1_1[i])
    }
    z1 <- z[1:n-1]
    mat1 <- matrix(c(z1),ncol=1)
    mat2 <- matrix(c(x2_1),ncol=1)
    mat2 <- t(t(x2_1[2:n]))
    mat3 <- matrix(c(x3_1),ncol=1)
    mat3 <- t(t(x3_1[2:n]))
    y <- matrix(c(x1),ncol=1)
    y <- t(t(x1[2:n]))
    B <- cbind(mat1, mat2, mat3)
    acap <- (solve (t(B) %*% B)) %*% t(B) %*% y
    a1 <- acap[1,1]
    b2 <- acap[2,1]
    b3 <- acap[3,1]
    # From GM(1,1) for x2
    b_x2 <- numeric(n)
    for (i in 1:n){
      b_x2[i] <- -(0.5*x2_1[i + 1] + 0.5*x2_1[i])
    }
    b1_x2 <- b_x2[1:n-1]
    B_x2 <- matrix(1,nrow=n-1,ncol=2)
    B_x2[,1] <- t(t(b1_x2[1:n-1]))
    yn_x2 <- matrix(c(x2),ncol=1)
    yn_x2 <- t(t(x2[2:n]))
    xcap_x2 <- solve (t(B_x2) %*% B_x2) %*% t(B_x2) %*% yn_x2
    a2 <- xcap_x2[1,1]
    c2 <- xcap_x2[2,1]
    #' GM (1,1) for x3
    x1_x3 <- cumsum(x3)
    n_x3 <- length(x3)
    b_x3 <- numeric(n_x3)
    for (i in 1:n){
      b_x3[i] <- -(0.5*x3_1[i + 1] + 0.5*x3_1[i])
    }
    b1_x3 <- b_x3[1:n-1]
    B_x3 <- matrix(1,nrow=n-1,ncol=2)
    B_x3[,1] <- t(t(b1_x3[1:n-1]))
    yn_x3 <- matrix(c(x3),ncol=1)
    yn_x3 <- t(t(x3[2:n]))
    xcap_x3 <- solve (t(B_x3) %*% B_x3) %*% t(B_x3) %*% yn_x3
    a3 <- xcap_x3[1,1]
    c3 <- xcap_x3[2,1]
    m <- length(y)
    constant <-  ( ( b2*c2 )/a2 + ( b3*c3 )/a3 ) / a1
    f_a2 <- ( ( ( b2 * exp(a2) ) * ( x2[1] - (c2/a2) ) ) / (a1 - a2) ) 
    f_a3 <- ( ( ( b3 * exp(a3) ) * ( x3[1] - (c3/a3) ) ) / (a1 - a3) ) 
    f_a1 <- ( exp(a1) * ( x1[1] - (f_a2 * exp(-a2)) ) ) +
      ( exp(a1) * ( x1[1] - (f_a3 * exp(-a3)) ) )
    t0 <- 1
    # formula says - constant
    ff <-  exp(a1*t0) *( x1[1] + constant ) 
    # formula says + ff
    total <- f_a1 - ff
    scale_with <- function(t)
    {
      ( total*exp(-a1*t) ) +  ( f_a2*exp(-a2*t) ) +  ( f_a3*exp(-a3*t) ) + constant                                      
    }
    forecast <- scale_with(2:n)
    x1cap <- c(x1[1],forecast)
    x0cap1 <- numeric(n)
    for (i in 1:n-1){
      x0cap1[i] <- x1cap[i+1] - x1cap[i]
    }
    x0cap <- c(x1[1],x0cap1[1:n-1])
    A <- 4
    x1cap4 <- scale_with(1 : n+A )
    t4 <- length(x1cap4)
    x0cap4 <- numeric(t4-1)
    for (i in 1:t4-1) {
      x0cap4[i] <- x1cap4[i+1] - x1cap4[i]
    }
    x0cap4 <- c(x0cap4[1:t4-1])
    x0cap5 <- tail(x0cap4,A)
    x0cap2 <- c(x0cap,x0cap5)
    
  })
  
  
  
  #' IGM (1, 3) model Fitted - reactive
  #' Fitted values  
  x0capigm13 <- reactive({  
    x0 <- datmv()
    x1 <- x0[ ,1]
    x2 <- x0[ ,2]
    x3 <- x0[ ,3]
    x1_1 <- cumsum(x1)
    x2_1 <- cumsum(x2)
    x3_1 <- cumsum(x3)
    n <- length(x1)
    z <- numeric(n)
    alpha <- 0.5
    for (i in 1:n){
      z[i] <- -alpha*x1_1[i] - ((1-alpha)*x1_1[i+1])
    }
    z1 <- z[1:n-1]
    mat1 <- matrix(c(z1),ncol=1)
    v <- numeric(n)
    alpha <- 0.5
    for (i in 1:n){
      v[i] <- alpha*x2_1[i] + ((1-alpha)*x2_1[i+1])
    }
    v1 <- v[1:n-1]
    mat2 <- matrix(c(v1),ncol=1)
    mat2
    w <- numeric(n)
    alpha <- 0.5
    for (i in 1:n){
      w[i] <- alpha*x3_1[i] + ((1-alpha)*x3_1[i+1])
    }
    w1 <- w[1:n-1]
    mat3 <- matrix(c(w1),ncol=1)
    mat4 <- matrix(1,nrow=n-1, ncol=1)
    y <- matrix(c(x1),ncol=1)
    y <- t(t(x1[2:n]))
    B <- cbind(mat1, mat2, mat3, mat4)
    Bcap <- (solve (t(B) %*% B)) %*% t(B) %*% y
    a1 <- Bcap[1,1]
    b2 <- Bcap[2,1]
    b3 <- Bcap[3,1]
    b <- Bcap[4,1]
    # From GM(1,1) for x2
    b_x2 <- numeric(n)
    for (i in 1:n){
      b_x2[i] <- -(0.5*x2_1[i + 1] + 0.5*x2_1[i])
    }
    b1_x2 <- b_x2[1:n-1]
    B_x2 <- matrix(1,nrow=n-1,ncol=2)
    B_x2[,1] <- t(t(b1_x2[1:n-1]))
    yn_x2 <- matrix(c(x2),ncol=1)
    yn_x2 <- t(t(x2[2:n]))
    xcap_x2 <- solve (t(B_x2) %*% B_x2) %*% t(B_x2) %*% yn_x2
    a2 <- xcap_x2[1,1]
    c2 <- xcap_x2[2,1]
    #' GM (1,1) for x3
    x1_x3 <- cumsum(x3)
    n_x3 <- length(x3)
    b_x3 <- numeric(n_x3)
    for (i in 1:n){
      b_x3[i] <- -(0.5*x3_1[i + 1] + 0.5*x3_1[i])
    }
    b1_x3 <- b_x3[1:n-1]
    B_x3 <- matrix(1,nrow=n-1,ncol=2)
    B_x3[,1] <- t(t(b1_x3[1:n-1]))
    yn_x3 <- matrix(c(x3),ncol=1)
    yn_x3 <- t(t(x3[2:n]))
    xcap_x3 <- solve (t(B_x3) %*% B_x3) %*% t(B_x3) %*% yn_x3
    a3 <- xcap_x3[1,1]
    c3 <- xcap_x3[2,1]
    m <- length(y)
    constant <-  ( ( b2*c2 )/a2 + ( b3*c3 )/a3 + b ) / a1
    f_a2 <- ( ( ( b2 * exp(a2) ) * ( x2[1] - (c2/a2) ) ) / (a1 - a2) ) 
    f_a3 <- ( ( ( b3 * exp(a3) ) * ( x3[1] - (c3/a3) ) ) / (a1 - a3) ) 
    f_a1 <- ( exp(a1) * ( x1[1] - ( ( ( ( b2*exp(a2) ) * ( x2[1] - (c2/a2) ) ) /( a1 - a2 ) ) * exp(-a2) ) ) ) +
      ( exp(a1) * ( x1[1] - ( ( ( ( b3*exp(a3) ) * ( x3[1] - (c3/a3) ) ) /( a1 - a3 ) ) * exp(-a3) ) ) ) 
    t0 <- 1   
    ff <-  exp(a1*t0) *( x1[1] + constant ) 
    total <- f_a1 - ff
    scale_with <- function(t)
    {
      ( total*exp(-a1*t) ) +  ( f_a2*exp(-a2*t) ) +  ( f_a3*exp(-a3*t) ) + constant                                      
    }
    forecast <- scale_with(2:n)
    x1cap <- c(x1[1],forecast)
    x0cap1 <- numeric(n)
    for (i in 1:n-1){
      x0cap1[i] <- x1cap[i+1] - x1cap[i]
    }
    x0cap <- c(x1[1],x0cap1[1:n-1]) 
    A <- 4
    x1cap4 <- scale_with(1 : n+A )
    t4 <- length(x1cap4)
    x0cap4 <- numeric(t4-1)
    for (i in 1:t4-1) {
      x0cap4[i] <- x1cap4[i+1] - x1cap4[i]
    }
    x0cap4 <- c(x0cap4[1:t4-1])
    x0cap5 <- tail(x0cap4,A)
    x0cap2 <- c(x0cap,x0cap5)
    
  })
  
  
  #' DBGM (1, 2) model Fitted - reactive
  #' Fitted values  
  x0capdbgm12 <- reactive({  
    x0 <- datinmv()
    x01 <- x0[ ,1]
    x02 <- x0[ ,2]
    x11 <- cumsum(x01)
    x12 <- cumsum(x02)
    n <- length(x01)
    fitness_function <- function(value)
    {
      b <- value[1]
      x11 <- cumsum(x01)
      x12 <- cumsum(x02)
      n <- length(x01)
      z1 <- numeric(n-1)
      for (i in 1:n-1){
        z1[i] <- ((b-1)*x11[i])-(b*x11[i + 1]) 
      }
      mat2 <- matrix(c(z1),ncol=1)
      mat1 <- matrix(c(x12[2:n]),ncol=1)
      mat3 <- matrix(2:n,nrow=n-1,ncol=1)
      mat4 <- matrix(1,nrow=n-1,ncol=1)
      B <- cbind(mat1,mat2,mat3,mat4)
      S <- matrix(c(x01[2:n]),ncol=1)
      xcap <- solve (t(B) %*% B) %*% t(B) %*% S
      #lm(formula = S ~B)
      b2 <- xcap[1,1]
      a <- xcap[2,1]
      c <- xcap[3,1]
      d <- xcap[4,1]
      v1 <- 1/(1 + (a*b))
      v2 <- 1 - ( a/(1 + (a*b)) )
      v3 <- c/(1 + (a*b))
      v4 <- d/(1 + (a*b))
      fun1 <- replicate(n,0)
      for (k in 2:n){
        sm <- 0
        for (u in 2:k-1){
          sm <- sm + (v1 *( v2^(u-1) * b2 * x12[k-u+1] ) )
        }
        fun1[k] <- 1 * sm
      }
      xcap1_1 <- c(fun1[2:n])
      fun2 <- replicate(n,0)
      for (k in 2:n){
        sm <- 0
        for (v in  2:k-2){
          sm <- sm + ( (v2^v) * ( (k-v) * v3 + v4 ) )
        }
        fun2[k] <- 1 * sm
      }
      xcap1_2 <- c(fun2[2:n])
      fun3 <- numeric(n)
      for (k in 2:n){
        fun3[k] <- v2^(k-1) * x01[1]
      }
      xcap1_3 <- fun3[2:n]
      total1 <- xcap1_1 +xcap1_2+xcap1_3
      total <- c(x01[1],total1)
      x0cap1 <- numeric(n)
      for (i in 1:n){
        x0cap1[i] <-total[i+1] - total[i]
      }
      x0cap <- c(x01[1],x0cap1[1:n-1])
      particule_result <- x0cap
      fitness <- -(1/n)*sum(abs((x01-particule_result)/x01)*100, na.rm=TRUE)
      return(fitness)
    }
    values_ranges <- list(c(0.01,0.999))
    swarm <- ParticleSwarm$new(pop_size = 1000,
                               values_names = list("b"),
                               fitness_function = fitness_function,
                               max_it = 100,
                               acceleration_coefficient_range = list(c(0.5,1.5),c(0.5,1.5)),
                               inertia = 0.8,
                               ranges_of_values = values_ranges)
    swarm$run(plot = FALSE,verbose = FALSE,save_file = FALSE)
    swarm
    swarm$swarm_best_values
    opt_b <- swarm$swarm_best_values[1]
    b <- opt_b
    z1 <- numeric(n-1)
    for (i in 1:n-1){
      z1[i] <- ((b-1)*x11[i])-(b*x11[i + 1]) 
    }
    mat2 <- matrix(c(z1),ncol=1)
    mat1 <- matrix(c(x12[2:n]),ncol=1)
    mat3 <- matrix(2:n,nrow=n-1,ncol=1)
    mat4 <- matrix(1,nrow=n-1,ncol=1)
    B <- cbind(mat1,mat2,mat3,mat4)
    S <- matrix(c(x01[2:n]),ncol=1)
    xcap <- solve (t(B) %*% B) %*% t(B) %*% S
    #lm(formula = S ~B)
    b2 <- xcap[1,1]
    a <- xcap[2,1]
    c <- xcap[3,1]
    d <- xcap[4,1]
    v1 <- 1/(1 + (a*b))
    v2 <- 1 - ( a/(1 + (a*b)) )
    v3 <- c/(1 + (a*b))
    v4 <- d/(1 + (a*b))
    fun1 <- replicate(n,0)
    for (k in 2:n){
      sm <- 0
      for (u in 2:k-1){
        sm <- sm + (v1 *( v2^(u-1) * b2 * x12[k-u+1] ) )
      }
      fun1[k] <- 1 * sm
    }
    xcap1_1 <- c(fun1[2:n])
    fun2 <- replicate(n,0)
    for (k in 2:n){
      sm <- 0
      for (v in  2:k-2){
        sm <- sm + ( (v2^v) * ( (k-v) * v3 + v4 ) )
      }
      fun2[k] <- 1 * sm
    }
    xcap1_2 <- c(fun2[2:n])
    fun3 <- numeric(n)
    for (k in 2:n){
      fun3[k] <- v2^(k-1) * x01[1]
    }
    xcap1_3 <- fun3[2:n]
    total1 <- xcap1_1 +xcap1_2+xcap1_3
    total <- c(x01[1],total1)
    x0cap1 <- numeric(n)
    for (i in 1:n){
      x0cap1[i] <-total[i+1] - total[i]
    }
    x0cap <- c(x01[1],x0cap1[1:n-1])
    
    A <- 4
    dat_a <- c(datoutmv())
    newx02 <- as.numeric(unlist(dat_a))
    newx12 <- cumsum(newx02 )
    fun1A <- replicate(n+A,0)
    for (k in 2:n+A){
      sm <- 0
      for (u in 2:k-1){
        sm <- sm + (v1 *( v2^(u-1) * b2 * newx12[k-u+1] ) )
      }
      fun1A[k] <- 1 * sm
    }
    xcap1_1A <- c(fun1A[2:n+A])
    
    fun2A <- replicate(n+A,0)
    for (k in 2:n+A){
      sm <- 0
      for (v in  2:k-2){
        sm <- sm + ( (v2^v) * ( (k-v) * v3 + v4 ) )
      }
      fun2A[k] <- 1 * sm
    }
    xcap1_2A <- c(fun2A[2:n+A])
    
    fun3A <- numeric(n+A)
    for (k in 2:n+A){
      fun3A[k] <- v2^(k-1) * x01[1]
    }
    xcap1_3A <- fun3A[2:n+A]
    total1A <- xcap1_1A +xcap1_2A+xcap1_3A
    totalA <- c(x01[1],total1A)
    t4 <- length(totalA)
    x0cap4 <- numeric(t4-1)
    for (i in 1:t4-1) {
      x0cap4[i] <- totalA[i+1] - totalA[i]
    }
    x0cap4 <- c(x0cap4[1:t4-1])
    x0cap5 <- tail(x0cap4,A)
    
    x0cap2 <- c(x0cap,x0cap5 )
    
  })
  
  
  #' GMC (1, 2) model Fitted - reactive
  #' Fitted values  
  x0capgmc12 <- reactive({  
    x0 <- datinmv()
    x01 <- x0[ ,1]
    x02 <- x0[ ,2]
    x11 <- cumsum(x01)
    x12 <- cumsum(x02)
    n <- length(x01)
    b11 <- numeric(n)
    b12 <- numeric(n)
    for (i in 1:n){
      b11[i] <- -(0.5*x11[i + 1] + 0.5*x11[i])
      b12[i] <- (0.5*x12[i + 1] + 0.5*x12[i])
    }
    b11a <- b11[1:n-1]
    b12a <- b12[1:n-1]
    mat1 <- matrix(c(b11a),ncol=1)
    mat2 <- matrix(c(b12a),ncol=1)
    mat3 <- matrix(1,nrow=n-1,ncol=1)
    B <- cbind(mat1, mat2, mat3)
    yn <- matrix(c(x01),ncol=1)
    yn <- t(t(x01[2:n]))
    xcap <- solve (t(B) %*% B) %*% t(B) %*% yn
    beta1 <- xcap[1,1]
    beta2 <- xcap[2,1]
    u <- xcap[3,1]
    fe <- numeric(n)
    for (i in 1:n){
      fe[i] <- beta2 * x12[i] + u
    }
    E <- matrix(c(fe[1:n]),ncol =1)
    xr <- replicate(n,0)
    for (t in 2:n){
      sm <- 0
      for (e in 2:t){
        sm <- sm + ( 0.5 * ( (exp(-beta1*(t - e))*E[e]) + (exp(-beta1*(t-e+1))*E[e-1]) ) )
      }
      xr[t] <- ( x01[1]*exp(-beta1*(t-1)) )+ sm
    }
    xcap1 <- c(x01[1],xr[2:n])
    f <- numeric(n-1)
    for (i in 1:n-1){
      f[i] <- (xcap1[i+1] - xcap1[i])
    }
    f1 <- f[1:n-1]
    x0cap <- matrix(c(x01[1],f1[1:n-1]),ncol=1)
    
    A <- 4
    dat_a <- c(datoutmv())
    newx02 <- as.numeric(unlist(dat_a))
    m <- length(newx02)
    newx12 <- cumsum(newx02)
    fe_A <- numeric(m)
    for (i in 1:m){
      fe_A[i] <- beta2 * newx12[i] + u
    }
    E_A <- matrix(c(fe_A[1:m]),ncol =1)
    xr_A <- replicate(m,0)
    for (t in 2:m){
      sm <- 0
      for (e in 2:t){
        sm <- sm + ( 0.5 * ( (exp(-beta1*(t - e))*E_A[e]) + (exp(-beta1*(t-e+1))*E_A[e-1]) ) )
      }
      xr_A[t] <- ( x01[1]*exp(-beta1*(t-1)) )+ sm
    }
    xcap1_A <- c(x01[1],xr_A[2:m])
    f_A <- numeric(m-1)
    for (i in 1:m-1){
      f_A[i] <- (xcap1_A[i+1] - xcap1_A[i])
      f1_A <- f_A[1:m-1]
    }
    x0cap4 <- matrix(c(x01[1],f1_A[1:m-1]),ncol=1)
    x0cap5 <- tail(x0cap4,A)
    # Fitted & Predicted values
    x0cap2 <- c(x0cap,x0cap5)
    
  })   
  
  
  
  #' GMC_g (1, 2) model Fitted - reactive
  #' Fitted values  
  x0capgmcg12 <- reactive({  
    x0 <- datinmv()
    x01 <- x0[ ,1]
    x02 <- x0[ ,2]
    x11 <- cumsum(x01)
    x12 <- cumsum(x02)
    n <- length(x01)
    b11 <- numeric(n)
    b12 <- numeric(n)
    for (i in 1:n){
      b11[i] <- -(0.5*x11[i + 1] + 0.5*x11[i])
      b12[i] <- (0.5*x12[i + 1] + 0.5*x12[i])
    }
    b11a <- b11[1:n-1]
    b12a <- b12[1:n-1]
    mat1 <- matrix(c(b11a),ncol=1)
    mat2 <- matrix(c(b12a),ncol=1)
    mat3 <- matrix(1,nrow=n-1,ncol=1)
    B <- cbind(mat1, mat2, mat3)
    yn <- matrix(c(x01),ncol=1)
    yn <- t(t(x01[2:n]))
    xcap <- solve (t(B) %*% B) %*% t(B) %*% yn
    beta1 <- xcap[1,1]
    beta2 <- xcap[2,1]
    u <- xcap[3,1]
    fe <- numeric(n)
    for (i in 1:n){
      fe[i] <- beta2 * x12[i] + u
    }
    E <- matrix(c(fe[1:n]),ncol =1)
    xrG <- replicate(n,0)
    for (t in 2:n){
      sm <- 0
      for (e in 2:t){
        sm <- sm + (  (exp(-beta1*(t - e + 0.5)))) * ( 0.5 * (E[e]+ E[e-1]) )
      }
      xrG[t] <- ( x01[1]*exp(-beta1*(t-1)) ) + sm
    }
    xcap1G <- c(x01[1],xrG[2:n])
    fG <- numeric(n-1)
    for (i in 1:n-1){
      fG[i] <- (xcap1G[i+1] - xcap1G[i])
    }
    f1G <- fG[1:n-1]
    x0cap <- matrix(c(x01[1],f1G[1:n-1]),ncol=1)
    
    A <- 4
    dat_a <- c(datoutmv())
    newx02 <- as.numeric(unlist(dat_a))
    m <- length(newx02)
    newx12 <- cumsum(newx02)
    fe_A <- numeric(m)
    for (i in 1:m){
      fe_A[i] <- beta2 * newx12[i] + u
    }
    E_A <- matrix(c(fe_A[1:m]),ncol =1)
    xrG_A <- replicate(m,0)
    for (t in 2:m){
      sm <- 0
      for (e in 2:t){
        sm <- sm + (  (exp(-beta1*(t - e + 0.5)))) * ( 0.5 * (E_A[e]+ E_A[e-1]) )
      }
      xrG_A[t] <- ( x01[1]*exp(-beta1*(t-1)) ) + sm
    }
    xcap1G_A <- c(x01[1],xrG_A[2:m])
    fG_A <- numeric(m-1)
    for (i in 1:m-1){
      fG_A[i] <- (xcap1G_A[i+1] - xcap1G_A[i])
    }
    f1G_A <- fG_A[1:m-1]
    x0cap4 <- matrix(c(x01[1],f1G_A[1:m-1]),ncol=1)
    x0cap5 <- tail(x0cap4,A)
    # Fitted & Predicted values
    x0cap2 <- c(x0cap,x0cap5 )
    
  })   
  
  
  #' NHMGM_p (1, 2) model when p = 1 Fitted - reactive
  #' Fitted values  
  x0capnhmgm1 <- reactive({  
    x0 <- datmv()
    x01 <- x0[ ,1]
    x02 <- x0[ ,2]
    x11 <- cumsum(x01)
    x12 <- cumsum(x02)
    p <- 1
    n <- length(x01)
    z1 <- numeric(n)
    for (i in 1:n){
      z1[i] <- 0.5*(x11[i + 1] + x11[i])
    }
    z11 <- z1[1:n-1]
    mat1 <- matrix(c(z11),ncol=1)
    z2 <- numeric(n)
    for (i in 1:n){
      z2[i] <- 0.5*(x12[i + 1] + x12[i])
    }
    z12 <- z2[1:n-1]
    mat2 <- matrix(c(z12),ncol=1)
    mat2
    b <- numeric(n)
    for (i in 2:n){
      b[i] <- i^p
    }
    mat3 <- matrix(c(b[2:n]),ncol=1)
    mat4 <- matrix(1,nrow=n-1,ncol=1)
    B <- cbind(mat1,mat2,mat3,mat4)
    N <- matrix(c(x01[2:n],x02[2:n]),ncol=2)
    xcap <- solve (t(B) %*% B) %*% t(B) %*% N
    R <- t(xcap[1:2,])
    Rinv <- solve(R)
    R2 <- Rinv %^% 2
    R3 <- Rinv %^% 3
    alpha <- matrix(xcap[3,], nrow=2)
    beta <- matrix(xcap[4,],nrow=2)
    ab <- alpha + beta
    x <- matrix(c(x01[1],x02[1]),ncol=1)
    vec <- c(2:n)
    forecast2 <- function(i) {
      ( expm(((i-1) * R)) - expm(((i-2)* R)) ) %*% ( x + ( Rinv %*% ab ) + (  R2 %*% alpha ) ) - (Rinv %*% alpha)
      
    }
    fitted <- sapply(vec,forecast2)
    x0cap <- matrix(c(x,fitted),nrow=2)
    
    fitted_1 <- t(x0cap[1,])
    fitted_2 <- t(x0cap[2,])
    x0cap <- matrix(c(fitted_1,fitted_2),ncol=2)
    A <- 4
    vecA <- c(2:n+A)
    forecast2A <- function(i) {
      ( expm(((i-1) * R)) - expm(((i-2)* R)) ) %*% ( x + ( Rinv %*% ab ) + (  R2 %*% alpha ) ) - (Rinv %*% alpha)
      
    }
    
    fitted_A <- sapply(vecA,forecast2A)
    x0cap4 <- t(fitted_A)
    library("tidyft")
    x0cap5f <- slice_tail(x0cap4,A)
    forecast_1 <- c(x0cap5f[,1])
    forecast_2 <- c(x0cap5f[,2])
    x0cap5 <- matrix(c(forecast_1,forecast_2),ncol=2)
    x0cap2_x1 <- c(fitted_1,forecast_1 )
    x0cap2_x2 <- c(fitted_2,forecast_2 )
    x0cap2 <- matrix(c(x0cap2_x1,x0cap2_x2),ncol=2)
    colnames(x0cap2, do.NULL = FALSE)
    colnames(x0cap2) <- c("Fitted-Sequence 1","Fitted-Sequence 2")
    x0cap2 
    
    
  })   
  
  
  #' NHMGM_p (1, 2) model when p = 2 Fitted - reactive
  #' Fitted values  
  x0capnhmgm2 <- reactive({  
    x0 <- datmv()
    x01 <- x0[ ,1]
    x02 <- x0[ ,2]
    x11 <- cumsum(x01)
    x12 <- cumsum(x02)
    n <- length(x01)
    z1 <- numeric(n)
    for (i in 1:n){
      z1[i] <- 0.5*(x11[i + 1] + x11[i])
    }
    z11 <- z1[1:n-1]
    mat1 <- matrix(c(z11),ncol=1)
    z2 <- numeric(n)
    for (i in 1:n){
      z2[i] <- 0.5*(x12[i + 1] + x12[i])
    }
    z12 <- z2[1:n-1]
    mat2 <- matrix(c(z12),ncol=1)
    p <- 2
    b <- numeric(n)
    for (i in 2:n){
      b[i] <- i^p
    }
    mat3 <- matrix(c(b[2:n]),ncol=1)
    mat4 <- matrix(1,nrow=n-1,ncol=1)
    B <- cbind(mat1,mat2,mat3,mat4)
    N <- matrix(c(x01[2:n],x02[2:n]),ncol=2)
    xcap <- solve (t(B) %*% B) %*% t(B) %*% N
    R <- t(xcap[1:2,])
    Rinv <- solve(R)
    R2 <- Rinv %^% 2
    R3 <- Rinv %^% 3
    alpha <- matrix(xcap[3,], nrow=2)
    beta <- matrix(xcap[4,],nrow=2)
    ab <- alpha + beta
    x <- matrix(c(x01[1],x02[1]),ncol=1)
    vec <- c(2:n)
    forecast2 <- function(i) {
      ( expm(((i-1) * R)) - expm(((i-2)* R)) ) %*% ( x + ( Rinv %*% ab ) + (  2* R2 %*% alpha ) + (  2* R3 %*% alpha ) ) - ( 2 * i * Rinv %*% alpha) + (Rinv %*% alpha)
    }
    sapply(vec,forecast2)
    fitted <- sapply(vec,forecast2)
    x0cap <- matrix(c(x,fitted),nrow=2)
    fitted_1 <- t(x0cap[1,])
    fitted_2 <- t(x0cap[2,])
    x0cap <- matrix(c(fitted_1,fitted_2),ncol=2)
    A <- 4
    vecA <- c(2:n+A)
    forecast2A <- function(i) {
      ( expm(((i-1) * R)) - expm(((i-2)* R)) ) %*% ( x + ( Rinv %*% ab ) + (  2* R2 %*% alpha ) + (  2* R3 %*% alpha ) ) - ( 2 * i * Rinv %*% alpha) + (Rinv %*% alpha)
      
    }
    fitted_A <- sapply(vecA,forecast2A)
    x0cap4 <- t(fitted_A)
    library("tidyft")
    x0cap5f <- slice_tail(x0cap4,A)
    forecast_1 <- c(x0cap5f[,1])
    forecast_2 <- c(x0cap5f[,2])
    x0cap5 <- matrix(c(forecast_1,forecast_2),ncol=2)
    x0cap2_x1 <- c(fitted_1,forecast_1 )
    x0cap2_x2 <- c(fitted_2,forecast_2 )
    x0cap2 <- matrix(c(x0cap2_x1,x0cap2_x2),ncol=2)
    colnames(x0cap2, do.NULL = FALSE)
    colnames(x0cap2) <- c("Fitted-Sequence 1","Fitted-Sequence 2")
    x0cap2 
    
  })      
  
  #' Multivariate Models - In-Sample - Actual and Fitted - render
  #' original and fitted data   
  
  output$x0capmv <- renderTable({
    if (input$radiomv == "GM (1, 3) model") {
      
      output$mv <- renderText({
        paste("GM (1, 3) model: Grey multivariate model with first order differential equation and 3 variables.", 
              "Cheng M, Li J, Liu Y, Liu B (2020). Forecasting Clean Energy Consumption in China by 2025:",
              "Using Improved Grey Model GM (1, N). Sustainability, 12(2), 1-20.",sep = "\n") 
      })
      
      actual1 <- datmv()
      actual <- actual1[ ,1]
      actual2 <- t(actual)
      n <- length(actual2)
      fitted1 <- x0capgm13()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      dfgm13 <- data.frame(actual,Fitted)
      
      
    } else if (input$radiomv == "IGM (1, 3) model") {
      
      output$mv <- renderText({
        paste("IGM (1, 3) model: Improved grey multivariate model with first order differential equation and 3 variables.", 
              "Cheng M, Li J, Liu Y, Liu B (2020). Forecasting Clean Energy Consumption in China by 2025:",
              "Using Improved Grey Model GM (1, N). Sustainability, 12(2), 1-20.",sep = "\n") 
      })
      
      actual1 <- datmv()
      actual <- actual1[ ,1]
      actual2 <- t(actual)
      n <- length(actual2)
      fitted1 <- x0capigm13()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      dfigm13 <- data.frame(actual,Fitted)
      
      
    }else if (input$radiomv == "NHMGM_1 (1, 2) model") {
      
      output$mv <- renderText({
        paste("NHMGM_1 (1, 2) model: Non-homogeneous multivariate grey model with first order differential equation and 2 variables.", 
              "The NHMGM_1 (1, 2) model function takes as input raw values and output predicted values following the paper by",
              "Wang H, Wang P, Senel M, Li T (2019). On Novel Non-homogeneous Multivariable Grey Forecasting Model",
              "NHMGM. Mathematical Problems in Engineering, 2019, 1-13.",sep = "\n") 
      })
      
      actual <- datmv()
      A1 <- actual[,1]
      A2 <- actual[,2]
      a1 <- t(A1)
      n <- length(a1)
      fitted <- x0capnhmgm1()
      f1 <- fitted[,1]
      f2 <- fitted[,2]
      F1 <- f1[1:n]
      F2 <- f2[1:n]
      dfnhmgm1 <- data.frame(A1,F1,A2,F2)
      colnames(dfnhmgm1  , do.NULL = FALSE)
      colnames(dfnhmgm1  ) <- c("Actual Data 1","Fitted Data 1","Actual DAta 2","Fitted Data 2")
      dfnhmgm1
      
      
    } else if (input$radiomv == "NHMGM_2 (1, 2) model") {
      
      output$mv <- renderText({
        paste("NHMGM_2 (1, 2) model: Non-homogeneous multivariate grey model with first order differential equation and 2 variables.", 
              "The NHMGM_2 (1, 2) model function takes as input raw values and output predicted values following the paper by",
              "Wang H, Wang P, Senel M, Li T (2019). On Novel Non-homogeneous Multivariable Grey Forecasting Model",
              "NHMGM. Mathematical Problems in Engineering, 2019, 1-13.",sep = "\n") 
      })
      
      actual <- datmv()
      A1 <- actual[,1]
      A2 <- actual[,2]
      a1 <- t(A1)
      n <- length(a1)
      fitted <- x0capnhmgm2()
      f1 <- fitted[,1]
      f2 <- fitted[,2]
      F1 <- f1[1:n]
      F2 <- f2[1:n]
      dfnhmgm2 <- data.frame(A1,F1,A2,F2)
      colnames(dfnhmgm2  , do.NULL = FALSE)
      colnames(dfnhmgm2  ) <- c("Actual Data 1","Fitted Data 1","Actual DAta 2","Fitted Data 2")
      dfnhmgm2
      
    }
  })    
  
  #' Multivariate Models - In & Out Sample - Actual and Fitted - render
  #' original and fitted data   
  
  output$x0capoutmv <- renderTable({
    
    if (input$radiooutmv == "GMC (1, 2) model") {
      
      output$outmv <- renderText({
        paste("GMC (1, 2) model: Multivariate grey convolution model with first order differential equation and",
              "2 variables using the trapezoidal rule.", 
              "The GMC (1, 2) function takes as input raw values and output predicted values following the paper by",
              "Ding S, Li R (2020). A New Multivariable Grey Convolution model based on Simpson's rule and its",
              "Application. Complexity, pp. 1-14.",
              sep = "\n") 
      })
      
      actual1 <- datinmv()
      actual <- actual1[ ,1]
      actual2 <- t(actual)
      n <- length(actual2)
      fitted1 <- x0capgmc12()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      dfgmc12 <- data.frame(actual,Fitted)
      
      
    } else if (input$radiooutmv == "GMC_g (1, 2) model") {
      
      output$outmv <- renderText({
        paste("GMC_g (1, 2) model: Multivariate grey convolution model with first order differential equation and",
              "2 variables using the Gaussian rule.", 
              "The GMC_g (1, 2) function takes as input raw values and output predicted values following the paper by",
              "Ding S, Li R (2020). A New Multivariable Grey Convolution model based on Simpson's rule and its",
              "Application. Complexity, pp. 1-14.",
              sep = "\n") 
      })
      
      actual1 <- datinmv()
      actual <- actual1[ ,1]
      actual2 <- t(actual)
      n <- length(actual2)
      fitted1 <- x0capgmc12()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      dfgmcg12 <- data.frame(actual,Fitted)
      
    } else if (input$radiooutmv == "DBGM (1, 2) model") {
      
      output$outmv <- renderText({
        paste("DBGM (1, 2) model: Multivariate grey model with dynamic background value, first order differential equation and 2 variables using the Gaussian rule.", 
              "The DBGM (1, 2) model function takes as input raw values and output predicted values following the paper by",
              "Zeng B, Li C (2018). Improved Multivariable Grey Forecasting Model and with a Dynamic Background Value",
              "Coefficient and its Application. Computers and Industrial Engineering, 118, 278-290.",sep = "\n") 
      })
      actual1 <- datinmv()
      actual <- actual1[ ,1]
      actual2 <- t(actual)
      n <- length(actual2)
      fitted1 <- x0capdbgm12()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      dfdbgm12 <- data.frame(actual,Fitted)
    }
  })    
  
  
  
  #' Predicted values - render 
  #' Multivariate Models 
  output$predictedmv <- renderTable({
    
    if (input$radiomv == "GM (1, 3) model") {
      
      output$mvpv <- renderPrint({input$radiomv1})
      
      actual1 <- datmv()
      actual <- actual1[ ,1]
      actual2 <- t(actual)
      n <- length(actual2)
      fitted1 <- x0capgm13()
      x <- input$radiomv1
      fitted3 <- tail(fitted1,4)
      fitted4 <- t(fitted3[1:x])
      
      
    } else if (input$radiomv == "IGM (1, 3) model") {
      
      output$mvpv <- renderPrint({input$radiomv1})
      
      actual1 <- datmv()
      actual <- actual1[ ,1]
      actual2 <- t(actual)
      n <- length(actual2)
      fitted1 <- x0capigm13()
      x <- input$radiomv1
      fitted3 <- tail(fitted1,4)
      fitted4 <- t(fitted3[1:x])
      
      
    } else if (input$radiomv == "NHMGM_1 (1, 2) model") {
      
      output$mvpv <- renderPrint({input$radiomv1})
      
      actual <- datmv()
      A1 <- actual[,1]
      A2 <- actual[,2]
      a1 <- t(A1)
      n <- length(a1)
      fitted <- x0capnhmgm1()
      x <- input$radiomv1
      f1 <- fitted[,1]
      f2 <- fitted[,2]
      x <- input$radiomv1
      p1 <- tail(f1,4)
      pred1 <- p1[1:x]
      p2 <- tail(f2,4)
      pred2 <- p2[1:x]
      
      prednhmgm <- data.frame(pred1,pred2)
      colnames(prednhmgm  , do.NULL = FALSE)
      colnames(prednhmgm  ) <- c("Predicted Data 1","Predicted Data 2")
      prednhmgm
      
      
    } else if (input$radiomv == "NHMGM_2 (1, 2) model") {
      
      output$mvpv <- renderPrint({input$radiomv1})
      
      actual <- datmv()
      A1 <- actual[,1]
      A2 <- actual[,2]
      a1 <- t(A1)
      n <- length(a1)
      fitted <- x0capnhmgm2()
      x <- input$radiomv1
      f1 <- fitted[,1]
      f2 <- fitted[,2]
      x <- input$radiomv1
      p1 <- tail(f1,4)
      pred1 <- p1[1:x]
      p2 <- tail(f2,4)
      pred2 <- p2[1:x]
      
      prednhmgm <- data.frame(pred1,pred2)
      colnames(prednhmgm  , do.NULL = FALSE)
      colnames(prednhmgm  ) <- c("Predicted Data 1","Predicted Data 2")
      prednhmgm
      
      
    }
  })
  
  
  #' Predicted values - render 
  #' Multivariate Models - In & Out Sample 
  output$predictedoutmv <- renderTable({
    
    if (input$radiooutmv == "GMC (1, 2) model") {
      
      output$outmvpv <- renderPrint({input$radiooutmv1})
      
      actual1 <- datinmv()
      actual <- actual1[ ,1]
      actual2 <- t(actual)
      n <- length(actual2)
      fitted1 <- x0capgmc12()
      x <- input$radiooutmv1
      fitted3 <- tail(fitted1,4)
      fitted4 <- t(fitted3[1:x])
      
      
    } else if (input$radiooutmv == "GMC_g (1, 2) model") {
      
      output$outmvpv <- renderPrint({input$radiooutmv1})
      
      actual1 <- datinmv()
      actual <- actual1[ ,1]
      actual2 <- t(actual)
      n <- length(actual2)
      fitted1 <- x0capgmcg12()
      x <- input$radiooutmv1
      fitted3 <- tail(fitted1,4)
      fitted4 <- t(fitted3[1:x])
      
      
    } else if (input$radiooutmv == "DBGM (1, 2) model") {
      
      output$outmvpv <- renderPrint({input$radiooutmv1})
      
      actual1 <- datinmv()
      actual <- actual1[ ,1]
      actual2 <- t(actual)
      n <- length(actual2)
      fitted1 <- x0capdbgm12()
      x <- input$radiooutmv1
      fitted3 <- tail(fitted1,4)
      fitted4 <- t(fitted3[1:x])
      
      
    }
  })
  
  
  #' Multivariate models - Error - render
  #' MAPE and RMSE
  output$errormv <- renderTable({
    
    if (input$radiomv == "GM (1, 3) model") {
      
      actual1 <- datmv()
      actual <- actual1[ ,1]
      actual2 <- t(actual)
      n <- length(actual2)
      fitted1 <- x0capgm13()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      MAPE <- mape(actual,Fitted)*100
      RMSE <- rmse(actual,Fitted)
      pe <- data.frame(MAPE,RMSE)
      
    } else if (input$radiomv == "IGM (1, 3) model") {
      
      actual1 <- datmv()
      actual <- actual1[ ,1]
      actual2 <- t(actual)
      n <- length(actual2)
      fitted1 <- x0capigm13()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      MAPE <- mape(actual,Fitted)*100
      RMSE <- rmse(actual,Fitted)
      pe <- data.frame(MAPE,RMSE)
      
    } else if (input$radiomv == "NHMGM_1 (1, 2) model") {
      
      actual <- datmv()
      A1 <- actual[,1]
      A2 <- actual[,2]
      a1 <- t(A1)
      n <- length(a1)
      fitted <- x0capnhmgm1()
      f1 <- fitted[,1]
      f2 <- fitted[,2]
      F1 <- f1[1:n]
      F2 <- f2[1:n]
      MAPE1 <- mape(A1,F1)*100
      RMSE1 <- rmse(A1,F1)
      
      MAPE2 <- mape(A2,F2)*100
      RMSE2 <- rmse(A2,F2)
      
      penhmgm <- data.frame(MAPE1,RMSE1,MAPE2,RMSE2)
      colnames(penhmgm  , do.NULL = FALSE)
      colnames(penhmgm  ) <- c("MAPE Data 1","RMSE Data 1","MAPE DAta 2","RMSE Data 2")
      penhmgm
      
      
    } else if (input$radiomv == "NHMGM_2 (1, 2) model") {
      
      actual <- datmv()
      A1 <- actual[,1]
      A2 <- actual[,2]
      a1 <- t(A1)
      n <- length(a1)
      fitted <- x0capnhmgm2()
      f1 <- fitted[,1]
      f2 <- fitted[,2]
      F1 <- f1[1:n]
      F2 <- f2[1:n]
      MAPE1 <- mape(A1,F1)*100
      RMSE1 <- rmse(A1,F1)
      
      MAPE2 <- mape(A2,F2)*100
      RMSE2 <- rmse(A2,F2)
      
      penhmgm <- data.frame(MAPE1,RMSE1,MAPE2,RMSE2)
      colnames(penhmgm  , do.NULL = FALSE)
      colnames(penhmgm  ) <- c("MAPE Data 1","RMSE Data 1","MAPE DAta 2","RMSE Data 2")
      penhmgm
      
      
    }
    
  })
  
  
  #' Multivariate models - Error - render
  #' MAPE and RMSE
  output$erroroutmv <- renderTable({
    
    if (input$radiooutmv == "GMC (1, 2) model") {
      
      actual1 <- datinmv()
      actual <- actual1[ ,1]
      actual2 <- t(actual)
      n <- length(actual2)
      fitted1 <- x0capgmc12()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      MAPE <- mape(actual,Fitted)*100
      RMSE <- rmse(actual,Fitted)
      pe <- data.frame(MAPE,RMSE)
      
    } else if (input$radiooutmv == "GMC_g (1, 2) model") {
      
      actual1 <- datinmv()
      actual <- actual1[ ,1]
      actual2 <- t(actual)
      n <- length(actual2)
      fitted1 <- x0capgmcg12()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      MAPE <- mape(actual,Fitted)*100
      RMSE <- rmse(actual,Fitted)
      pe <- data.frame(MAPE,RMSE)
      
      
    } else if (input$radiooutmv == "DBGM (1, 2) model") {
      
      actual1 <- datinmv()
      actual <- actual1[ ,1]
      actual2 <- t(actual)
      n <- length(actual2)
      fitted1 <- x0capdbgm12()
      fitted2 <- t(fitted1)
      Fitted <- fitted2[1:n]
      MAPE <- mape(actual,Fitted)*100
      RMSE <- rmse(actual,Fitted)
      pe <- data.frame(MAPE,RMSE)
      
      
    }
    
  })
  
  
  #' Multivariate models - Prediction Intervals - render
  #' CI  - reactive
  output$intervalsmv <- renderTable({
    
    if (input$radiomv == "GM (1, 3) model") {
      
      if (input$radiomv2 == "90") {
        
        output$cimv <- renderPrint({input$radiomv2})
        
        actual1 <- datmv()
        actual <- actual1[ ,1]
        actual2 <- t(actual)
        n <- length(actual2)
        fp1 <- x0capgm13()
        fp2 <- t(fp1)
        w <- length(fp2)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiomv1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 90
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UpperBound <- c(u[1:t])
        LowerBound <- c(l[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
        
      } else if (input$radiomv2 == "95") {
        
        output$cimv <- renderPrint({input$radiomv2})
        
        actual1 <- datmv()
        actual <- actual1[ ,1]
        actual2 <- t(actual)
        n <- length(actual2)
        fp1 <- x0capgm13()
        fp2 <- t(fp1)
        w <- length(fp2)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiomv1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 95
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UpperBound <- c(u[1:t])
        LowerBound <- c(l[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
      } else if (input$radiomv2 == "99") {
        
        output$cimv <- renderPrint({input$radiomv2})
        
        actual1 <- datmv()
        actual <- actual1[ ,1]
        actual2 <- t(actual)
        n <- length(actual2)
        fp1 <- x0capgm13()
        fp2 <- t(fp1)
        w <- length(fp2)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiomv1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 99
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UpperBound <- c(u[1:t])
        LowerBound <- c(l[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
      }
      
    } else if (input$radiomv == "IGM (1, 3) model") {
      
      if (input$radiomv2 == "90") {
        
        output$cimv <- renderPrint({input$radiomv2})
        
        actual1 <- datmv()
        actual <- actual1[ ,1]
        actual2 <- t(actual)
        n <- length(actual2)
        fp1 <- x0capigm13()
        fp2 <- t(fp1)
        w <- length(fp2)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiomv1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 90
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UpperBound <- c(u[1:t])
        LowerBound <- c(l[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
        
      } else if (input$radiomv2 == "95") {
        
        output$cimv <- renderPrint({input$radiomv2})
        
        actual1 <- datmv()
        actual <- actual1[ ,1]
        actual2 <- t(actual)
        n <- length(actual2)
        fp1 <- x0capigm13()
        fp2 <- t(fp1)
        w <- length(fp2)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiomv1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 95
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UpperBound <- c(u[1:t])
        LowerBound <- c(l[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
      } else if (input$radiomv2 == "99") { 
        
        output$cimv <- renderPrint({input$radiomv2})
        
        actual1 <- datmv()
        actual <- actual1[ ,1]
        actual2 <- t(actual)
        n <- length(actual2)
        fp1 <- x0capigm13()
        fp2 <- t(fp1)
        w <- length(fp2)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiomv1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 99
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UpperBound <- c(u[1:t])
        LowerBound <- c(l[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
      }
      
    } else if (input$radiomv == "NHMGM_1 (1, 2) model") {
      
      if (input$radiomv2 == "90") {
        
        output$cimv <- renderPrint({input$radiomv2})
        
        actual <- datmv()
        x01 <- actual[,1]
        x02 <- actual[,2]
        n <- length(x01)
        fitted <- x0capnhmgm1()
        p1 <- fitted[,1]
        p2 <- fitted[,2]
        fitted_1 <- p1[1:n]
        fitted_2 <- p2[1:n]
        forecast_1a <- tail(p1,4)
        forecast_2a <- tail(p2,4)
        x <- input$radiomv1
        forecast_1 <- forecast_1a[1:x]
        forecast_2 <- forecast_2a[1:x]
        x0cap2_x1 <- c(fitted_1,forecast_1 )
        x0cap2_x2 <- c(fitted_2,forecast_2 )
        w <- length(x0cap2_x1)
        t <- length(forecast_1)
        s_x1 <- rmse(x01, fitted_1)
        s_x2 <- rmse(x02, fitted_2)
        sse_x1 <- sum((x01 - fitted_1)^2)
        mse_x1 <- sse_x1 / (n - 2)
        sse_x2 <- sum((x02 - fitted_2)^2)
        mse_x2 <- sse_x2 / (n - 2)
        cc <- (90 + 100)/200
        t.val <- qt(cc, n - 2)
        u_x1 <- numeric(t)
        l_x1 <- numeric(t)
        for (i in 1:t) {
          u_x1[i] = forecast_1[i] + (t.val * (sqrt(mse_x1) * sqrt(i)))
          l_x1[i] = forecast_1[i] - (t.val * (sqrt(mse_x1) * sqrt(i)))
        }
        UB_x1 <- c(u_x1[1:t])
        LB_x1 <- c(l_x1[1:t])
        LB1_x1 <- c(fitted_1[n],LB_x1)
        UB2_x1 <- c(fitted_1[n],UB_x1)
        l1_x1 <- length(LB1_x1)
        d3_x1 <- seq(1, l1_x1, 1)
        u1_x1 <- length(UB2_x1)
        d4_x1 <- seq(1, u1_x1, 1)
        set3_x1 <- data.frame(x=d3_x1, y=LB1_x1)
        set4_x1 <- data.frame(x=d4_x1, y=UB2_x1)
        u_x2 <- numeric(t)
        l_x2 <- numeric(t)
        for (i in 1:t) {
          u_x2[i] = forecast_2[i] + (t.val * (sqrt(mse_x2) * sqrt(i)))
          l_x2[i] = forecast_2[i] - (t.val * (sqrt(mse_x2) * sqrt(i)))
        }
        UB_x2 <- c(u_x2[1:t])
        LB_x2 <- c(l_x2[1:t])
        LB1_x2 <- c(fitted_2[n],LB_x2)
        UB2_x2 <- c(fitted_2[n],UB_x2)
        l1_x2 <- length(LB1_x2)
        d3_x2 <- seq(1, l1_x2, 1)
        u1_x2 <- length(UB2_x2)
        d4_x2 <- seq(1, u1_x2, 1)
        set3_x2 <- data.frame(x=d3_x2, y=LB1_x2)
        set4_x2 <- data.frame(x=d4_x2, y=UB2_x2)
        CIset <- matrix(c(LB_x1,UB_x1,LB_x2,UB_x2),ncol=4)
        colnames(CIset, do.NULL = FALSE)
        colnames(CIset) <- c("LB Data 1","UB Data 1","LB Data 2","UB Data 2")
        CIset
        
        
      } else if (input$radiomv2 == "95") {
        
        output$cimv <- renderPrint({input$radiomv2})
        
        
        actual <- datmv()
        x01 <- actual[,1]
        x02 <- actual[,2]
        n <- length(x01)
        fitted <- x0capnhmgm1()
        p1 <- fitted[,1]
        p2 <- fitted[,2]
        fitted_1 <- p1[1:n]
        fitted_2 <- p2[1:n]
        forecast_1a <- tail(p1,4)
        forecast_2a <- tail(p2,4)
        x <- input$radiomv1
        forecast_1 <- forecast_1a[1:x]
        forecast_2 <- forecast_2a[1:x]
        x0cap2_x1 <- c(fitted_1,forecast_1 )
        x0cap2_x2 <- c(fitted_2,forecast_2 )
        w <- length(x0cap2_x1)
        t <- length(forecast_1)
        s_x1 <- rmse(x01, fitted_1)
        s_x2 <- rmse(x02, fitted_2)
        sse_x1 <- sum((x01 - fitted_1)^2)
        mse_x1 <- sse_x1 / (n - 2)
        sse_x2 <- sum((x02 - fitted_2)^2)
        mse_x2 <- sse_x2 / (n - 2)
        cc <- (95 + 100)/200
        t.val <- qt(cc, n - 2)
        u_x1 <- numeric(t)
        l_x1 <- numeric(t)
        for (i in 1:t) {
          u_x1[i] = forecast_1[i] + (t.val * (sqrt(mse_x1) * sqrt(i)))
          l_x1[i] = forecast_1[i] - (t.val * (sqrt(mse_x1) * sqrt(i)))
        }
        UB_x1 <- c(u_x1[1:t])
        LB_x1 <- c(l_x1[1:t])
        LB1_x1 <- c(fitted_1[n],LB_x1)
        UB2_x1 <- c(fitted_1[n],UB_x1)
        l1_x1 <- length(LB1_x1)
        d3_x1 <- seq(1, l1_x1, 1)
        u1_x1 <- length(UB2_x1)
        d4_x1 <- seq(1, u1_x1, 1)
        set3_x1 <- data.frame(x=d3_x1, y=LB1_x1)
        set4_x1 <- data.frame(x=d4_x1, y=UB2_x1)
        u_x2 <- numeric(t)
        l_x2 <- numeric(t)
        for (i in 1:t) {
          u_x2[i] = forecast_2[i] + (t.val * (sqrt(mse_x2) * sqrt(i)))
          l_x2[i] = forecast_2[i] - (t.val * (sqrt(mse_x2) * sqrt(i)))
        }
        UB_x2 <- c(u_x2[1:t])
        LB_x2 <- c(l_x2[1:t])
        LB1_x2 <- c(fitted_2[n],LB_x2)
        UB2_x2 <- c(fitted_2[n],UB_x2)
        l1_x2 <- length(LB1_x2)
        d3_x2 <- seq(1, l1_x2, 1)
        u1_x2 <- length(UB2_x2)
        d4_x2 <- seq(1, u1_x2, 1)
        set3_x2 <- data.frame(x=d3_x2, y=LB1_x2)
        set4_x2 <- data.frame(x=d4_x2, y=UB2_x2)
        CIset <- matrix(c(LB_x1,UB_x1,LB_x2,UB_x2),ncol=4)
        colnames(CIset, do.NULL = FALSE)
        colnames(CIset) <- c("LB Data 1","UB Data 1","LB Data 2","UB Data 2")
        CIset
        
        
        
      } else if (input$radiomv2 == "99") { 
        
        output$cimv <- renderPrint({input$radiomv2})
        
        
        actual <- datmv()
        x01 <- actual[,1]
        x02 <- actual[,2]
        n <- length(x01)
        fitted <- x0capnhmgm1()
        p1 <- fitted[,1]
        p2 <- fitted[,2]
        fitted_1 <- p1[1:n]
        fitted_2 <- p2[1:n]
        forecast_1a <- tail(p1,4)
        forecast_2a <- tail(p2,4)
        x <- input$radiomv1
        forecast_1 <- forecast_1a[1:x]
        forecast_2 <- forecast_2a[1:x]
        x0cap2_x1 <- c(fitted_1,forecast_1 )
        x0cap2_x2 <- c(fitted_2,forecast_2 )
        w <- length(x0cap2_x1)
        t <- length(forecast_1)
        s_x1 <- rmse(x01, fitted_1)
        s_x2 <- rmse(x02, fitted_2)
        sse_x1 <- sum((x01 - fitted_1)^2)
        mse_x1 <- sse_x1 / (n - 2)
        sse_x2 <- sum((x02 - fitted_2)^2)
        mse_x2 <- sse_x2 / (n - 2)
        cc <- (99 + 100)/200
        t.val <- qt(cc, n - 2)
        u_x1 <- numeric(t)
        l_x1 <- numeric(t)
        for (i in 1:t) {
          u_x1[i] = forecast_1[i] + (t.val * (sqrt(mse_x1) * sqrt(i)))
          l_x1[i] = forecast_1[i] - (t.val * (sqrt(mse_x1) * sqrt(i)))
        }
        UB_x1 <- c(u_x1[1:t])
        LB_x1 <- c(l_x1[1:t])
        LB1_x1 <- c(fitted_1[n],LB_x1)
        UB2_x1 <- c(fitted_1[n],UB_x1)
        l1_x1 <- length(LB1_x1)
        d3_x1 <- seq(1, l1_x1, 1)
        u1_x1 <- length(UB2_x1)
        d4_x1 <- seq(1, u1_x1, 1)
        set3_x1 <- data.frame(x=d3_x1, y=LB1_x1)
        set4_x1 <- data.frame(x=d4_x1, y=UB2_x1)
        u_x2 <- numeric(t)
        l_x2 <- numeric(t)
        for (i in 1:t) {
          u_x2[i] = forecast_2[i] + (t.val * (sqrt(mse_x2) * sqrt(i)))
          l_x2[i] = forecast_2[i] - (t.val * (sqrt(mse_x2) * sqrt(i)))
        }
        UB_x2 <- c(u_x2[1:t])
        LB_x2 <- c(l_x2[1:t])
        LB1_x2 <- c(fitted_2[n],LB_x2)
        UB2_x2 <- c(fitted_2[n],UB_x2)
        l1_x2 <- length(LB1_x2)
        d3_x2 <- seq(1, l1_x2, 1)
        u1_x2 <- length(UB2_x2)
        d4_x2 <- seq(1, u1_x2, 1)
        set3_x2 <- data.frame(x=d3_x2, y=LB1_x2)
        set4_x2 <- data.frame(x=d4_x2, y=UB2_x2)
        CIset <- matrix(c(LB_x1,UB_x1,LB_x2,UB_x2),ncol=4)
        colnames(CIset, do.NULL = FALSE)
        colnames(CIset) <- c("LB Data 1","UB Data 1","LB Data 2","UB Data 2")
        CIset
        
        
      }
      
    } else if (input$radiomv == "NHMGM_2 (1, 2) model") {
      
      if (input$radiomv2 == "90") {
        
        output$cimv <- renderPrint({input$radiomv2})
        
        actual <- datmv()
        x01 <- actual[,1]
        x02 <- actual[,2]
        n <- length(x01)
        fitted <- x0capnhmgm2()
        p1 <- fitted[,1]
        p2 <- fitted[,2]
        fitted_1 <- p1[1:n]
        fitted_2 <- p2[1:n]
        forecast_1a <- tail(p1,4)
        forecast_2a <- tail(p2,4)
        x <- input$radiomv1
        forecast_1 <- forecast_1a[1:x]
        forecast_2 <- forecast_2a[1:x]
        x0cap2_x1 <- c(fitted_1,forecast_1 )
        x0cap2_x2 <- c(fitted_2,forecast_2 )
        w <- length(x0cap2_x1)
        t <- length(forecast_1)
        s_x1 <- rmse(x01, fitted_1)
        s_x2 <- rmse(x02, fitted_2)
        sse_x1 <- sum((x01 - fitted_1)^2)
        mse_x1 <- sse_x1 / (n - 2)
        sse_x2 <- sum((x02 - fitted_2)^2)
        mse_x2 <- sse_x2 / (n - 2)
        cc <- (90 + 100)/200
        t.val <- qt(cc, n - 2)
        u_x1 <- numeric(t)
        l_x1 <- numeric(t)
        for (i in 1:t) {
          u_x1[i] = forecast_1[i] + (t.val * (sqrt(mse_x1) * sqrt(i)))
          l_x1[i] = forecast_1[i] - (t.val * (sqrt(mse_x1) * sqrt(i)))
        }
        UB_x1 <- c(u_x1[1:t])
        LB_x1 <- c(l_x1[1:t])
        LB1_x1 <- c(fitted_1[n],LB_x1)
        UB2_x1 <- c(fitted_1[n],UB_x1)
        l1_x1 <- length(LB1_x1)
        d3_x1 <- seq(1, l1_x1, 1)
        u1_x1 <- length(UB2_x1)
        d4_x1 <- seq(1, u1_x1, 1)
        set3_x1 <- data.frame(x=d3_x1, y=LB1_x1)
        set4_x1 <- data.frame(x=d4_x1, y=UB2_x1)
        u_x2 <- numeric(t)
        l_x2 <- numeric(t)
        for (i in 1:t) {
          u_x2[i] = forecast_2[i] + (t.val * (sqrt(mse_x2) * sqrt(i)))
          l_x2[i] = forecast_2[i] - (t.val * (sqrt(mse_x2) * sqrt(i)))
        }
        UB_x2 <- c(u_x2[1:t])
        LB_x2 <- c(l_x2[1:t])
        LB1_x2 <- c(fitted_2[n],LB_x2)
        UB2_x2 <- c(fitted_2[n],UB_x2)
        l1_x2 <- length(LB1_x2)
        d3_x2 <- seq(1, l1_x2, 1)
        u1_x2 <- length(UB2_x2)
        d4_x2 <- seq(1, u1_x2, 1)
        set3_x2 <- data.frame(x=d3_x2, y=LB1_x2)
        set4_x2 <- data.frame(x=d4_x2, y=UB2_x2)
        CIset <- matrix(c(LB_x1,UB_x1,LB_x2,UB_x2),ncol=4)
        colnames(CIset, do.NULL = FALSE)
        colnames(CIset) <- c("LB Data 1","UB Data 1","LB Data 2","UB Data 2")
        CIset
        
        
      } else if (input$radiomv2 == "95") {
        
        output$cimv <- renderPrint({input$radiomv2})
        
        actual <- datmv()
        x01 <- actual[,1]
        x02 <- actual[,2]
        n <- length(x01)
        fitted <- x0capnhmgm2()
        p1 <- fitted[,1]
        p2 <- fitted[,2]
        fitted_1 <- p1[1:n]
        fitted_2 <- p2[1:n]
        forecast_1a <- tail(p1,4)
        forecast_2a <- tail(p2,4)
        x <- input$radiomv1
        forecast_1 <- forecast_1a[1:x]
        forecast_2 <- forecast_2a[1:x]
        x0cap2_x1 <- c(fitted_1,forecast_1 )
        x0cap2_x2 <- c(fitted_2,forecast_2 )
        w <- length(x0cap2_x1)
        t <- length(forecast_1)
        s_x1 <- rmse(x01, fitted_1)
        s_x2 <- rmse(x02, fitted_2)
        sse_x1 <- sum((x01 - fitted_1)^2)
        mse_x1 <- sse_x1 / (n - 2)
        sse_x2 <- sum((x02 - fitted_2)^2)
        mse_x2 <- sse_x2 / (n - 2)
        cc <- (95 + 100)/200
        t.val <- qt(cc, n - 2)
        u_x1 <- numeric(t)
        l_x1 <- numeric(t)
        for (i in 1:t) {
          u_x1[i] = forecast_1[i] + (t.val * (sqrt(mse_x1) * sqrt(i)))
          l_x1[i] = forecast_1[i] - (t.val * (sqrt(mse_x1) * sqrt(i)))
        }
        UB_x1 <- c(u_x1[1:t])
        LB_x1 <- c(l_x1[1:t])
        LB1_x1 <- c(fitted_1[n],LB_x1)
        UB2_x1 <- c(fitted_1[n],UB_x1)
        l1_x1 <- length(LB1_x1)
        d3_x1 <- seq(1, l1_x1, 1)
        u1_x1 <- length(UB2_x1)
        d4_x1 <- seq(1, u1_x1, 1)
        set3_x1 <- data.frame(x=d3_x1, y=LB1_x1)
        set4_x1 <- data.frame(x=d4_x1, y=UB2_x1)
        u_x2 <- numeric(t)
        l_x2 <- numeric(t)
        for (i in 1:t) {
          u_x2[i] = forecast_2[i] + (t.val * (sqrt(mse_x2) * sqrt(i)))
          l_x2[i] = forecast_2[i] - (t.val * (sqrt(mse_x2) * sqrt(i)))
        }
        UB_x2 <- c(u_x2[1:t])
        LB_x2 <- c(l_x2[1:t])
        LB1_x2 <- c(fitted_2[n],LB_x2)
        UB2_x2 <- c(fitted_2[n],UB_x2)
        l1_x2 <- length(LB1_x2)
        d3_x2 <- seq(1, l1_x2, 1)
        u1_x2 <- length(UB2_x2)
        d4_x2 <- seq(1, u1_x2, 1)
        set3_x2 <- data.frame(x=d3_x2, y=LB1_x2)
        set4_x2 <- data.frame(x=d4_x2, y=UB2_x2)
        CIset <- matrix(c(LB_x1,UB_x1,LB_x2,UB_x2),ncol=4)
        colnames(CIset, do.NULL = FALSE)
        colnames(CIset) <- c("LB Data 1","UB Data 1","LB Data 2","UB Data 2")
        CIset
        
        
      } else if (input$radiomv2 == "99") { 
        
        output$cimv <- renderPrint({input$radiomv2})
        
        actual <- datmv()
        x01 <- actual[,1]
        x02 <- actual[,2]
        n <- length(x01)
        fitted <- x0capnhmgm2()
        p1 <- fitted[,1]
        p2 <- fitted[,2]
        fitted_1 <- p1[1:n]
        fitted_2 <- p2[1:n]
        forecast_1a <- tail(p1,4)
        forecast_2a <- tail(p2,4)
        x <- input$radiomv1
        forecast_1 <- forecast_1a[1:x]
        forecast_2 <- forecast_2a[1:x]
        x0cap2_x1 <- c(fitted_1,forecast_1 )
        x0cap2_x2 <- c(fitted_2,forecast_2 )
        w <- length(x0cap2_x1)
        t <- length(forecast_1)
        s_x1 <- rmse(x01, fitted_1)
        s_x2 <- rmse(x02, fitted_2)
        sse_x1 <- sum((x01 - fitted_1)^2)
        mse_x1 <- sse_x1 / (n - 2)
        sse_x2 <- sum((x02 - fitted_2)^2)
        mse_x2 <- sse_x2 / (n - 2)
        cc <- (99 + 100)/200
        t.val <- qt(cc, n - 2)
        u_x1 <- numeric(t)
        l_x1 <- numeric(t)
        for (i in 1:t) {
          u_x1[i] = forecast_1[i] + (t.val * (sqrt(mse_x1) * sqrt(i)))
          l_x1[i] = forecast_1[i] - (t.val * (sqrt(mse_x1) * sqrt(i)))
        }
        UB_x1 <- c(u_x1[1:t])
        LB_x1 <- c(l_x1[1:t])
        LB1_x1 <- c(fitted_1[n],LB_x1)
        UB2_x1 <- c(fitted_1[n],UB_x1)
        l1_x1 <- length(LB1_x1)
        d3_x1 <- seq(1, l1_x1, 1)
        u1_x1 <- length(UB2_x1)
        d4_x1 <- seq(1, u1_x1, 1)
        set3_x1 <- data.frame(x=d3_x1, y=LB1_x1)
        set4_x1 <- data.frame(x=d4_x1, y=UB2_x1)
        u_x2 <- numeric(t)
        l_x2 <- numeric(t)
        for (i in 1:t) {
          u_x2[i] = forecast_2[i] + (t.val * (sqrt(mse_x2) * sqrt(i)))
          l_x2[i] = forecast_2[i] - (t.val * (sqrt(mse_x2) * sqrt(i)))
        }
        UB_x2 <- c(u_x2[1:t])
        LB_x2 <- c(l_x2[1:t])
        LB1_x2 <- c(fitted_2[n],LB_x2)
        UB2_x2 <- c(fitted_2[n],UB_x2)
        l1_x2 <- length(LB1_x2)
        d3_x2 <- seq(1, l1_x2, 1)
        u1_x2 <- length(UB2_x2)
        d4_x2 <- seq(1, u1_x2, 1)
        set3_x2 <- data.frame(x=d3_x2, y=LB1_x2)
        set4_x2 <- data.frame(x=d4_x2, y=UB2_x2)
        CIset <- matrix(c(LB_x1,UB_x1,LB_x2,UB_x2),ncol=4)
        colnames(CIset, do.NULL = FALSE)
        colnames(CIset) <- c("LB Data 1","UB Data 1","LB Data 2","UB Data 2")
        CIset
        
        
      }
    }   
  })
  
  
  #' Multivariate models - In & Out sample - Prediction Intervals - render
  #' CI  - reactive
  output$intervalsoutmv <- renderTable({
    
    if (input$radiooutmv == "GMC (1, 2) model") {
      
      if (input$radiooutmv2 == "90") {
        
        output$cioutmv <- renderPrint({input$radiooutmv2})
        
        actual1 <- datinmv()
        actual <- actual1[ ,1]
        actual2 <- t(actual)
        n <- length(actual2)
        fp1 <- x0capgmc12()
        fp2 <- t(fp1)
        w <- length(fp2)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiooutmv1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 90
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UpperBound <- c(u[1:t])
        LowerBound <- c(l[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
        
      } else if (input$radiooutmv2 == "95") {
        
        output$cioutmv <- renderPrint({input$radiooutmv2})
        
        actual1 <- datinmv()
        actual <- actual1[ ,1]
        actual2 <- t(actual)
        n <- length(actual2)
        fp1 <- x0capgmc12()
        fp2 <- t(fp1)
        w <- length(fp2)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiooutmv1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 95
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UpperBound <- c(u[1:t])
        LowerBound <- c(l[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
        
      } else if (input$radiooutmv2 == "99") {
        
        output$cioutmv <- renderPrint({input$radiooutmv2})
        
        actual1 <- datinmv()
        actual <- actual1[ ,1]
        actual2 <- t(actual)
        n <- length(actual2)
        fp1 <- x0capgmc12()
        fp2 <- t(fp1)
        w <- length(fp2)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiooutmv1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 99
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UpperBound <- c(u[1:t])
        LowerBound <- c(l[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
        
      }
      
    } else if (input$radiooutmv == "GMC_g (1, 2) model") {
      
      if (input$radiooutmv2 == "90") {
        
        output$cioutmv <- renderPrint({input$radiooutmv2})
        
        actual1 <- datinmv()
        actual <- actual1[ ,1]
        actual2 <- t(actual)
        n <- length(actual2)
        fp1 <- x0capgmcg12()
        fp2 <- t(fp1)
        w <- length(fp2)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiooutmv1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 90
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UpperBound <- c(u[1:t])
        LowerBound <- c(l[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
        
      } else if (input$radiooutmv2 == "95") {
        
        output$cioutmv <- renderPrint({input$radiooutmv2})
        
        actual1 <- datinmv()
        actual <- actual1[ ,1]
        actual2 <- t(actual)
        n <- length(actual2)
        fp1 <- x0capgmcg12()
        fp2 <- t(fp1)
        w <- length(fp2)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiooutmv1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 95
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UpperBound <- c(u[1:t])
        LowerBound <- c(l[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
        
        
      } else if (input$radiooutmv2 == "99") { 
        
        output$cioutmv <- renderPrint({input$radiooutmv2})
        
        actual1 <- datinmv()
        actual <- actual1[ ,1]
        actual2 <- t(actual)
        n <- length(actual2)
        fp1 <- x0capgmcg12()
        fp2 <- t(fp1)
        w <- length(fp2)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiooutmv1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 99
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UpperBound <- c(u[1:t])
        LowerBound <- c(l[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
        
      }
      
      
    } else if (input$radiooutmv == "DBGM (1, 2) model") {
      
      if (input$radiooutmv2 == "90") {
        
        output$cioutmv <- renderPrint({input$radiooutmv2})
        
        actual1 <- datinmv()
        actual <- actual1[ ,1]
        actual2 <- t(actual)
        n <- length(actual2)
        fp1 <- x0capdbgm12()
        fp2 <- t(fp1)
        w <- length(fp2)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiooutmv1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 90
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UpperBound <- c(u[1:t])
        LowerBound <- c(l[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
        
        
      } else if (input$radiooutmv2 == "95") {
        
        actual1 <- datinmv()
        actual <- actual1[ ,1]
        actual2 <- t(actual)
        n <- length(actual2)
        fp1 <- x0capdbgm12()
        fp2 <- t(fp1)
        w <- length(fp2)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiooutmv1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 95
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UpperBound <- c(u[1:t])
        LowerBound <- c(l[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
        
      } else if (input$radiooutmv2 == "99") { 
        
        actual1 <- datinmv()
        actual <- actual1[ ,1]
        actual2 <- t(actual)
        n <- length(actual2)
        fp1 <- x0capdbgm12()
        fp2 <- t(fp1)
        w <- length(fp2)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        x <- input$radiooutmv1
        predicted <- t(fitted2[1:x])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 99
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UpperBound <- c(u[1:t])
        LowerBound <- c(l[1:t])
        CIset <- data.frame(LowerBound,UpperBound)
        
      }
    }   
  })
  
  
  #' Multivariate models - Plots - render
  #' plots  - reactive
  output$plotmv <- renderPlotly({
    
    if (input$radiomv == "GM (1, 3) model") {
      
      if (input$radiomv2 == "90") {
        
        actual1 <- datmv()
        actual <- actual1[ ,1]
        actual2 <- t(actual)
        n <- length(actual2)
        fp1 <- x0capgm13()
        fp2 <- t(fp1)
        w <- length(fp2)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        predicted <- t(fitted2[1:4])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 90
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(fitted1[n],LB)
        UB2 <- c(fitted1[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=actual)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=fp1)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'GM (1, 3) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      } else if (input$radiomv2 == "95") {
        
        actual1 <- datmv()
        actual <- actual1[ ,1]
        actual2 <- t(actual)
        n <- length(actual2)
        fp1 <- x0capgm13()
        fp2 <- t(fp1)
        w <- length(fp2)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        predicted <- t(fitted2[1:4])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 95
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(fitted1[n],LB)
        UB2 <- c(fitted1[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=actual)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=fp1)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'GM (1, 3) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
      } else if (input$radiomv2 == "99") {
        
        actual1 <- datmv()
        actual <- actual1[ ,1]
        actual2 <- t(actual)
        n <- length(actual2)
        fp1 <- x0capgm13()
        fp2 <- t(fp1)
        w <- length(fp2)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        predicted <- t(fitted2[1:4])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 99
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(fitted1[n],LB)
        UB2 <- c(fitted1[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=actual)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=fp1)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'GM (1, 3) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
      }
      
    } else if (input$radiomv == "IGM (1, 3) model") {
      
      if (input$radiomv2 == "90") {
        
        actual1 <- datmv()
        actual <- actual1[ ,1]
        actual2 <- t(actual)
        n <- length(actual2)
        fp1 <- x0capigm13()
        fp2 <- t(fp1)
        w <- length(fp2)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        predicted <- t(fitted2[1:4])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 90
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(fitted1[n],LB)
        UB2 <- c(fitted1[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=actual)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=fp1)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'IGM (1, 3) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
        
      } else if (input$radiomv2 == "95") {
        
        actual1 <- datmv()
        actual <- actual1[ ,1]
        actual2 <- t(actual)
        n <- length(actual2)
        fp1 <- x0capigm13()
        fp2 <- t(fp1)
        w <- length(fp2)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        predicted <- t(fitted2[1:4])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 95
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(fitted1[n],LB)
        UB2 <- c(fitted1[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=actual)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=fp1)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'IGM (1, 3) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
      } else if (input$radiomv2 == "99") { 
        
        actual1 <- datmv()
        actual <- actual1[ ,1]
        actual2 <- t(actual)
        n <- length(actual2)
        fp1 <- x0capigm13()
        fp2 <- t(fp1)
        w <- length(fp2)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        predicted <- t(fitted2[1:4])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 99
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(fitted1[n],LB)
        UB2 <- c(fitted1[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=actual)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=fp1)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'IGM (1, 3) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
      }
      
    } else if (input$radiomv == "NHMGM_1 (1, 2) model") {
      
      if (input$radiomv2 == "90") {
        
        actual <- datmv()
        x01 <- actual[,1]
        x02 <- actual[,2]
        n <- length(x01)
        fitted <- x0capnhmgm1()
        p1 <- fitted[,1]
        p2 <- fitted[,2]
        fitted_1 <- p1[1:n]
        fitted_2 <- p2[1:n]
        forecast_1a <- tail(p1,4)
        forecast_2a <- tail(p2,4)
        forecast_1 <- forecast_1a[1:4]
        forecast_2 <- forecast_2a[1:4]
        x0cap2_x1 <- c(fitted_1,forecast_1 )
        x0cap2_x2 <- c(fitted_2,forecast_2 )
        w <- length(x0cap2_x1)
        t <- length(forecast_1)
        s_x1 <- rmse(x01, fitted_1)
        s_x2 <- rmse(x02, fitted_2)
        sse_x1 <- sum((x01 - fitted_1)^2)
        mse_x1 <- sse_x1 / (n - 2)
        sse_x2 <- sum((x02 - fitted_2)^2)
        mse_x2 <- sse_x2 / (n - 2)
        cc <- (90 + 100)/200
        t.val <- qt(cc, n - 2)
        u_x1 <- numeric(t)
        l_x1 <- numeric(t)
        for (i in 1:t) {
          u_x1[i] = forecast_1[i] + (t.val * (sqrt(mse_x1) * sqrt(i)))
          l_x1[i] = forecast_1[i] - (t.val * (sqrt(mse_x1) * sqrt(i)))
        }
        UB_x1 <- c(u_x1[1:t])
        LB_x1 <- c(l_x1[1:t])
        LB1_x1 <- c(fitted_1[n],LB_x1)
        UB2_x1 <- c(fitted_1[n],UB_x1)
        l1_x1 <- length(LB1_x1)
        d3_x1 <- seq(1, l1_x1, 1)
        u1_x1 <- length(UB2_x1)
        d4_x1 <- seq(1, u1_x1, 1)
        set3_x1 <- data.frame(x=d3_x1, y=LB1_x1)
        set4_x1 <- data.frame(x=d4_x1, y=UB2_x1)
        u_x2 <- numeric(t)
        l_x2 <- numeric(t)
        for (i in 1:t) {
          u_x2[i] = forecast_2[i] + (t.val * (sqrt(mse_x2) * sqrt(i)))
          l_x2[i] = forecast_2[i] - (t.val * (sqrt(mse_x2) * sqrt(i)))
        }
        UB_x2 <- c(u_x2[1:t])
        LB_x2 <- c(l_x2[1:t])
        LB1_x2 <- c(fitted_2[n],LB_x2)
        UB2_x2 <- c(fitted_2[n],UB_x2)
        l1_x2 <- length(LB1_x2)
        d3_x2 <- seq(1, l1_x2, 1)
        u1_x2 <- length(UB2_x2)
        d4_x2 <- seq(1, u1_x2, 1)
        set3_x2 <- data.frame(x=d3_x2, y=LB1_x2)
        set4_x2 <- data.frame(x=d4_x2, y=UB2_x2)
        d0_x1 <- seq(1, n, 1)
        xy1_x1 <- data.frame(x=d0_x1, y=x01)
        d0_x2 <- seq(1, n, 1)
        xy1_x2 <- data.frame(x=d0_x2, y=x02)
        d1_x1 <- seq(1, w, 1)
        xy2_x1 <- data.frame(x=d1_x1, y=x0cap2_x1)
        d1_x2 <- seq(1, w, 1)
        xy2_x2 <- data.frame(x=d1_x2, y=x0cap2_x2)
        df_x1 <- rbind(xy1_x1, xy2_x1, set3_x1, set4_x1)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p_x1 <- ggplot(df_x1) +
          theme_bw() +
          labs(title = 'NHMGM_1 model for sequence 1',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1_x1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2_x1, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3_x1, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4_x1, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1_x1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2_x1, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3_x1, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4_x1, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p_x1)
        
        
      } else if (input$radiomv2 == "95") {
        
        actual <- datmv()
        x01 <- actual[,1]
        x02 <- actual[,2]
        n <- length(x01)
        fitted <- x0capnhmgm1()
        p1 <- fitted[,1]
        p2 <- fitted[,2]
        fitted_1 <- p1[1:n]
        fitted_2 <- p2[1:n]
        forecast_1a <- tail(p1,4)
        forecast_2a <- tail(p2,4)
        forecast_1 <- forecast_1a[1:4]
        forecast_2 <- forecast_2a[1:4]
        x0cap2_x1 <- c(fitted_1,forecast_1 )
        x0cap2_x2 <- c(fitted_2,forecast_2 )
        w <- length(x0cap2_x1)
        t <- length(forecast_1)
        s_x1 <- rmse(x01, fitted_1)
        s_x2 <- rmse(x02, fitted_2)
        sse_x1 <- sum((x01 - fitted_1)^2)
        mse_x1 <- sse_x1 / (n - 2)
        sse_x2 <- sum((x02 - fitted_2)^2)
        mse_x2 <- sse_x2 / (n - 2)
        cc <- (95 + 100)/200
        t.val <- qt(cc, n - 2)
        u_x1 <- numeric(t)
        l_x1 <- numeric(t)
        for (i in 1:t) {
          u_x1[i] = forecast_1[i] + (t.val * (sqrt(mse_x1) * sqrt(i)))
          l_x1[i] = forecast_1[i] - (t.val * (sqrt(mse_x1) * sqrt(i)))
        }
        UB_x1 <- c(u_x1[1:t])
        LB_x1 <- c(l_x1[1:t])
        LB1_x1 <- c(fitted_1[n],LB_x1)
        UB2_x1 <- c(fitted_1[n],UB_x1)
        l1_x1 <- length(LB1_x1)
        d3_x1 <- seq(1, l1_x1, 1)
        u1_x1 <- length(UB2_x1)
        d4_x1 <- seq(1, u1_x1, 1)
        set3_x1 <- data.frame(x=d3_x1, y=LB1_x1)
        set4_x1 <- data.frame(x=d4_x1, y=UB2_x1)
        u_x2 <- numeric(t)
        l_x2 <- numeric(t)
        for (i in 1:t) {
          u_x2[i] = forecast_2[i] + (t.val * (sqrt(mse_x2) * sqrt(i)))
          l_x2[i] = forecast_2[i] - (t.val * (sqrt(mse_x2) * sqrt(i)))
        }
        UB_x2 <- c(u_x2[1:t])
        LB_x2 <- c(l_x2[1:t])
        LB1_x2 <- c(fitted_2[n],LB_x2)
        UB2_x2 <- c(fitted_2[n],UB_x2)
        l1_x2 <- length(LB1_x2)
        d3_x2 <- seq(1, l1_x2, 1)
        u1_x2 <- length(UB2_x2)
        d4_x2 <- seq(1, u1_x2, 1)
        set3_x2 <- data.frame(x=d3_x2, y=LB1_x2)
        set4_x2 <- data.frame(x=d4_x2, y=UB2_x2)
        d0_x1 <- seq(1, n, 1)
        xy1_x1 <- data.frame(x=d0_x1, y=x01)
        d0_x2 <- seq(1, n, 1)
        xy1_x2 <- data.frame(x=d0_x2, y=x02)
        d1_x1 <- seq(1, w, 1)
        xy2_x1 <- data.frame(x=d1_x1, y=x0cap2_x1)
        d1_x2 <- seq(1, w, 1)
        xy2_x2 <- data.frame(x=d1_x2, y=x0cap2_x2)
        df_x1 <- rbind(xy1_x1, xy2_x1, set3_x1, set4_x1)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p_x1 <- ggplot(df_x1) +
          theme_bw() +
          labs(title = 'NHMGM_1 model for sequence 1',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1_x1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2_x1, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3_x1, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4_x1, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1_x1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2_x1, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3_x1, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4_x1, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p_x1)
        
        
        
      } else if (input$radiomv2 == "99") { 
        
        actual <- datmv()
        x01 <- actual[,1]
        x02 <- actual[,2]
        n <- length(x01)
        fitted <- x0capnhmgm1()
        p1 <- fitted[,1]
        p2 <- fitted[,2]
        fitted_1 <- p1[1:n]
        fitted_2 <- p2[1:n]
        forecast_1a <- tail(p1,4)
        forecast_2a <- tail(p2,4)
        forecast_1 <- forecast_1a[1:4]
        forecast_2 <- forecast_2a[1:4]
        x0cap2_x1 <- c(fitted_1,forecast_1 )
        x0cap2_x2 <- c(fitted_2,forecast_2 )
        w <- length(x0cap2_x1)
        t <- length(forecast_1)
        s_x1 <- rmse(x01, fitted_1)
        s_x2 <- rmse(x02, fitted_2)
        sse_x1 <- sum((x01 - fitted_1)^2)
        mse_x1 <- sse_x1 / (n - 2)
        sse_x2 <- sum((x02 - fitted_2)^2)
        mse_x2 <- sse_x2 / (n - 2)
        cc <- (99 + 100)/200
        t.val <- qt(cc, n - 2)
        u_x1 <- numeric(t)
        l_x1 <- numeric(t)
        for (i in 1:t) {
          u_x1[i] = forecast_1[i] + (t.val * (sqrt(mse_x1) * sqrt(i)))
          l_x1[i] = forecast_1[i] - (t.val * (sqrt(mse_x1) * sqrt(i)))
        }
        UB_x1 <- c(u_x1[1:t])
        LB_x1 <- c(l_x1[1:t])
        LB1_x1 <- c(fitted_1[n],LB_x1)
        UB2_x1 <- c(fitted_1[n],UB_x1)
        l1_x1 <- length(LB1_x1)
        d3_x1 <- seq(1, l1_x1, 1)
        u1_x1 <- length(UB2_x1)
        d4_x1 <- seq(1, u1_x1, 1)
        set3_x1 <- data.frame(x=d3_x1, y=LB1_x1)
        set4_x1 <- data.frame(x=d4_x1, y=UB2_x1)
        u_x2 <- numeric(t)
        l_x2 <- numeric(t)
        for (i in 1:t) {
          u_x2[i] = forecast_2[i] + (t.val * (sqrt(mse_x2) * sqrt(i)))
          l_x2[i] = forecast_2[i] - (t.val * (sqrt(mse_x2) * sqrt(i)))
        }
        UB_x2 <- c(u_x2[1:t])
        LB_x2 <- c(l_x2[1:t])
        LB1_x2 <- c(fitted_2[n],LB_x2)
        UB2_x2 <- c(fitted_2[n],UB_x2)
        l1_x2 <- length(LB1_x2)
        d3_x2 <- seq(1, l1_x2, 1)
        u1_x2 <- length(UB2_x2)
        d4_x2 <- seq(1, u1_x2, 1)
        set3_x2 <- data.frame(x=d3_x2, y=LB1_x2)
        set4_x2 <- data.frame(x=d4_x2, y=UB2_x2)
        d0_x1 <- seq(1, n, 1)
        xy1_x1 <- data.frame(x=d0_x1, y=x01)
        d0_x2 <- seq(1, n, 1)
        xy1_x2 <- data.frame(x=d0_x2, y=x02)
        d1_x1 <- seq(1, w, 1)
        xy2_x1 <- data.frame(x=d1_x1, y=x0cap2_x1)
        d1_x2 <- seq(1, w, 1)
        xy2_x2 <- data.frame(x=d1_x2, y=x0cap2_x2)
        df_x1 <- rbind(xy1_x1, xy2_x1, set3_x1, set4_x1)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p_x1 <- ggplot(df_x1) +
          theme_bw() +
          labs(title = 'NHMGM_1 model for sequence 1',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1_x1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2_x1, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3_x1, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4_x1, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1_x1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2_x1, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3_x1, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4_x1, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p_x1)
        
        
      }
      
    } else if (input$radiomv == "NHMGM_2 (1, 2) model") {
      
      if (input$radiomv2 == "90") {
        
        actual <- datmv()
        x01 <- actual[,1]
        x02 <- actual[,2]
        n <- length(x01)
        fitted <- x0capnhmgm2()
        p1 <- fitted[,1]
        p2 <- fitted[,2]
        fitted_1 <- p1[1:n]
        fitted_2 <- p2[1:n]
        forecast_1a <- tail(p1,4)
        forecast_2a <- tail(p2,4)
        forecast_1 <- forecast_1a[1:4]
        forecast_2 <- forecast_2a[1:4]
        x0cap2_x1 <- c(fitted_1,forecast_1 )
        x0cap2_x2 <- c(fitted_2,forecast_2 )
        w <- length(x0cap2_x1)
        t <- length(forecast_1)
        s_x1 <- rmse(x01, fitted_1)
        s_x2 <- rmse(x02, fitted_2)
        sse_x1 <- sum((x01 - fitted_1)^2)
        mse_x1 <- sse_x1 / (n - 2)
        sse_x2 <- sum((x02 - fitted_2)^2)
        mse_x2 <- sse_x2 / (n - 2)
        cc <- (90 + 100)/200
        t.val <- qt(cc, n - 2)
        u_x1 <- numeric(t)
        l_x1 <- numeric(t)
        for (i in 1:t) {
          u_x1[i] = forecast_1[i] + (t.val * (sqrt(mse_x1) * sqrt(i)))
          l_x1[i] = forecast_1[i] - (t.val * (sqrt(mse_x1) * sqrt(i)))
        }
        UB_x1 <- c(u_x1[1:t])
        LB_x1 <- c(l_x1[1:t])
        LB1_x1 <- c(fitted_1[n],LB_x1)
        UB2_x1 <- c(fitted_1[n],UB_x1)
        l1_x1 <- length(LB1_x1)
        d3_x1 <- seq(1, l1_x1, 1)
        u1_x1 <- length(UB2_x1)
        d4_x1 <- seq(1, u1_x1, 1)
        set3_x1 <- data.frame(x=d3_x1, y=LB1_x1)
        set4_x1 <- data.frame(x=d4_x1, y=UB2_x1)
        u_x2 <- numeric(t)
        l_x2 <- numeric(t)
        for (i in 1:t) {
          u_x2[i] = forecast_2[i] + (t.val * (sqrt(mse_x2) * sqrt(i)))
          l_x2[i] = forecast_2[i] - (t.val * (sqrt(mse_x2) * sqrt(i)))
        }
        UB_x2 <- c(u_x2[1:t])
        LB_x2 <- c(l_x2[1:t])
        LB1_x2 <- c(fitted_2[n],LB_x2)
        UB2_x2 <- c(fitted_2[n],UB_x2)
        l1_x2 <- length(LB1_x2)
        d3_x2 <- seq(1, l1_x2, 1)
        u1_x2 <- length(UB2_x2)
        d4_x2 <- seq(1, u1_x2, 1)
        set3_x2 <- data.frame(x=d3_x2, y=LB1_x2)
        set4_x2 <- data.frame(x=d4_x2, y=UB2_x2)
        d0_x1 <- seq(1, n, 1)
        xy1_x1 <- data.frame(x=d0_x1, y=x01)
        d0_x2 <- seq(1, n, 1)
        xy1_x2 <- data.frame(x=d0_x2, y=x02)
        d1_x1 <- seq(1, w, 1)
        xy2_x1 <- data.frame(x=d1_x1, y=x0cap2_x1)
        d1_x2 <- seq(1, w, 1)
        xy2_x2 <- data.frame(x=d1_x2, y=x0cap2_x2)
        df_x1 <- rbind(xy1_x1, xy2_x1, set3_x1, set4_x1)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p_x1 <- ggplot(df_x1) +
          theme_bw() +
          labs(title = 'NHMGM_2 model for sequence 1',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1_x1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2_x1, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3_x1, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4_x1, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1_x1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2_x1, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3_x1, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4_x1, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p_x1)
        
        
      } else if (input$radiomv2 == "95") {
        
        actual <- datmv()
        x01 <- actual[,1]
        x02 <- actual[,2]
        n <- length(x01)
        fitted <- x0capnhmgm2()
        p1 <- fitted[,1]
        p2 <- fitted[,2]
        fitted_1 <- p1[1:n]
        fitted_2 <- p2[1:n]
        forecast_1a <- tail(p1,4)
        forecast_2a <- tail(p2,4)
        forecast_1 <- forecast_1a[1:4]
        forecast_2 <- forecast_2a[1:4]
        x0cap2_x1 <- c(fitted_1,forecast_1 )
        x0cap2_x2 <- c(fitted_2,forecast_2 )
        w <- length(x0cap2_x1)
        t <- length(forecast_1)
        s_x1 <- rmse(x01, fitted_1)
        s_x2 <- rmse(x02, fitted_2)
        sse_x1 <- sum((x01 - fitted_1)^2)
        mse_x1 <- sse_x1 / (n - 2)
        sse_x2 <- sum((x02 - fitted_2)^2)
        mse_x2 <- sse_x2 / (n - 2)
        cc <- (95 + 100)/200
        t.val <- qt(cc, n - 2)
        u_x1 <- numeric(t)
        l_x1 <- numeric(t)
        for (i in 1:t) {
          u_x1[i] = forecast_1[i] + (t.val * (sqrt(mse_x1) * sqrt(i)))
          l_x1[i] = forecast_1[i] - (t.val * (sqrt(mse_x1) * sqrt(i)))
        }
        UB_x1 <- c(u_x1[1:t])
        LB_x1 <- c(l_x1[1:t])
        LB1_x1 <- c(fitted_1[n],LB_x1)
        UB2_x1 <- c(fitted_1[n],UB_x1)
        l1_x1 <- length(LB1_x1)
        d3_x1 <- seq(1, l1_x1, 1)
        u1_x1 <- length(UB2_x1)
        d4_x1 <- seq(1, u1_x1, 1)
        set3_x1 <- data.frame(x=d3_x1, y=LB1_x1)
        set4_x1 <- data.frame(x=d4_x1, y=UB2_x1)
        u_x2 <- numeric(t)
        l_x2 <- numeric(t)
        for (i in 1:t) {
          u_x2[i] = forecast_2[i] + (t.val * (sqrt(mse_x2) * sqrt(i)))
          l_x2[i] = forecast_2[i] - (t.val * (sqrt(mse_x2) * sqrt(i)))
        }
        UB_x2 <- c(u_x2[1:t])
        LB_x2 <- c(l_x2[1:t])
        LB1_x2 <- c(fitted_2[n],LB_x2)
        UB2_x2 <- c(fitted_2[n],UB_x2)
        l1_x2 <- length(LB1_x2)
        d3_x2 <- seq(1, l1_x2, 1)
        u1_x2 <- length(UB2_x2)
        d4_x2 <- seq(1, u1_x2, 1)
        set3_x2 <- data.frame(x=d3_x2, y=LB1_x2)
        set4_x2 <- data.frame(x=d4_x2, y=UB2_x2)
        d0_x1 <- seq(1, n, 1)
        xy1_x1 <- data.frame(x=d0_x1, y=x01)
        d0_x2 <- seq(1, n, 1)
        xy1_x2 <- data.frame(x=d0_x2, y=x02)
        d1_x1 <- seq(1, w, 1)
        xy2_x1 <- data.frame(x=d1_x1, y=x0cap2_x1)
        d1_x2 <- seq(1, w, 1)
        xy2_x2 <- data.frame(x=d1_x2, y=x0cap2_x2)
        df_x1 <- rbind(xy1_x1, xy2_x1, set3_x1, set4_x1)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p_x1 <- ggplot(df_x1) +
          theme_bw() +
          labs(title = 'NHMGM_2 model for sequence 1',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1_x1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2_x1, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3_x1, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4_x1, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1_x1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2_x1, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3_x1, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4_x1, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p_x1)
        
        
      } else if (input$radiomv2 == "99") { 
        
        
        actual <- datmv()
        x01 <- actual[,1]
        x02 <- actual[,2]
        n <- length(x01)
        fitted <- x0capnhmgm2()
        p1 <- fitted[,1]
        p2 <- fitted[,2]
        fitted_1 <- p1[1:n]
        fitted_2 <- p2[1:n]
        forecast_1a <- tail(p1,4)
        forecast_2a <- tail(p2,4)
        forecast_1 <- forecast_1a[1:4]
        forecast_2 <- forecast_2a[1:4]
        x0cap2_x1 <- c(fitted_1,forecast_1 )
        x0cap2_x2 <- c(fitted_2,forecast_2 )
        w <- length(x0cap2_x1)
        t <- length(forecast_1)
        s_x1 <- rmse(x01, fitted_1)
        s_x2 <- rmse(x02, fitted_2)
        sse_x1 <- sum((x01 - fitted_1)^2)
        mse_x1 <- sse_x1 / (n - 2)
        sse_x2 <- sum((x02 - fitted_2)^2)
        mse_x2 <- sse_x2 / (n - 2)
        cc <- (99 + 100)/200
        t.val <- qt(cc, n - 2)
        u_x1 <- numeric(t)
        l_x1 <- numeric(t)
        for (i in 1:t) {
          u_x1[i] = forecast_1[i] + (t.val * (sqrt(mse_x1) * sqrt(i)))
          l_x1[i] = forecast_1[i] - (t.val * (sqrt(mse_x1) * sqrt(i)))
        }
        UB_x1 <- c(u_x1[1:t])
        LB_x1 <- c(l_x1[1:t])
        LB1_x1 <- c(fitted_1[n],LB_x1)
        UB2_x1 <- c(fitted_1[n],UB_x1)
        l1_x1 <- length(LB1_x1)
        d3_x1 <- seq(1, l1_x1, 1)
        u1_x1 <- length(UB2_x1)
        d4_x1 <- seq(1, u1_x1, 1)
        set3_x1 <- data.frame(x=d3_x1, y=LB1_x1)
        set4_x1 <- data.frame(x=d4_x1, y=UB2_x1)
        u_x2 <- numeric(t)
        l_x2 <- numeric(t)
        for (i in 1:t) {
          u_x2[i] = forecast_2[i] + (t.val * (sqrt(mse_x2) * sqrt(i)))
          l_x2[i] = forecast_2[i] - (t.val * (sqrt(mse_x2) * sqrt(i)))
        }
        UB_x2 <- c(u_x2[1:t])
        LB_x2 <- c(l_x2[1:t])
        LB1_x2 <- c(fitted_2[n],LB_x2)
        UB2_x2 <- c(fitted_2[n],UB_x2)
        l1_x2 <- length(LB1_x2)
        d3_x2 <- seq(1, l1_x2, 1)
        u1_x2 <- length(UB2_x2)
        d4_x2 <- seq(1, u1_x2, 1)
        set3_x2 <- data.frame(x=d3_x2, y=LB1_x2)
        set4_x2 <- data.frame(x=d4_x2, y=UB2_x2)
        d0_x1 <- seq(1, n, 1)
        xy1_x1 <- data.frame(x=d0_x1, y=x01)
        d0_x2 <- seq(1, n, 1)
        xy1_x2 <- data.frame(x=d0_x2, y=x02)
        d1_x1 <- seq(1, w, 1)
        xy2_x1 <- data.frame(x=d1_x1, y=x0cap2_x1)
        d1_x2 <- seq(1, w, 1)
        xy2_x2 <- data.frame(x=d1_x2, y=x0cap2_x2)
        df_x1 <- rbind(xy1_x1, xy2_x1, set3_x1, set4_x1)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p_x1 <- ggplot(df_x1) +
          theme_bw() +
          labs(title = 'NHMGM_2 model for sequence 1',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1_x1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2_x1, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3_x1, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4_x1, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1_x1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2_x1, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3_x1, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4_x1, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p_x1)
        
        
      }
    }   
  })
  
  
  #' Multivariate models - In & Out sample - Plots - render
  output$plotoutmv <- renderPlotly({ 
    
    if (input$radiooutmv == "GMC (1, 2) model") {
      
      if (input$radiooutmv2 == "90") {
        
        actual1 <- datinmv()
        actual <- actual1[ ,1]
        actual2 <- t(actual)
        n <- length(actual2)
        fp1 <- x0capgmc12()
        fp2 <- t(fp1)
        w <- length(fp2)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        predicted <- t(fitted2[1:4])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 90
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(fitted1[n],LB)
        UB2 <- c(fitted1[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=actual)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=fp1)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'GMC (1, 2) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      } else if (input$radiooutmv2 == "95") {
        
        actual1 <- datinmv()
        actual <- actual1[ ,1]
        actual2 <- t(actual)
        n <- length(actual2)
        fp1 <- x0capgmc12()
        fp2 <- t(fp1)
        w <- length(fp2)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        predicted <- t(fitted2[1:4])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 95
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(fitted1[n],LB)
        UB2 <- c(fitted1[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=actual)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=fp1)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'GMC (1, 2) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      } else if (input$radiooutmv2 == "99") {
        
        actual1 <- datinmv()
        actual <- actual1[ ,1]
        actual2 <- t(actual)
        n <- length(actual2)
        fp1 <- x0capgmc12()
        fp2 <- t(fp1)
        w <- length(fp2)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        predicted <- t(fitted2[1:4])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 99
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(fitted1[n],LB)
        UB2 <- c(fitted1[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=actual)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=fp1)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'GMC (1, 2) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      }
      
    } else if (input$radiooutmv == "GMC_g (1, 2) model") {
      
      if (input$radiooutmv2 == "90") {
        
        actual1 <- datinmv()
        actual <- actual1[ ,1]
        actual2 <- t(actual)
        n <- length(actual2)
        fp1 <- x0capgmcg12()
        fp2 <- t(fp1)
        w <- length(fp2)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        predicted <- t(fitted2[1:4])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 90
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(fitted1[n],LB)
        UB2 <- c(fitted1[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=actual)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=fp1)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'GMC_g (1, 2) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      } else if (input$radiooutmv2 == "95") {
        
        output$cioutmv <- renderPrint({input$radiooutmv2})
        
        actual1 <- datinmv()
        actual <- actual1[ ,1]
        actual2 <- t(actual)
        n <- length(actual2)
        fp1 <- x0capgmcg12()
        fp2 <- t(fp1)
        w <- length(fp2)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        predicted <- t(fitted2[1:4])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 95
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(fitted1[n],LB)
        UB2 <- c(fitted1[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=actual)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=fp1)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'GMC_g (1, 2) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      } else if (input$radiooutmv2 == "99") { 
        
        output$cioutmv <- renderPrint({input$radiooutmv2})
        
        actual1 <- datinmv()
        actual <- actual1[ ,1]
        actual2 <- t(actual)
        n <- length(actual2)
        fp1 <- x0capgmcg12()
        fp2 <- t(fp1)
        w <- length(fp2)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        predicted <- t(fitted2[1:4])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 99
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(fitted1[n],LB)
        UB2 <- c(fitted1[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=actual)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=fp1)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'GMC_g (1, 2) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      }
      
      
    } else if (input$radiooutmv == "DBGM (1, 2) model") {
      
      if (input$radiooutmv2 == "90") {
        
        output$cioutmv <- renderPrint({input$radiooutmv2})
        
        actual1 <- datinmv()
        actual <- actual1[ ,1]
        actual2 <- t(actual)
        n <- length(actual2)
        fp1 <- x0capdbgm12()
        fp2 <- t(fp1)
        w <- length(fp2)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        predicted <- t(fitted2[1:4])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 90
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(fitted1[n],LB)
        UB2 <- c(fitted1[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=actual)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=fp1)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'DBGM (1, 2) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
        
      } else if (input$radiooutmv2 == "95") {
        
        actual1 <- datinmv()
        actual <- actual1[ ,1]
        actual2 <- t(actual)
        n <- length(actual2)
        fp1 <- x0capdbgm12()
        fp2 <- t(fp1)
        w <- length(fp2)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        predicted <- t(fitted2[1:4])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 95
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(fitted1[n],LB)
        UB2 <- c(fitted1[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=actual)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=fp1)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'DBGM (1, 2) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      } else if (input$radiooutmv2 == "99") { 
        
        actual1 <- datinmv()
        actual <- actual1[ ,1]
        actual2 <- t(actual)
        n <- length(actual2)
        fp1 <- x0capdbgm12()
        fp2 <- t(fp1)
        w <- length(fp2)
        n <- length(actual2)
        fitted1 <- fp2[1:n]
        fitted2 <- tail(fp1,4)
        predicted <- t(fitted2[1:4])
        t <- length(predicted)
        s <- rmse(actual2, fitted1)
        sse <- sum((actual2 - fitted1)^2)
        mse <- sse / (n - 2)
        ci <- 99
        cc <- (ci + 100)/200
        t.val <- qt(cc, n - 2)
        u <- numeric(t)
        l <- numeric(t)
        for (i in 1:t) {
          u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
          l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
        }
        UB <- c(u[1:t])
        LB <- c(l[1:t])
        LB1 <- c(fitted1[n],LB)
        UB2 <- c(fitted1[n],UB)
        l1 <- length(LB1)
        d3 <- seq(1, l1, 1)
        u1 <- length(UB2)
        d4 <- seq(1, u1, 1)
        set3 <- data.frame(x=d3, y=LB1)
        set4 <- data.frame(x=d4, y=UB2)
        d0 <- seq(1, n, 1)
        xy1 <- data.frame(x=d0, y=actual)
        d1 <- seq(1, w, 1)
        xy2 <- data.frame(x=d1, y=fp1)
        df <- rbind(xy1, xy2, set3, set4)
        colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'DBGM (1, 2) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
          geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
          geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      }
    }   
  })
  
  #' Interval Multivariate Models
  
  #' IG-NDGM (1, 2) model Fitted - reactive
  #' Fitted values  
  x0capigndgm12 <- reactive({  
    x0 <- datimv()    
    LB <- x0[ ,1]
    UB <- x0[ ,2]
    x0 <- cbind(LB,UB)
    n <- length(LB)
    mean <- numeric(n)
    for (i in 1:n){
      mean[i] <- (LB[i]+UB[i])/2
    }
    mean_values <- c(mean)
    x1_LB <- cumsum(LB)
    x1_UB <- cumsum(UB)
    y_LB <- matrix(c(x1_LB),ncol=1)
    y_LB <- t(t(x1_LB[2:n]))
    y_UB <- matrix(c(x1_UB),ncol=1)
    y_UB <- t(t(x1_UB[2:n]))
    m <- length(y_LB)
    mat1_LB <- matrix(c(x1_LB),ncol=1)
    mat1_LB <- t(t(x1_LB[1:m]))
    mat1_UB <- matrix(c(x1_UB),ncol=1)
    mat1_UB <- t(t(x1_UB[1:m]))
    c <- numeric(m)
    for (i in 1:m){
      c[i] <- (i)
      c1 <- c[1:m]
    }
    mat2 <-matrix(c(c1),ncol=1)
    mat3 <- matrix(1,nrow=m,ncol=1)
    B_LB <- cbind(mat1_LB,mat2,mat3)
    B_UB <- cbind(mat1_UB,mat2,mat3)
    betacap_LB <- (solve (t(B_LB) %*% B_LB)) %*% t(B_LB) %*% y_LB
    beta1_LB <- betacap_LB[1,1]
    beta2_LB <- betacap_LB[2,1]
    beta3_LB <- betacap_LB[3,1]
    betacap_UB <- (solve (t(B_UB) %*% B_UB)) %*% t(B_UB) %*% y_UB
    beta1_UB <- betacap_UB[1,1]
    beta2_UB <- betacap_UB[2,1]
    beta3_UB <- betacap_UB[3,1]
    xh <- replicate (n,0)
    for (k in 1:n-1){
      sm <- 0
      for (j in 1:k){
        sm <- sm + j*beta1_UB^(k-j)
      }
      xh[k+1] <- (beta1_UB^k)*UB[1] + beta2_UB*(sm) + ((1 - beta1_UB^k)/(1 - beta1_UB))*beta3_UB
    }
    x1cap_UB <- c(UB[1],xh[2:n])
    x0cap_UB <- numeric(n)
    for (i in 1:n){
      x0cap_UB[i] <- x1cap_UB[i+1] - x1cap_UB[i]
    }
    x0cap_U <- c(UB[1],x0cap_UB[1:n-1])
    xL <- replicate (n,0)
    for (k in 1:n-1){
      sm <- 0
      for (j in 1:k){
        sm <- sm + j*beta1_LB^(k-j)
      }
      xL[k+1] <- (beta1_LB^k)*LB[1] + beta2_LB*(sm) + ((1 - beta1_LB^k)/(1 - beta1_LB))*beta3_LB
    }
    x1cap_LB <- c(LB[1],xL[2:n])
    x0cap_LB <- numeric(n)
    for (i in 1:n){
      x0cap_LB[i] <- x1cap_LB[i+1] - x1cap_LB[i]
    }
    x0cap_L <- c(LB[1],x0cap_LB[1:n-1])
    s_mean <- (x0cap_U+x0cap_L)/2
    simulatve_mean <- c(s_mean[1:n])
    fitted_values <- matrix(c(x0cap_L,x0cap_U,simulatve_mean),ncol=3)
    
    
    A <- 4
    xh_a <- replicate (n+A,0)
    for (k in 0 : n+A){
      sm <- 0
      for (j in 1:k){
        sm <- sm + j*beta1_UB^(k-j)
      }
      xh_a[k+1] <- (beta1_UB^k)*UB[1] + beta2_UB*(sm) + ((1 - beta1_UB^k)/(1 - beta1_UB))*beta3_UB
    }
    x1cap_UBa <- c(xh_a[1: n+A])
    t4_U <- length(x1cap_UBa)
    x0cap_UBa <- numeric(t4_U-1)
    for (i in 1 : t4_U-1){
      x0cap_UBa[i] <- x1cap_UBa[i+1] - x1cap_UBa[i]
    }
    x0cap_Ua <- c(x0cap_UBa[1 : t4_U-1])
    xL_a <- replicate (n+A,0)
    for (k in 0 : n+A){
      sm <- 0
      for (j in 1:k){
        sm <- sm + j*beta1_LB^(k-j)
      }
      xL_a[k+1] <- (beta1_LB^k)*LB[1] + beta2_LB*(sm) + ((1 - beta1_LB^k)/(1 - beta1_LB))*beta3_LB
    }
    x1cap_LBa <- c(xL_a[1 : n+A])
    t4_L <- length(x1cap_LBa)
    x0cap_LBa <- numeric(t4_L-1)
    for (i in 1 : t4_L-1){
      x0cap_LBa[i] <- x1cap_LBa[i+1] - x1cap_LBa[i]
    }
    x0cap_La <- c(x0cap_LBa[1 : t4_L-1])
    simulatedmean_a <- (x0cap_Ua+x0cap_La)/2
    x0cap4 <- c(simulatedmean_a)
    x0cap5a <- tail(x0cap4,A)
    x0cap5_U <- tail(x0cap_Ua,A)
    x0cap5_L <- tail(x0cap_La,A)
    x0cap5 <- matrix(c(x0cap5_L,x0cap5_U),ncol=2)
    x0cap2_U <- c(x0cap_U,x0cap5_U)
    x0cap2_L <- c(x0cap_L,x0cap5_L)
    SM <- c( simulatve_mean ,x0cap4)
    x0cap2 <- matrix(c(x0cap2_L,x0cap2_U,SM),ncol=3)
    
  })
  
  #' MDBGM (1, 2) model Fitted - reactive
  #' Fitted values  
  x0capmdbgm12 <- reactive({     
    data <- datinimv() 
    x0 <- data.frame(data)
    x01L <- x0[ ,1]
    x01U <- x0[ ,2]
    x02L <- x0[ ,3]
    x02U <- x0[ ,4]
    x01 <- cbind(x01L,x01U)
    x02 <- cbind(x02L,x02U)
    x11L <- cumsum(x01L)
    x11U <- cumsum(x01U)
    x11 <- cbind(x11L,x11U)
    x12L <- cumsum(x02L)
    x12U <- cumsum(x02U)
    x12 <- cbind(x12L,x12U)
    n <- length(x01L)
    b <- numeric(n)
    for (i in 1:n){
      b[i] <- (0.5*x11L[i + 1] + 0.5*x11L[i])
      b1 <- b[1:n-1]
    }
    z1L <- matrix(c(b1),ncol=1)
    n <- length(x01L)
    d <- numeric(n)
    for (i in 1:n){
      d[i] <- (0.5*x11U[i + 1] + 0.5*x11U[i])
      d1 <- d[1:n-1]
    }
    z1U <- matrix(c(d1),ncol=1)
    YL <- matrix(c(x01L[2:n]),ncol=1)
    YU <- matrix(c(x01U[2:n]),ncol=1)
    mat1 <- matrix(c(x12L[2:n]),ncol=1)
    mat2 <- matrix(c(x12U[2:n]),ncol=1)
    mat3 <- matrix(c(x11L[1:n-1]),ncol=1)
    mat4 <- matrix(c(x11U[1:n-1]),ncol=1)
    mat5 <- matrix(2:n,nrow=n-1,ncol=1)
    mat6 <- matrix(1,nrow=n-1,ncol=1)
    X <- cbind(mat1,mat2,mat3,mat4,mat5,mat6)
    A1 <- solve (t(X) %*% X) %*% t(X) %*% YL
    miu11 <- A1[1,1]
    miu12 <- A1[2,1]
    gamma11 <- A1[3,1]
    gamma12 <- A1[4,1]
    g1 <- A1[5,1]
    h1 <- A1[6,1]
    A2 <- solve (t(X) %*% X) %*% t(X) %*% YU
    miu21 <- A2[1,1]
    miu22 <- A2[2,1]
    gamma21 <- A2[3,1]
    gamma22 <- A2[4,1]
    g2 <- A2[5,1]
    h2 <- A2[6,1]
    scale_with <- function(k)
    {
      (miu11*x12L[k]) + (miu12*x12U[k]) + (gamma11*x11L[k-1]) + (gamma12*x11U[k-1]) + (g1*k) + h1
    }
    forecast_L <- scale_with(2:n)
    x0cap1L <- c(x01L[1],forecast_L)
    scale_with <- function(k)
    {
      (miu21*x12L[k]) + (miu22*x12U[k]) + (gamma21*x11L[k-1]) + (gamma22*x11U[k-1]) + (g2*k) + h2
    }
    forecast_U <- scale_with(2:n)
    x0cap1U <- c(x01U[1],forecast_U)
    x0cap <- matrix(c(cbind(x0cap1L,x0cap1U)),ncol=2)
    A <- 4
    data_A <- datoutimv()
    dfdata_a <- data.frame(data_A)
    x01La <- dfdata_a[ ,1]
    x01Ua <- dfdata_a[ ,2]
    x02La <- dfdata_a[ ,3]
    x02Ua <- dfdata_a[ ,4]
    x11La <- cumsum(x01La)
    x11Ua <- cumsum(x01Ua)
    x12La <- cumsum(x02La)
    x12Ua <- cumsum(x02Ua)
    x0cap1La <- replicate(n+A,0)
    scale_with <- function(k)
    {
      (miu11*x12La[k]) + (miu12*x12Ua[k]) + (gamma11*x11La[k-1]) + (gamma12*x11Ua[k-1]) + (g1*k) + h1
    }
    forecast_La <- scale_with(2:n+A)
    x0cap1La <- c(x01L[1],forecast_La)
    x0cap1Ua <- replicate(n+A,0)
    scale_with <- function(k)
    {
      (miu21*x12La[k]) + (miu22*x12Ua[k]) + (gamma21*x11La[k-1]) + (gamma22*x11Ua[k-1]) + (g2*k) + h2
    }
    forecast_Ua <- scale_with(2:n+A)
    x0cap1Ua <- c(x01U[1],forecast_Ua)
    x0cap4 <- matrix(c(cbind(x0cap1La,x0cap1Ua)),ncol=2)
    x0cap5 <- tail(x0cap4,A)
    x0cap5_U <- tail(x0cap1Ua,A)
    x0cap5_L <- tail(x0cap1La,A)
    x0cap2_U <- c(x0cap1U,x0cap5_U )
    x0cap2_L <- c(x0cap1L,x0cap5_L )
    x0cap2 <- matrix(c(x0cap2_L,x0cap2_U),ncol=2)
    
    
  })    
  
  
  #' Interval Multivariate Models - Actual and Fitted - render - in sample
  #' original and fitted data   
  output$x0capimv <- renderTable({
    if (input$radioimv == "IG-NDGM (1, 2) model") {
      
      output$imv <- renderText({
        paste("IG-NDGM (1, 2) model: Interval grey number sequence based on non-homogeneous discrete grey model. ", 
              "The IG-NDGM (1, 2) model function takes as input raw values and output predicted values following the paper by",
              "Xie N, Liu S (2015). Interval Grey Number Sequence Prediction by using Nonhomogeneous Exponential Discrete",
              "Grey Forecasting Model. Journal of Systems Engineering and Electronics, 26(1), 96-102.",
              sep = "\n") 
      })
      
      actual <- datimv()
      A1 <- actual[,1]
      A2 <- actual[,2]
      a1 <- t(A1)
      n <- length(a1)
      fitted <- x0capigndgm12()
      f1 <- fitted[,1]
      f2 <- fitted[,2]
      f3 <- fitted[,3]
      F1 <- f1[1:n]
      F2 <- f2[1:n]
      F3 <- f3[1:n]
      dfigndgm <- data.frame(A1,A2,F1,F2,F3)
      colnames(dfigndgm , do.NULL = FALSE)
      colnames(dfigndgm ) <- c("Lower Bound","Upper Bound","Fitted Lower","Fitted Upper","Fitted Mean")
      dfigndgm 
      
    } 
  })     
  
  
  #' Interval Multivariate Models - Actual and Fitted - render - in and out sample models
  #' original and fitted data   
  output$x0capoutimv <- renderTable({
    if (input$radiooutimv == "MDBGM (1, 2) model") {
      
      output$outimv <- renderText({
        paste("MDBGM (1, 2) model: Multivariate grey model based on dynamic background algorithm. ", 
              "The MDBGM (1, 2) function takes as input raw values and output predicted values following the paper by",
              "Zeng X, Yan S, He F, Shi Y (2019). Multivariable Grey Model based on Dynamic Background",
              "Algorithm for Forecasting the Interval Sequence. Applied Mathematical Modelling, 80(23).",
              sep = "\n") 
      })
      
      
      actual <- datinimv()
      A1 <- actual[,1]
      A2 <- actual[,2]
      a1 <- t(A1)
      n <- length(a1)
      fitted <- x0capmdbgm12()
      f1 <- fitted[,1]
      f2 <- fitted[,2]
      F1 <- f1[1:n]
      F2 <- f2[1:n]
      dfmdbgm <- data.frame(F1,F2)
      colnames(dfmdbgm  , do.NULL = FALSE)
      colnames(dfmdbgm  ) <- c("Fitted-Sequence 1","Fitted-Sequence 2")
      dfmdbgm 
      
    } 
  })        
  
  
  
  #' Predicted values - render - in sample
  #' Multivariate Interval sequences
  output$predictedimv <- renderTable({
    
    if (input$radioimv == "IG-NDGM (1, 2) model") {
      
      output$imvpv <- renderPrint({input$radioimv1})
      
      x0cap2 <- x0capigndgm12()
      pred <- tail(x0cap2,4)
      f1 <- pred[,1]
      f2 <- pred[,2]
      f3 <- pred[,3]
      x <- input$radioimv1
      Lower <- f1[1:x]
      Upper <- f2[1:x]
      Mean <- f3[1:x]
      dfigndgm <- data.frame(Lower,Upper,Mean)
      
    }
  })
  
  
  #' Predicted values - render  - in sample and out sample
  #' Multivariate Interval sequences
  output$predictedoutimv <- renderTable({
    
    if (input$radiooutimv == "MDBGM (1, 2) model") {
      
      output$outimvpv <- renderPrint({input$radiooutimv1})
      
      x0cap2 <- x0capmdbgm12()
      pred <- tail(x0cap2,4)
      f1 <- pred[,1]
      f2 <- pred[,2]
      x <- input$radiooutimv1
      Lower <- f1[1:x]
      Upper <- f2[1:x]
      dfmdbgm <- data.frame(Lower,Upper)
      colnames(dfmdbgm, do.NULL = FALSE)
      colnames(dfmdbgm) <- c("Predicted Sequence 1","Predicted Sequence 2")
      dfmdbgm 
      
    }
  })
  
  
  #' MAPE and RMSE - render - in sample
  #' Multivariate Interval sequences
  output$errorimv <- renderTable({
    
    if (input$radioimv == "IG-NDGM (1, 2) model") {
      
      actual1 <- datimv()
      Actual <- actual1[,1]
      n <- length(Actual)
      fitted1 <- x0capigndgm12()
      f1 <- fitted1[,1]
      fitted2 <- t(f1)
      Fitted <- fitted2[1:n]
      MAPE <- mape(Actual,Fitted)*100
      RMSE <- rmse(Actual,Fitted)
      pe <- data.frame(MAPE,RMSE)
      
    }
  })
  
  #' MAPE and RMSE - render - in and out smaple
  #' Multivariate Interval sequences
  output$erroroutimv <- renderTable({
    
    if (input$radiooutimv == "MDBGM (1, 2) model") {
      
      
      actual1 <- datinimv()
      Actual1 <- actual1[,1]
      Actual2 <- actual1[,2]
      n <- length(Actual1)
      fitted1 <- x0capmdbgm12()
      f1 <- t(fitted1[,1])
      f2 <- t(fitted1[,2])
      Fitted_seq1 <- f1[1:n]
      Fitted_seq2 <- f2[1:n]
      MAPE_seq1L <- mape(Actual1,Fitted_seq1)*100
      MAPE_seq1U <- mape(Actual2,Fitted_seq2)*100
      
      RMSE_seq1U <- rmse(Actual1,Fitted_seq1)
      RMSE_seq2U <- rmse(Actual2,Fitted_seq2)
      
      pe <- matrix(c(MAPE_seq1L,MAPE_seq1U,RMSE_seq1U,RMSE_seq2U),ncol=2)
      colnames(pe, do.NULL = FALSE)
      colnames(pe) <- c("MAPE","RMSE")
      pe
      
      
    }
  })
  
  
  
  #' Confidence Intervals - render - in sample 
  #' Multivariate Interval sequences
  output$intervalsimv <- renderTable({
    
    if (input$radioimv == "IG-NDGM (1, 2) model") {
      
      if (input$radioimv2 == "90") {
        
        output$ciimv <- renderPrint({input$radioimv2})
        
        actual1 <- datimv()
        LB <- actual1[,1]
        UB <- actual1[,2]
        n <- length(LB)
        fp11 <- x0capigndgm12()
        x0cap2_U <- fp11[,2]
        x0cap2_L <- fp11[,1]
        x0cap_U <- x0cap2_U[1:n]
        x0cap_L <- x0cap2_L[1:n]
        pred_U <- tail(x0cap2_U,4)
        pred_L <- tail(x0cap2_L,4)
        x <- input$radioimv1
        x0cap5_U <- t(pred_U[1:x])
        x0cap5_L <- t(pred_L[1:x])
        w <- length(x0cap2_U)
        t <- length(x0cap5_U)
        s_U <- rmse(UB, x0cap_U)
        s_L <- rmse(LB, x0cap_L)
        sse_U <- sum((UB - x0cap_U)^2)
        mse_U <- sse_U / (n - 2)
        sse_L <- sum((LB - x0cap_L)^2)
        mse_L <- sse_L / (n - 2)
        cc <- (90 + 100)/200
        t.val <- qt(cc, n - 2)
        U_u <- numeric(t)
        U_l <- numeric(t)
        L_u <- numeric(t)
        L_l <- numeric(t)
        for (i in 1:t) {
          U_u[i] = x0cap5_U[i] + (t.val * (sqrt(mse_U) * sqrt(i)))
          U_l[i] = x0cap5_U[i] - (t.val * (sqrt(mse_U) * sqrt(i)))
          L_u[i] = x0cap5_L[i] + (t.val * (sqrt(mse_L) * sqrt(i)))
          L_l[i] = x0cap5_L[i] - (t.val * (sqrt(mse_L) * sqrt(i)))
        }
        U_UB <- c(U_u[1:t])
        U_LB <- c(U_l[1:t])
        L_UB <- c(L_u[1:t])
        L_LB <- c(L_l[1:t])
        U_LB1 <- c(x0cap_U[n],U_LB)
        U_UB2 <- c(x0cap_U[n],U_UB)
        L_LB1 <- c(x0cap_L[n],L_LB)
        L_UB2 <- c(x0cap_L[n],L_UB)
        U_l1 <- length(U_LB1)
        U_d3 <- seq(1, U_l1, 1)
        U_u1 <- length(U_UB2)
        U_d4 <- seq(1, U_u1, 1)
        L_l1 <- length(L_LB1)
        L_d3 <- seq(1, L_l1, 1)
        L_u1 <- length(L_UB2)
        L_d4 <- seq(1, L_u1, 1)
        U_set3 <- data.frame(x=U_d3, y=U_LB1)
        U_set4 <- data.frame(x=U_d4, y=U_UB2)
        L_set3 <- data.frame(x=L_d3, y=L_LB1)
        L_set4 <- data.frame(x=L_d4, y=L_UB2)
        CIset <- matrix(c(U_LB,U_UB,L_LB,L_UB),ncol=4)
        colnames(CIset, do.NULL = FALSE)
        colnames(CIset) <- c("LB Lower","LB Upper","UB Lower","UB Upper")
        CIset
        
        
      } else if (input$radioimv2 == "95") {
        
        output$ciimv <- renderPrint({input$radioimv2})
        
        actual1 <- datimv()
        LB <- actual1[,1]
        UB <- actual1[,2]
        n <- length(LB)
        fp11 <- x0capigndgm12()
        x0cap2_U <- fp11[,2]
        x0cap2_L <- fp11[,1]
        x0cap_U <- x0cap2_U[1:n]
        x0cap_L <- x0cap2_L[1:n]
        pred_U <- tail(x0cap2_U,4)
        pred_L <- tail(x0cap2_L,4)
        x <- input$radioimv1
        x0cap5_U <- t(pred_U[1:x])
        x0cap5_L <- t(pred_L[1:x])
        w <- length(x0cap2_U)
        t <- length(x0cap5_U)
        s_U <- rmse(UB, x0cap_U)
        s_L <- rmse(LB, x0cap_L)
        sse_U <- sum((UB - x0cap_U)^2)
        mse_U <- sse_U / (n - 2)
        sse_L <- sum((LB - x0cap_L)^2)
        mse_L <- sse_L / (n - 2)
        cc <- (95 + 100)/200
        t.val <- qt(cc, n - 2)
        U_u <- numeric(t)
        U_l <- numeric(t)
        L_u <- numeric(t)
        L_l <- numeric(t)
        for (i in 1:t) {
          U_u[i] = x0cap5_U[i] + (t.val * (sqrt(mse_U) * sqrt(i)))
          U_l[i] = x0cap5_U[i] - (t.val * (sqrt(mse_U) * sqrt(i)))
          L_u[i] = x0cap5_L[i] + (t.val * (sqrt(mse_L) * sqrt(i)))
          L_l[i] = x0cap5_L[i] - (t.val * (sqrt(mse_L) * sqrt(i)))
        }
        U_UB <- c(U_u[1:t])
        U_LB <- c(U_l[1:t])
        L_UB <- c(L_u[1:t])
        L_LB <- c(L_l[1:t])
        U_LB1 <- c(x0cap_U[n],U_LB)
        U_UB2 <- c(x0cap_U[n],U_UB)
        L_LB1 <- c(x0cap_L[n],L_LB)
        L_UB2 <- c(x0cap_L[n],L_UB)
        U_l1 <- length(U_LB1)
        U_d3 <- seq(1, U_l1, 1)
        U_u1 <- length(U_UB2)
        U_d4 <- seq(1, U_u1, 1)
        L_l1 <- length(L_LB1)
        L_d3 <- seq(1, L_l1, 1)
        L_u1 <- length(L_UB2)
        L_d4 <- seq(1, L_u1, 1)
        U_set3 <- data.frame(x=U_d3, y=U_LB1)
        U_set4 <- data.frame(x=U_d4, y=U_UB2)
        L_set3 <- data.frame(x=L_d3, y=L_LB1)
        L_set4 <- data.frame(x=L_d4, y=L_UB2)
        CIset <- matrix(c(U_LB,U_UB,L_LB,L_UB),ncol=4)
        colnames(CIset, do.NULL = FALSE)
        colnames(CIset) <- c("LB Lower","LB Upper","UB Lower","UB Upper")
        CIset
        
      } else if (input$radioimv2 == "99") {
        
        output$ciimv <- renderPrint({input$radioimv2})
        
        actual1 <- datimv()
        LB <- actual1[,1]
        UB <- actual1[,2]
        n <- length(LB)
        fp11 <- x0capigndgm12()
        x0cap2_U <- fp11[,2]
        x0cap2_L <- fp11[,1]
        x0cap_U <- x0cap2_U[1:n]
        x0cap_L <- x0cap2_L[1:n]
        pred_U <- tail(x0cap2_U,4)
        pred_L <- tail(x0cap2_L,4)
        x <- input$radioimv1
        x0cap5_U <- t(pred_U[1:x])
        x0cap5_L <- t(pred_L[1:x])
        w <- length(x0cap2_U)
        t <- length(x0cap5_U)
        s_U <- rmse(UB, x0cap_U)
        s_L <- rmse(LB, x0cap_L)
        sse_U <- sum((UB - x0cap_U)^2)
        mse_U <- sse_U / (n - 2)
        sse_L <- sum((LB - x0cap_L)^2)
        mse_L <- sse_L / (n - 2)
        cc <- (99 + 100)/200
        t.val <- qt(cc, n - 2)
        U_u <- numeric(t)
        U_l <- numeric(t)
        L_u <- numeric(t)
        L_l <- numeric(t)
        for (i in 1:t) {
          U_u[i] = x0cap5_U[i] + (t.val * (sqrt(mse_U) * sqrt(i)))
          U_l[i] = x0cap5_U[i] - (t.val * (sqrt(mse_U) * sqrt(i)))
          L_u[i] = x0cap5_L[i] + (t.val * (sqrt(mse_L) * sqrt(i)))
          L_l[i] = x0cap5_L[i] - (t.val * (sqrt(mse_L) * sqrt(i)))
        }
        U_UB <- c(U_u[1:t])
        U_LB <- c(U_l[1:t])
        L_UB <- c(L_u[1:t])
        L_LB <- c(L_l[1:t])
        U_LB1 <- c(x0cap_U[n],U_LB)
        U_UB2 <- c(x0cap_U[n],U_UB)
        L_LB1 <- c(x0cap_L[n],L_LB)
        L_UB2 <- c(x0cap_L[n],L_UB)
        U_l1 <- length(U_LB1)
        U_d3 <- seq(1, U_l1, 1)
        U_u1 <- length(U_UB2)
        U_d4 <- seq(1, U_u1, 1)
        L_l1 <- length(L_LB1)
        L_d3 <- seq(1, L_l1, 1)
        L_u1 <- length(L_UB2)
        L_d4 <- seq(1, L_u1, 1)
        U_set3 <- data.frame(x=U_d3, y=U_LB1)
        U_set4 <- data.frame(x=U_d4, y=U_UB2)
        L_set3 <- data.frame(x=L_d3, y=L_LB1)
        L_set4 <- data.frame(x=L_d4, y=L_UB2)
        CIset <- matrix(c(U_LB,U_UB,L_LB,L_UB),ncol=4)
        colnames(CIset, do.NULL = FALSE)
        colnames(CIset) <- c("LB Lower","LB Upper","UB Lower","UB Upper")
        CIset
        
      }
      
    }
  })
  
  
  #' Confidence Intervals - render - in and out sample
  #' Multivariate Interval sequences
  output$intervalsoutimv <- renderTable({
    
    if (input$radiooutimv == "MDBGM (1, 2) model") {
      
      if (input$radiooutimv2 == "90") {
        
        actual1 <- datinimv()
        x01L <- actual1[,1]
        x01U <- actual1[,2]
        n <- length(x01L)
        fitted1 <- x0capmdbgm12()
        x0cap2L <- fitted1[,1]
        x0cap2U <- fitted1[,2]
        x0cap1L <- x0cap2L[1:n]
        x0cap1U <- x0cap2U[1:n]
        pred_U <- tail(x0cap2U,4)
        pred_L <- tail(x0cap2L,4)
        x <- input$radiooutimv1
        x0cap5_U <- t(pred_U[1:x])
        x0cap5_L <- t(pred_L[1:x])
        x0cap2_U <- c(x0cap1U,x0cap5_U )
        x0cap2_L <- c(x0cap1L,x0cap5_L )
        w <- length(x0cap2_U)
        t <- length(x0cap5_U)
        s_U <- rmse(x01U, x0cap1U)
        s_L <- rmse(x01L, x0cap1L)
        sse_U <- sum((x01U - x0cap1U)^2)
        mse_U <- sse_U / (n - 2)
        sse_L <- sum((x01L - x0cap1L)^2)
        mse_L <- sse_L / (n - 2)
        cc <- (90 + 100)/200
        t.val <- qt(cc, n - 2)
        U_u <- numeric(t)
        U_l <- numeric(t)
        L_u <- numeric(t)
        L_l <- numeric(t)
        for (i in 1:t) {
          U_u[i] = x0cap5_U[i] + (t.val * (sqrt(mse_U) * sqrt(i)))
          U_l[i] = x0cap5_U[i] - (t.val * (sqrt(mse_U) * sqrt(i)))
          L_u[i] = x0cap5_L[i] + (t.val * (sqrt(mse_L) * sqrt(i)))
          L_l[i] = x0cap5_L[i] - (t.val * (sqrt(mse_L) * sqrt(i)))
        }
        U_UB <- c(U_u[1:t])
        U_LB <- c(U_l[1:t])
        L_UB <- c(L_u[1:t])
        L_LB <- c(L_l[1:t])
        U_LB1 <- c(x0cap1U[n],U_LB)
        U_UB2 <- c(x0cap1U[n],U_UB)
        L_LB1 <- c(x0cap1L[n],L_LB)
        L_UB2 <- c(x0cap1L[n],L_UB)
        U_l1 <- length(U_LB1)
        U_d3 <- seq(1, U_l1, 1)
        U_u1 <- length(U_UB2)
        U_d4 <- seq(1, U_u1, 1)
        L_l1 <- length(L_LB1)
        L_d3 <- seq(1, L_l1, 1)
        L_u1 <- length(L_UB2)
        L_d4 <- seq(1, L_u1, 1)
        U_set3 <- data.frame(x=U_d3, y=U_LB1)
        U_set4 <- data.frame(x=U_d4, y=U_UB2)
        L_set3 <- data.frame(x=L_d3, y=L_LB1)
        L_set4 <- data.frame(x=L_d4, y=L_UB2)
        CIset <- matrix(c(L_LB,L_UB,U_LB,U_UB),ncol=4)
        colnames(CIset, do.NULL = FALSE)
        colnames(CIset) <- c("Lower-Lower Bound ","Lower-Upper Bound","Upper-Lower Bound","Upper-Upper Bound")
        CIset
        
        
      } else if (input$radiooutimv2 == "95") {
        
        actual1 <- datinimv()
        x01L <- actual1[,1]
        x01U <- actual1[,2]
        n <- length(x01L)
        fitted1 <- x0capmdbgm12()
        x0cap2L <- fitted1[,1]
        x0cap2U <- fitted1[,2]
        x0cap1L <- x0cap2L[1:n]
        x0cap1U <- x0cap2U[1:n]
        pred_U <- tail(x0cap2U,4)
        pred_L <- tail(x0cap2L,4)
        x <- input$radiooutimv1
        x0cap5_U <- t(pred_U[1:x])
        x0cap5_L <- t(pred_L[1:x])
        x0cap2_U <- c(x0cap1U,x0cap5_U )
        x0cap2_L <- c(x0cap1L,x0cap5_L )
        w <- length(x0cap2_U)
        t <- length(x0cap5_U)
        s_U <- rmse(x01U, x0cap1U)
        s_L <- rmse(x01L, x0cap1L)
        sse_U <- sum((x01U - x0cap1U)^2)
        mse_U <- sse_U / (n - 2)
        sse_L <- sum((x01L - x0cap1L)^2)
        mse_L <- sse_L / (n - 2)
        cc <- (95 + 100)/200
        t.val <- qt(cc, n - 2)
        U_u <- numeric(t)
        U_l <- numeric(t)
        L_u <- numeric(t)
        L_l <- numeric(t)
        for (i in 1:t) {
          U_u[i] = x0cap5_U[i] + (t.val * (sqrt(mse_U) * sqrt(i)))
          U_l[i] = x0cap5_U[i] - (t.val * (sqrt(mse_U) * sqrt(i)))
          L_u[i] = x0cap5_L[i] + (t.val * (sqrt(mse_L) * sqrt(i)))
          L_l[i] = x0cap5_L[i] - (t.val * (sqrt(mse_L) * sqrt(i)))
        }
        U_UB <- c(U_u[1:t])
        U_LB <- c(U_l[1:t])
        L_UB <- c(L_u[1:t])
        L_LB <- c(L_l[1:t])
        U_LB1 <- c(x0cap1U[n],U_LB)
        U_UB2 <- c(x0cap1U[n],U_UB)
        L_LB1 <- c(x0cap1L[n],L_LB)
        L_UB2 <- c(x0cap1L[n],L_UB)
        U_l1 <- length(U_LB1)
        U_d3 <- seq(1, U_l1, 1)
        U_u1 <- length(U_UB2)
        U_d4 <- seq(1, U_u1, 1)
        L_l1 <- length(L_LB1)
        L_d3 <- seq(1, L_l1, 1)
        L_u1 <- length(L_UB2)
        L_d4 <- seq(1, L_u1, 1)
        U_set3 <- data.frame(x=U_d3, y=U_LB1)
        U_set4 <- data.frame(x=U_d4, y=U_UB2)
        L_set3 <- data.frame(x=L_d3, y=L_LB1)
        L_set4 <- data.frame(x=L_d4, y=L_UB2)
        CIset <- matrix(c(L_LB,L_UB,U_LB,U_UB),ncol=4)
        colnames(CIset, do.NULL = FALSE)
        colnames(CIset) <- c("Lower-Lower Bound ","Lower-Upper Bound","Upper-Lower Bound","Upper-Upper Bound")
        CIset
        
        
      } else if (input$radiooutimv2 == "99") {
        
        actual1 <- datinimv()
        x01L <- actual1[,1]
        x01U <- actual1[,2]
        n <- length(x01L)
        fitted1 <- x0capmdbgm12()
        x0cap2L <- fitted1[,1]
        x0cap2U <- fitted1[,2]
        x0cap1L <- x0cap2L[1:n]
        x0cap1U <- x0cap2U[1:n]
        pred_U <- tail(x0cap2U,4)
        pred_L <- tail(x0cap2L,4)
        x <- input$radiooutimv1
        x0cap5_U <- t(pred_U[1:x])
        x0cap5_L <- t(pred_L[1:x])
        x0cap2_U <- c(x0cap1U,x0cap5_U )
        x0cap2_L <- c(x0cap1L,x0cap5_L )
        w <- length(x0cap2_U)
        t <- length(x0cap5_U)
        s_U <- rmse(x01U, x0cap1U)
        s_L <- rmse(x01L, x0cap1L)
        sse_U <- sum((x01U - x0cap1U)^2)
        mse_U <- sse_U / (n - 2)
        sse_L <- sum((x01L - x0cap1L)^2)
        mse_L <- sse_L / (n - 2)
        cc <- (99 + 100)/200
        t.val <- qt(cc, n - 2)
        U_u <- numeric(t)
        U_l <- numeric(t)
        L_u <- numeric(t)
        L_l <- numeric(t)
        for (i in 1:t) {
          U_u[i] = x0cap5_U[i] + (t.val * (sqrt(mse_U) * sqrt(i)))
          U_l[i] = x0cap5_U[i] - (t.val * (sqrt(mse_U) * sqrt(i)))
          L_u[i] = x0cap5_L[i] + (t.val * (sqrt(mse_L) * sqrt(i)))
          L_l[i] = x0cap5_L[i] - (t.val * (sqrt(mse_L) * sqrt(i)))
        }
        U_UB <- c(U_u[1:t])
        U_LB <- c(U_l[1:t])
        L_UB <- c(L_u[1:t])
        L_LB <- c(L_l[1:t])
        U_LB1 <- c(x0cap1U[n],U_LB)
        U_UB2 <- c(x0cap1U[n],U_UB)
        L_LB1 <- c(x0cap1L[n],L_LB)
        L_UB2 <- c(x0cap1L[n],L_UB)
        U_l1 <- length(U_LB1)
        U_d3 <- seq(1, U_l1, 1)
        U_u1 <- length(U_UB2)
        U_d4 <- seq(1, U_u1, 1)
        L_l1 <- length(L_LB1)
        L_d3 <- seq(1, L_l1, 1)
        L_u1 <- length(L_UB2)
        L_d4 <- seq(1, L_u1, 1)
        U_set3 <- data.frame(x=U_d3, y=U_LB1)
        U_set4 <- data.frame(x=U_d4, y=U_UB2)
        L_set3 <- data.frame(x=L_d3, y=L_LB1)
        L_set4 <- data.frame(x=L_d4, y=L_UB2)
        CIset <- matrix(c(L_LB,L_UB,U_LB,U_UB),ncol=4)
        colnames(CIset, do.NULL = FALSE)
        colnames(CIset) <- c("Lower-Lower Bound ","Lower-Upper Bound","Upper-Lower Bound","Upper-Upper Bound")
        CIset
      }
    }
  })
  
  
  #' Plots - render - in sample
  #' Multivariate Interval sequences
  output$plotimv <- renderPlotly({
    
    if (input$radioimv == "IG-NDGM (1, 2) model") {
      
      if (input$radioimv2 == "90") {
        
        actual1 <- datimv()
        LB <- actual1[,1]
        UB <- actual1[,2]
        n <- length(LB)
        fp11 <- x0capigndgm12()
        x0cap2_U <- fp11[,2]
        x0cap2_L <- fp11[,1]
        x0cap_U <- x0cap2_U[1:n]
        x0cap_L <- x0cap2_L[1:n]
        pred_U <- tail(x0cap2_U,4)
        pred_L <- tail(x0cap2_L,4)
        x0cap5_U <- t(pred_U[1:4])
        x0cap5_L <- t(pred_L[1:4])
        w <- length(x0cap2_U)
        t <- length(x0cap5_U)
        s_U <- rmse(UB, x0cap_U)
        s_L <- rmse(LB, x0cap_L)
        sse_U <- sum((UB - x0cap_U)^2)
        mse_U <- sse_U / (n - 2)
        sse_L <- sum((LB - x0cap_L)^2)
        mse_L <- sse_L / (n - 2)
        cc <- (90 + 100)/200
        t.val <- qt(cc, n - 2)
        U_u <- numeric(t)
        U_l <- numeric(t)
        L_u <- numeric(t)
        L_l <- numeric(t)
        for (i in 1:t) {
          U_u[i] = x0cap5_U[i] + (t.val * (sqrt(mse_U) * sqrt(i)))
          U_l[i] = x0cap5_U[i] - (t.val * (sqrt(mse_U) * sqrt(i)))
          L_u[i] = x0cap5_L[i] + (t.val * (sqrt(mse_L) * sqrt(i)))
          L_l[i] = x0cap5_L[i] - (t.val * (sqrt(mse_L) * sqrt(i)))
        }
        U_UB <- c(U_u[1:t])
        U_LB <- c(U_l[1:t])
        L_UB <- c(L_u[1:t])
        L_LB <- c(L_l[1:t])
        U_LB1 <- c(x0cap_U[n],U_LB)
        U_UB2 <- c(x0cap_U[n],U_UB)
        L_LB1 <- c(x0cap_L[n],L_LB)
        L_UB2 <- c(x0cap_L[n],L_UB)
        U_l1 <- length(U_LB1)
        U_d3 <- seq(1, U_l1, 1)
        U_u1 <- length(U_UB2)
        U_d4 <- seq(1, U_u1, 1)
        L_l1 <- length(L_LB1)
        L_d3 <- seq(1, L_l1, 1)
        L_u1 <- length(L_UB2)
        L_d4 <- seq(1, L_u1, 1)
        U_set3 <- data.frame(x=U_d3, y=U_LB1)
        U_set4 <- data.frame(x=U_d4, y=U_UB2)
        L_set3 <- data.frame(x=L_d3, y=L_LB1)
        L_set4 <- data.frame(x=L_d4, y=L_UB2)
        U_d0 <- seq(1, n, 1)
        U_xy1 <- data.frame(x=U_d0, y=UB)
        L_d0 <- seq(1, n, 1)
        L_xy1 <- data.frame(x=L_d0, y=LB)
        U_d1 <- seq(1, w, 1)
        U_xy2 <- data.frame(x=U_d1, y=x0cap2_U)
        L_d1 <- seq(1, w, 1)
        L_xy2 <- data.frame(x=L_d1, y=x0cap2_L)
        
        
        df <- rbind(U_xy1, L_xy1,U_xy2,L_xy2, U_set3, U_set4, L_set3, L_set4)
        colors <- c("Actual values of upper bound" = "grey", "Actual values of lower bound" = "grey","Fitted values of upper bound" = "red", "Fitted values of lower bound" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'IG-NDGM model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = U_xy2, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = L_xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = U_xy1, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = L_xy1, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = U_set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = U_set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = L_set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = L_set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = U_xy2, aes(x = x, y = y,color = "Fitted values of upper bound")) +
          geom_line(data = L_xy2, aes(x = x, y = y,color = "Fitted values of lower bound")) +
          geom_line(data = U_xy1, aes(x = x, y = y,color = "Actual values of upper bound")) +
          geom_line(data = L_xy1, aes(x = x, y = y,color = "Actual values of lower bound")) +
          geom_line(data = U_set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = U_set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          geom_line(data = L_set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = L_set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      } else if (input$radioimv2 == "95") {
        
        actual1 <- datimv()
        LB <- actual1[,1]
        UB <- actual1[,2]
        n <- length(LB)
        fp11 <- x0capigndgm12()
        x0cap2_U <- fp11[,2]
        x0cap2_L <- fp11[,1]
        x0cap_U <- x0cap2_U[1:n]
        x0cap_L <- x0cap2_L[1:n]
        pred_U <- tail(x0cap2_U,4)
        pred_L <- tail(x0cap2_L,4)
        x0cap5_U <- t(pred_U[1:4])
        x0cap5_L <- t(pred_L[1:4])
        w <- length(x0cap2_U)
        t <- length(x0cap5_U)
        s_U <- rmse(UB, x0cap_U)
        s_L <- rmse(LB, x0cap_L)
        sse_U <- sum((UB - x0cap_U)^2)
        mse_U <- sse_U / (n - 2)
        sse_L <- sum((LB - x0cap_L)^2)
        mse_L <- sse_L / (n - 2)
        cc <- (95 + 100)/200
        t.val <- qt(cc, n - 2)
        U_u <- numeric(t)
        U_l <- numeric(t)
        L_u <- numeric(t)
        L_l <- numeric(t)
        for (i in 1:t) {
          U_u[i] = x0cap5_U[i] + (t.val * (sqrt(mse_U) * sqrt(i)))
          U_l[i] = x0cap5_U[i] - (t.val * (sqrt(mse_U) * sqrt(i)))
          L_u[i] = x0cap5_L[i] + (t.val * (sqrt(mse_L) * sqrt(i)))
          L_l[i] = x0cap5_L[i] - (t.val * (sqrt(mse_L) * sqrt(i)))
        }
        U_UB <- c(U_u[1:t])
        U_LB <- c(U_l[1:t])
        L_UB <- c(L_u[1:t])
        L_LB <- c(L_l[1:t])
        U_LB1 <- c(x0cap_U[n],U_LB)
        U_UB2 <- c(x0cap_U[n],U_UB)
        L_LB1 <- c(x0cap_L[n],L_LB)
        L_UB2 <- c(x0cap_L[n],L_UB)
        U_l1 <- length(U_LB1)
        U_d3 <- seq(1, U_l1, 1)
        U_u1 <- length(U_UB2)
        U_d4 <- seq(1, U_u1, 1)
        L_l1 <- length(L_LB1)
        L_d3 <- seq(1, L_l1, 1)
        L_u1 <- length(L_UB2)
        L_d4 <- seq(1, L_u1, 1)
        U_set3 <- data.frame(x=U_d3, y=U_LB1)
        U_set4 <- data.frame(x=U_d4, y=U_UB2)
        L_set3 <- data.frame(x=L_d3, y=L_LB1)
        L_set4 <- data.frame(x=L_d4, y=L_UB2)
        U_d0 <- seq(1, n, 1)
        U_xy1 <- data.frame(x=U_d0, y=UB)
        L_d0 <- seq(1, n, 1)
        L_xy1 <- data.frame(x=L_d0, y=LB)
        U_d1 <- seq(1, w, 1)
        U_xy2 <- data.frame(x=U_d1, y=x0cap2_U)
        L_d1 <- seq(1, w, 1)
        L_xy2 <- data.frame(x=L_d1, y=x0cap2_L)
        df <- rbind(U_xy1, L_xy1, U_set3, U_set4, L_set3, L_set4)
        colors <- c("Actual Lower and Upper Bounds" = "red", "Fitted and Predicted Values" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'IG-NDGM model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = U_xy2, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = L_xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = U_set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = U_set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = L_set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = L_set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = U_xy2, aes(x = x, y = y,color = "Actual Lower and Upper Bounds")) +
          geom_line(data = L_xy2, aes(x = x, y = y,color = "Fitted and Predicted Values")) +
          geom_line(data = U_set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = U_set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          geom_line(data = L_set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = L_set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      } else if (input$radioimv2 == "99") {
        
        actual1 <- datimv()
        LB <- actual1[,1]
        UB <- actual1[,2]
        n <- length(LB)
        fp11 <- x0capigndgm12()
        x0cap2_U <- fp11[,2]
        x0cap2_L <- fp11[,1]
        x0cap_U <- x0cap2_U[1:n]
        x0cap_L <- x0cap2_L[1:n]
        pred_U <- tail(x0cap2_U,4)
        pred_L <- tail(x0cap2_L,4)
        x0cap5_U <- t(pred_U[1:4])
        x0cap5_L <- t(pred_L[1:4])
        w <- length(x0cap2_U)
        t <- length(x0cap5_U)
        s_U <- rmse(UB, x0cap_U)
        s_L <- rmse(LB, x0cap_L)
        sse_U <- sum((UB - x0cap_U)^2)
        mse_U <- sse_U / (n - 2)
        sse_L <- sum((LB - x0cap_L)^2)
        mse_L <- sse_L / (n - 2)
        cc <- (99 + 100)/200
        t.val <- qt(cc, n - 2)
        U_u <- numeric(t)
        U_l <- numeric(t)
        L_u <- numeric(t)
        L_l <- numeric(t)
        for (i in 1:t) {
          U_u[i] = x0cap5_U[i] + (t.val * (sqrt(mse_U) * sqrt(i)))
          U_l[i] = x0cap5_U[i] - (t.val * (sqrt(mse_U) * sqrt(i)))
          L_u[i] = x0cap5_L[i] + (t.val * (sqrt(mse_L) * sqrt(i)))
          L_l[i] = x0cap5_L[i] - (t.val * (sqrt(mse_L) * sqrt(i)))
        }
        U_UB <- c(U_u[1:t])
        U_LB <- c(U_l[1:t])
        L_UB <- c(L_u[1:t])
        L_LB <- c(L_l[1:t])
        U_LB1 <- c(x0cap_U[n],U_LB)
        U_UB2 <- c(x0cap_U[n],U_UB)
        L_LB1 <- c(x0cap_L[n],L_LB)
        L_UB2 <- c(x0cap_L[n],L_UB)
        U_l1 <- length(U_LB1)
        U_d3 <- seq(1, U_l1, 1)
        U_u1 <- length(U_UB2)
        U_d4 <- seq(1, U_u1, 1)
        L_l1 <- length(L_LB1)
        L_d3 <- seq(1, L_l1, 1)
        L_u1 <- length(L_UB2)
        L_d4 <- seq(1, L_u1, 1)
        U_set3 <- data.frame(x=U_d3, y=U_LB1)
        U_set4 <- data.frame(x=U_d4, y=U_UB2)
        L_set3 <- data.frame(x=L_d3, y=L_LB1)
        L_set4 <- data.frame(x=L_d4, y=L_UB2)
        U_d0 <- seq(1, n, 1)
        U_xy1 <- data.frame(x=U_d0, y=UB)
        L_d0 <- seq(1, n, 1)
        L_xy1 <- data.frame(x=L_d0, y=LB)
        U_d1 <- seq(1, w, 1)
        U_xy2 <- data.frame(x=U_d1, y=x0cap2_U)
        L_d1 <- seq(1, w, 1)
        L_xy2 <- data.frame(x=L_d1, y=x0cap2_L)
        df <- rbind(U_xy1, L_xy1, U_set3, U_set4, L_set3, L_set4)
        colors <- c("Actual Lower and Upper Bounds" = "red", "Fitted and Predicted Values" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'IG-NDGM model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = U_xy2, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = L_xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = U_set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = U_set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = L_set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = L_set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = U_xy2, aes(x = x, y = y,color = "Actual Lower and Upper Bounds")) +
          geom_line(data = L_xy2, aes(x = x, y = y,color = "Fitted and Predicted Values")) +
          geom_line(data = U_set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = U_set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          geom_line(data = L_set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = L_set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
      }
    }
  })
  
  
  
  #' Plots - render - in and out sample
  #' Multivariate Interval sequences
  output$plotoutimv <- renderPlotly({
    
    if (input$radiooutimv == "MDBGM (1, 2) model") {
      
      if (input$radiooutimv2 == "90") {
        
        actual1 <- datinimv()
        x01L <- actual1[,1]
        x01U <- actual1[,2]
        n <- length(x01L)
        fitted1 <- x0capmdbgm12()
        x0cap2L <- fitted1[,1]
        x0cap2U <- fitted1[,2]
        x0cap1L <- x0cap2L[1:n]
        x0cap1U <- x0cap2U[1:n]
        pred_U <- tail(x0cap2U,4)
        pred_L <- tail(x0cap2L,4)
        x0cap5_U <- t(pred_U[1:4])
        x0cap5_L <- t(pred_L[1:4])
        x0cap2_U <- c(x0cap1U,x0cap5_U )
        x0cap2_L <- c(x0cap1L,x0cap5_L )
        w <- length(x0cap2_U)
        t <- length(x0cap5_U)
        s_U <- rmse(x01U, x0cap1U)
        s_L <- rmse(x01L, x0cap1L)
        sse_U <- sum((x01U - x0cap1U)^2)
        mse_U <- sse_U / (n - 2)
        sse_L <- sum((x01L - x0cap1L)^2)
        mse_L <- sse_L / (n - 2)
        cc <- (90 + 100)/200
        t.val <- qt(cc, n - 2)
        U_u <- numeric(t)
        U_l <- numeric(t)
        L_u <- numeric(t)
        L_l <- numeric(t)
        for (i in 1:t) {
          U_u[i] = x0cap5_U[i] + (t.val * (sqrt(mse_U) * sqrt(i)))
          U_l[i] = x0cap5_U[i] - (t.val * (sqrt(mse_U) * sqrt(i)))
          L_u[i] = x0cap5_L[i] + (t.val * (sqrt(mse_L) * sqrt(i)))
          L_l[i] = x0cap5_L[i] - (t.val * (sqrt(mse_L) * sqrt(i)))
        }
        U_UB <- c(U_u[1:t])
        U_LB <- c(U_l[1:t])
        L_UB <- c(L_u[1:t])
        L_LB <- c(L_l[1:t])
        U_LB1 <- c(x0cap1U[n],U_LB)
        U_UB2 <- c(x0cap1U[n],U_UB)
        L_LB1 <- c(x0cap1L[n],L_LB)
        L_UB2 <- c(x0cap1L[n],L_UB)
        U_l1 <- length(U_LB1)
        U_d3 <- seq(1, U_l1, 1)
        U_u1 <- length(U_UB2)
        U_d4 <- seq(1, U_u1, 1)
        L_l1 <- length(L_LB1)
        L_d3 <- seq(1, L_l1, 1)
        L_u1 <- length(L_UB2)
        L_d4 <- seq(1, L_u1, 1)
        U_set3 <- data.frame(x=U_d3, y=U_LB1)
        U_set4 <- data.frame(x=U_d4, y=U_UB2)
        L_set3 <- data.frame(x=L_d3, y=L_LB1)
        L_set4 <- data.frame(x=L_d4, y=L_UB2)
        U_d0 <- seq(1, n, 1)
        U_xy1 <- data.frame(x=U_d0, y=x01U)
        L_d0 <- seq(1, n, 1)
        L_xy1 <- data.frame(x=L_d0, y=x01L)
        U_d1 <- seq(1, w, 1)
        U_xy2 <- data.frame(x=U_d1, y=x0cap2_U)
        L_d1 <- seq(1, w, 1)
        L_xy2 <- data.frame(x=L_d1, y=x0cap2_L)
        df <- rbind(U_xy1, L_xy1, U_set3, U_set4, L_set3, L_set4)
        colors <- c("Predictive values of the upper bound" = "red", "Predictive values of the lower bound" = "blue", "Actual values of the upper bound" = "purple","Actual values of the lower bound" = "orange", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'MDBGM (1,2) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = U_xy1, aes(x = x, y = y), shape = 23, color = "black") +
          geom_point(data = L_xy1, aes(x = x, y = y), shape = 23, color = "black") +
          geom_point(data = U_xy2, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = L_xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = U_set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = U_set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = L_set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = L_set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = U_xy2, aes(x = x, y = y,color = "Predictive values of the upper bound")) +
          geom_line(data = L_xy2, aes(x = x, y = y,color = "Predictive values of the lower bound")) +
          geom_line(data = U_xy1, aes(x = x, y = y,color = "Actual values of the upper bound")) +
          geom_line(data = L_xy1, aes(x = x, y = y,color = "Actual values of the lower bound")) +
          geom_line(data = U_set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = U_set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          geom_line(data = L_set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = L_set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      } else if (input$radiooutimv2 == "95") {
        
        actual1 <- datinimv()
        x01L <- actual1[,1]
        x01U <- actual1[,2]
        n <- length(x01L)
        fitted1 <- x0capmdbgm12()
        x0cap2L <- fitted1[,1]
        x0cap2U <- fitted1[,2]
        x0cap1L <- x0cap2L[1:n]
        x0cap1U <- x0cap2U[1:n]
        pred_U <- tail(x0cap2U,4)
        pred_L <- tail(x0cap2L,4)
        x0cap5_U <- t(pred_U[1:4])
        x0cap5_L <- t(pred_L[1:4])
        x0cap2_U <- c(x0cap1U,x0cap5_U )
        x0cap2_L <- c(x0cap1L,x0cap5_L )
        w <- length(x0cap2_U)
        t <- length(x0cap5_U)
        s_U <- rmse(x01U, x0cap1U)
        s_L <- rmse(x01L, x0cap1L)
        sse_U <- sum((x01U - x0cap1U)^2)
        mse_U <- sse_U / (n - 2)
        sse_L <- sum((x01L - x0cap1L)^2)
        mse_L <- sse_L / (n - 2)
        cc <- (95 + 100)/200
        t.val <- qt(cc, n - 2)
        U_u <- numeric(t)
        U_l <- numeric(t)
        L_u <- numeric(t)
        L_l <- numeric(t)
        for (i in 1:t) {
          U_u[i] = x0cap5_U[i] + (t.val * (sqrt(mse_U) * sqrt(i)))
          U_l[i] = x0cap5_U[i] - (t.val * (sqrt(mse_U) * sqrt(i)))
          L_u[i] = x0cap5_L[i] + (t.val * (sqrt(mse_L) * sqrt(i)))
          L_l[i] = x0cap5_L[i] - (t.val * (sqrt(mse_L) * sqrt(i)))
        }
        U_UB <- c(U_u[1:t])
        U_LB <- c(U_l[1:t])
        L_UB <- c(L_u[1:t])
        L_LB <- c(L_l[1:t])
        U_LB1 <- c(x0cap1U[n],U_LB)
        U_UB2 <- c(x0cap1U[n],U_UB)
        L_LB1 <- c(x0cap1L[n],L_LB)
        L_UB2 <- c(x0cap1L[n],L_UB)
        U_l1 <- length(U_LB1)
        U_d3 <- seq(1, U_l1, 1)
        U_u1 <- length(U_UB2)
        U_d4 <- seq(1, U_u1, 1)
        L_l1 <- length(L_LB1)
        L_d3 <- seq(1, L_l1, 1)
        L_u1 <- length(L_UB2)
        L_d4 <- seq(1, L_u1, 1)
        U_set3 <- data.frame(x=U_d3, y=U_LB1)
        U_set4 <- data.frame(x=U_d4, y=U_UB2)
        L_set3 <- data.frame(x=L_d3, y=L_LB1)
        L_set4 <- data.frame(x=L_d4, y=L_UB2)
        U_d0 <- seq(1, n, 1)
        U_xy1 <- data.frame(x=U_d0, y=x01U)
        L_d0 <- seq(1, n, 1)
        L_xy1 <- data.frame(x=L_d0, y=x01L)
        U_d1 <- seq(1, w, 1)
        U_xy2 <- data.frame(x=U_d1, y=x0cap2_U)
        L_d1 <- seq(1, w, 1)
        L_xy2 <- data.frame(x=L_d1, y=x0cap2_L)
        df <- rbind(U_xy1, L_xy1, U_set3, U_set4, L_set3, L_set4)
        colors <- c("Predictive values of the upper bound" = "red", "Predictive values of the lower bound" = "blue", "Actual values of the upper bound" = "purple","Actual values of the lower bound" = "orange", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'MDBGM (1,2) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = U_xy1, aes(x = x, y = y), shape = 23, color = "black") +
          geom_point(data = L_xy1, aes(x = x, y = y), shape = 23, color = "black") +
          geom_point(data = U_xy2, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = L_xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = U_set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = U_set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = L_set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = L_set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = U_xy2, aes(x = x, y = y,color = "Predictive values of the upper bound")) +
          geom_line(data = L_xy2, aes(x = x, y = y,color = "Predictive values of the lower bound")) +
          geom_line(data = U_xy1, aes(x = x, y = y,color = "Actual values of the upper bound")) +
          geom_line(data = L_xy1, aes(x = x, y = y,color = "Actual values of the lower bound")) +
          geom_line(data = U_set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = U_set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          geom_line(data = L_set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = L_set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
        
      } else if (input$radiooutimv2 == "99") {
        
        
        actual1 <- datinimv()
        x01L <- actual1[,1]
        x01U <- actual1[,2]
        n <- length(x01L)
        fitted1 <- x0capmdbgm12()
        x0cap2L <- fitted1[,1]
        x0cap2U <- fitted1[,2]
        x0cap1L <- x0cap2L[1:n]
        x0cap1U <- x0cap2U[1:n]
        pred_U <- tail(x0cap2U,4)
        pred_L <- tail(x0cap2L,4)
        x0cap5_U <- t(pred_U[1:4])
        x0cap5_L <- t(pred_L[1:4])
        x0cap2_U <- c(x0cap1U,x0cap5_U )
        x0cap2_L <- c(x0cap1L,x0cap5_L )
        w <- length(x0cap2_U)
        t <- length(x0cap5_U)
        s_U <- rmse(x01U, x0cap1U)
        s_L <- rmse(x01L, x0cap1L)
        sse_U <- sum((x01U - x0cap1U)^2)
        mse_U <- sse_U / (n - 2)
        sse_L <- sum((x01L - x0cap1L)^2)
        mse_L <- sse_L / (n - 2)
        cc <- (99 + 100)/200
        t.val <- qt(cc, n - 2)
        U_u <- numeric(t)
        U_l <- numeric(t)
        L_u <- numeric(t)
        L_l <- numeric(t)
        for (i in 1:t) {
          U_u[i] = x0cap5_U[i] + (t.val * (sqrt(mse_U) * sqrt(i)))
          U_l[i] = x0cap5_U[i] - (t.val * (sqrt(mse_U) * sqrt(i)))
          L_u[i] = x0cap5_L[i] + (t.val * (sqrt(mse_L) * sqrt(i)))
          L_l[i] = x0cap5_L[i] - (t.val * (sqrt(mse_L) * sqrt(i)))
        }
        U_UB <- c(U_u[1:t])
        U_LB <- c(U_l[1:t])
        L_UB <- c(L_u[1:t])
        L_LB <- c(L_l[1:t])
        U_LB1 <- c(x0cap1U[n],U_LB)
        U_UB2 <- c(x0cap1U[n],U_UB)
        L_LB1 <- c(x0cap1L[n],L_LB)
        L_UB2 <- c(x0cap1L[n],L_UB)
        U_l1 <- length(U_LB1)
        U_d3 <- seq(1, U_l1, 1)
        U_u1 <- length(U_UB2)
        U_d4 <- seq(1, U_u1, 1)
        L_l1 <- length(L_LB1)
        L_d3 <- seq(1, L_l1, 1)
        L_u1 <- length(L_UB2)
        L_d4 <- seq(1, L_u1, 1)
        U_set3 <- data.frame(x=U_d3, y=U_LB1)
        U_set4 <- data.frame(x=U_d4, y=U_UB2)
        L_set3 <- data.frame(x=L_d3, y=L_LB1)
        L_set4 <- data.frame(x=L_d4, y=L_UB2)
        U_d0 <- seq(1, n, 1)
        U_xy1 <- data.frame(x=U_d0, y=x01U)
        L_d0 <- seq(1, n, 1)
        L_xy1 <- data.frame(x=L_d0, y=x01L)
        U_d1 <- seq(1, w, 1)
        U_xy2 <- data.frame(x=U_d1, y=x0cap2_U)
        L_d1 <- seq(1, w, 1)
        L_xy2 <- data.frame(x=L_d1, y=x0cap2_L)
        df <- rbind(U_xy1, L_xy1, U_set3, U_set4, L_set3, L_set4)
        colors <- c("Predictive values of the upper bound" = "red", "Predictive values of the lower bound" = "blue", "Actual values of the upper bound" = "purple","Actual values of the lower bound" = "orange", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
        CI <- c(n:w)
        p <- ggplot(df) +
          theme_bw() +
          labs(title = 'MDBGM (1,2) model',x = 'Number of observation',y = 'Data Forecast & Prediction') +
          scale_x_continuous(breaks=1:w) +
          scale_y_continuous(labels = scales::comma) +
          geom_point(data = U_xy1, aes(x = x, y = y), shape = 23, color = "black") +
          geom_point(data = L_xy1, aes(x = x, y = y), shape = 23, color = "black") +
          geom_point(data = U_xy2, aes(x = x, y = y), shape = 24, color = "black") +
          geom_point(data = L_xy2, aes(x = x, y = y), shape = 21, color = "black") +
          geom_point(data = U_set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = U_set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = L_set3, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_point(data = L_set4, aes(x = CI, y = y), shape = 23, color = "black") +
          geom_line(data = U_xy2, aes(x = x, y = y,color = "Predictive values of the upper bound")) +
          geom_line(data = L_xy2, aes(x = x, y = y,color = "Predictive values of the lower bound")) +
          geom_line(data = U_xy1, aes(x = x, y = y,color = "Actual values of the upper bound")) +
          geom_line(data = L_xy1, aes(x = x, y = y,color = "Actual values of the lower bound")) +
          geom_line(data = U_set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = U_set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          geom_line(data = L_set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
          geom_line(data = L_set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
          scale_color_manual(name = "Label",values = colors)
        r <- ggplotly(p)
        
      }
    }
  })
  
  
  
  
  #' END
}

# Run the application 
shinyApp(ui = ui, server = server)
