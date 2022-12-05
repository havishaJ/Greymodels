# Define UI for application

#' @importFrom plotly plotlyOutput

ui <- function(){

  dashboardPage(skin = "blue",
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

                    menuItem("Help", tabName = "menu_5"
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
                                       "The Greymodels package is an interactive interface for statistical modelling and forecasting using grey-based models.
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
                                       title = "Parameters Estimation", width = NULL, solidHeader = TRUE, status = "primary",collapsible = TRUE,collapsed = TRUE,
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

                    tabItem(tabName = "menu_5",
                            fluidRow(
                              h1("Documentation and Usage of the Models"),
                              fluidRow(
                                box(
                                  title = "GM (1, 1) model and improved background values", width = 6, solidHeader = TRUE, status = "primary",
                                  collapsible = TRUE,collapsed = TRUE,

                                  h4("Usage"),
                                  code("gm11(x0)"),",",
                                  code("epgm11(x0)"),",",
                                  code("tbgm11(x0)"),",",
                                  code("igm11(x0)"),",",
                                  code("gm114(x0)"),

                                  h4("Arguments"),
                                  p(code("gm11"), "Basic grey model"),
                                  p(code("epgm11"), "Extrapolation-based grey model"),
                                  p(code("tbgm11"), "Data transformation-based grey model"),
                                  p(code("igm11"), "Improved grey model"),
                                  p(code("gm114"), "Grey model with single variable, one first-order variable, four background values"),
                                  p(code("x0"), "Raw data"),

                                  h4("Examples (Test case(s))"),
                                  p("The", code("gm11"), "function implements the", strong("GM (1, 1) model"), "which takes input values"),
                                  code("x0 = (2350, 2465, 2557, 2577, 2689, 2739, 2797, 2885, 2937, 2996)"),
                                  code("gm11(x0)"),

                                  p("The", code("epgm11"), "function implements the", strong("EPGM (1, 1) model"), "which takes input values"),
                                  code("x0 = (2350, 2465, 2557, 2577, 2689, 2739, 2797, 2885, 2937, 2996)"),
                                  code("epgm11(x0)"),

                                  p("The", code("tbgm11"), "function implements the", strong("TBGM (1, 1) model"), "which takes input values"),
                                  code("x0 = (2350, 2465, 2557, 2577, 2689, 2739, 2797, 2885, 2937, 2996)"),
                                  code("tbgm11(x0)"),

                                  p("The", code("igm11"), "function implements the", strong("IGM (1, 1) model"), "which takes input values"),
                                  code("x0 = (2350, 2465, 2557, 2577, 2689, 2739, 2797, 2885, 2937, 2996)"),
                                  code("igm11(x0)"),

                                  p("The", code("gm114"), "function implements the", strong("GM (1, 1, 4) model"), "which takes input values"),
                                  code("x0 = (2350, 2465, 2557, 2577, 2689, 2739, 2797, 2885, 2937, 2996)"),
                                  code("gm114(x0)")
                                ),

                                box(
                                  title = "Extended forms of grey models", width = 6, solidHeader = TRUE, status = "primary",
                                  collapsible = TRUE,collapsed = TRUE,

                                  h4("Usage"),
                                  code("dgm11(x0)"),",",
                                  code("dgm21(x0)"),",",
                                  code("odgm21(x0)"),",",
                                  code("ndgm11(x0)"),",",
                                  code("vssgm11(x0)"),",",
                                  code("gom11(x0)"),",",
                                  code("gomia11(x0)"),",",
                                  code("ungom11(x0)"),",",
                                  code("exgm11(x0)"),",",
                                  code("egm11(k,x0)"),

                                  h4("Arguments"),
                                  p(code("dgm11"), "Discrete grey model with single variable, first order differential equation"),
                                  p(code("dgm21"), "Discrete grey model with single variable, second order differential equation model"),
                                  p(code("odgm21"), "Optimized discrete grey model with single variable, second order differential equation"),
                                  p(code("ndgm11"), "Non-homogeneous discrete grey model"),
                                  p(code("vssgm11"), "Variable speed and adaptive structure-based grey model"),
                                  p(code("gom11"), "Grey opposite-direction model based on inverse accumulation and traditional interpolation method"),
                                  p(code("gomia11"), "Grey opposite-direction model based on inverse accumulation"),
                                  p(code("ungom11"), "Unbiased grey opposite-direction model based on inverse accumulation"),
                                  p(code("exgm11"), "Exponential grey model"),
                                  p(code("egm11"), "Extended grey model"),
                                  p(code("x0"), "Raw data"),
                                  p(code("k"), "Data index of raw data"),

                                  h4("Examples (Test case(s))"),
                                  p("The", code("dgm11"), "function implements the", strong("DGM (1, 1) model"), "which takes input values"),
                                  code("x0 = (1205, 1213, 1221, 1228, 1234, 1240, 1244, 1247, 1250, 1252, 1256, 1259, 1261, 1263)"),";",
                                  code("dgm11(x0)"),

                                  p("The", code("dgm21"), "function implements the", strong("DGM (2, 1) model"), "which takes input values"),
                                  code("x0 = (2028, 2066, 2080, 2112, 2170, 2275, 2356, 2428)"),";",
                                  code("dgm21(x0)"),

                                  p("The", code("odgm21"), "function implements the", strong("ODGM (2, 1) model"), "which takes input values"),
                                  code("x0 = (2028, 2066, 2080, 2112, 2170, 2275, 2356, 2428)"),";",
                                  code("odgm21(x0)"),

                                  p("The", code("ndgm11"), "function implements the", strong("NDGM (1, 1) model"), "which takes input values"),
                                  code("x0 = (1205, 1213, 1221, 1228, 1234, 1240, 1244, 1247, 1250, 1252, 1256, 1259, 1261, 1263)"),";",
                                  code("ndgm11(x0)"),

                                  p("The", code("vssgm11"), "function implements the", strong("VSSGM (1, 1) model"), "which takes input values"),
                                  code("x0 = (15.1, 17.8, 19.5, 23.6, 24.9, 29.4, 35.8, 39.4, 44.2, 46.7, 48.7, 48.9, 50.7, 50.1, 49.2, 47.4)"),
                                  ";",
                                  code("vssgm11(x0)"),

                                  p("The", code("gom11"), "function implements the", strong("GOM (1, 1) model"), "which takes input values"),
                                  code("x0 = (1440.1, 1391.2, 1309.8, 1205.5, 1099.2, 1042, 980.7, 911.2, 904.3, 876.2, 875.7, 832.1)"),";",
                                  code("gom11(x0)"),

                                  p("The", code("gomia11"), "function implements the", strong("GOM_IA (1, 1) model"), "which takes input values"),
                                  code("x0 = (1440.1, 1391.2, 1309.8, 1205.5, 1099.2, 1042, 980.7, 911.2, 904.3, 876.2, 875.7, 832.1)"),";",
                                  code("gomia11(x0)"),

                                  p("The", code("ungom11"), "function implements the", strong("unbiased GOM (1, 1) model"), "which takes input values"),
                                  code("x0 = (1440.1, 1391.2, 1309.8, 1205.5, 1099.2, 1042, 980.7, 911.2, 904.3, 876.2, 875.7, 832.1)"),";",
                                  code("ungom11(x0)"),

                                  p("The", code("exgm11"), "function implements the", strong("EXGM (1, 1) model"), "which takes input values"),
                                  code("x0 = (2028, 2066, 2080, 2112, 2170, 2275, 2356, 2428)"),";",
                                  code("exgm11(x0)"),

                                  p("The", code("egm11"), "function implements the", strong("EGM (1, 1) model"), "which takes input values"),
                                  p("In-Sample Data:"),
                                  code("k = (170, 210, 310, 340)"),";",
                                  code("x0 = (536.1, 516.1, 467.4, 453.8)"),
                                  p("Out-Sample Data:"),
                                  code("k = (170, 210, 310, 340, 100, 130, 240, 270)"),";",
                                  code("x0 = (536.1, 516.1, 467.4, 453.8, 560, 557.54, 486.1, 436.4)"),";",
                                  code("egm11(k,x0)"),
                                ),

                                box(
                                  title = "Combined models", width = 6, solidHeader = TRUE, status = "primary",
                                  collapsible = TRUE,collapsed = TRUE,

                                  h4("Usage"),
                                  code("ngbm11(x0)"),",",
                                  code("ggvm11(x0)"),",",
                                  code("tfdgm11(x0)"),

                                  h4("Arguments"),
                                  p(code("ngbm11"), "Non-linear grey Bernoulli model"),
                                  p(code("ggvm11"), "Grey generalized Verhulst model"),
                                  p(code("tfdgm11"), "Traffic flow mechanics grey model"),

                                  h4("Examples (Test case(s))"),
                                  p("The", code("ngbm11"), "function implements the", strong("NDGM (1, 1) model"), "which takes input values"),
                                  code("x0 = (129, 151, 132, 144, 119, 125, 127, 132)"),";",
                                  code("ngbm11(x0)"),

                                  p("The", code("ggvm11"), "function implements the", strong("GGVM (1, 1) model"), "which takes input values"),
                                  code("x0 = (1.0, 1.5, 2.2, 2.6, 2.4, 5.3, 3.5, 5.1, 5.6, 6.4, 5.4, 5.9, 6.8, 5.5, 5.8)"),";",
                                  code("ggvm11(x0)"),

                                  p("The", code("tfdgm11"), "function implements the", strong("TFDGM (1, 1) model"), "which takes input values"),
                                  code("x0 = (129, 151, 132, 144, 119, 125, 127, 132)"),";",
                                  code("tfdgm11(x0)"),

                                ),

                                box(
                                  title = "Parameters estimation", width = 6, solidHeader = TRUE, status = "primary",
                                  collapsible = TRUE,collapsed = TRUE,

                                  h4("Usage"),
                                  code("sogm21(x0)"),",",
                                  code("ngm11k(x0)"),",",
                                  code("ngm11kc(x0)"),",",
                                  code("ongm11kc(x0)"),

                                  h4("Arguments"),
                                  p(code("sogm21"), "Structured optimized grey model with single variable and second order differential equation"),
                                  p(code("ngm11k"), "Nonlinear grey model"),
                                  p(code("ngm11kc"), "Nonlinear grey model"),
                                  p(code("ongm11kc"), "Optimized nonlinear grey model"),

                                  h4("Examples (Test case(s))"),
                                  p("The", code("sogm21"), "function implements the", strong("SOGM (2, 1) model"), "which takes input values"),
                                  code("x0 = (1.9892, 2.1702, 2.3266, 2.4332, 2.4525)"),";",
                                  code("sogm21(x0)"),

                                  p("The", code("ngm11k"), "function implements the", strong("NGM (1, 1, k) model"), "which takes input values"),
                                  code("x0 = (14.6, 23.2, 28.7, 38.3, 44.7, 53.3, 62.5, 74.8, 82.9, 87, 95.2, 103.2, 118.2, 121.7, 130.9, 139.5, 143.6)"),";",
                                  code("ngm11k(x0)"),

                                  p("The", code("ngm11kc"), "function implements the", strong("NGM (1, 1, k, c) model"), "which takes input values"),
                                  code("x0 = (14.6, 23.2, 28.7, 38.3, 44.7, 53.3, 62.5, 74.8, 82.9, 87, 95.2, 103.2, 118.2, 121.7, 130.9, 139.5, 143.6)"),";",
                                  code("ngm11kc(x0)"),

                                  p("The", code("ongm11kc"), "function implements the", strong("ONGM (1, 1, k, c) model"), "which takes input values"),
                                  code("x0 = (14.6, 23.2, 28.7, 38.3, 44.7, 53.3, 62.5, 74.8, 82.9, 87, 95.2, 103.2, 118.2, 121.7, 130.9, 139.5, 143.6)"),";",
                                  code("ongm11kc(x0)"),


                                ),

                                box(
                                  title = "Optimization-based grey models", width = 6, solidHeader = TRUE, status = "primary",
                                  collapsible = TRUE,collapsed = TRUE,

                                  h4("Usage"),
                                  code("psogm11(x0)"),",",
                                  code("andgm11(x0)"),",",
                                  code("egm11r(x0)"),

                                  h4("Arguments"),
                                  p(code("psogm11"), "Particle swarm optimization-based grey model"),
                                  p(code("andgm11"), "Adjacent non-homogeneous discrete grey model"),
                                  p(code("egm11r"), "Even form of grey model with one variable and one first order equation
                                      with accumulating generation of order r"),

                                  h4("Examples (Test case(s))"),
                                  p("The", code("psogm11"), "function implements the", strong("PSO-GM (1, 1) model"), "which takes input values"),
                                  code("x0 = (2.8, 3.8, 4.6, 5.2, 5.7, 6.0, 6.2, 6.92, 7.77, 8.92, 10.06)"),";",
                                  code("psogm11(x0)"),

                                  p("The", code("andgm11"), "function implements the", strong("ANDGM (1, 1) model"), "which takes input values"),
                                  code("x0 = (2.8, 3.8, 4.6, 5.2, 5.7, 6.0, 6.2, 6.92, 7.77, 8.92, 10.06)"),";",
                                  code("andgm11(x0)"),

                                  p("The", code("egm11r"), "function implements the", strong("EGM (1, 1, r) model"), "which takes input values"),
                                  code("x0 = (2.8, 3.8, 4.6, 5.2, 5.7, 6.0, 6.2, 6.92, 7.77, 8.92, 10.06)"),";",
                                  code("egm11r(x0)"),


                                ),

                                box(
                                  title = "Residual modification", width = 6, solidHeader = TRUE, status = "primary",
                                  collapsible = TRUE,collapsed = TRUE,

                                  h4("Usage"),
                                  code("remnantgm11(x0)"),",",
                                  code("tgm11(x0)"),

                                  h4("Arguments"),
                                  p(code("remnantgm11"), "Residual-based grey model"),
                                  p(code("tgm11"), "Trigonometric grey model"),

                                  h4("Examples (Test case(s))"),
                                  p("The", code("remnantgm11"), "function implements the", strong("Remnant GM (1, 1) model"), "which takes input values"),
                                  p("In-Sample Data:"),
                                  code("x0 = (2350, 2465, 2557, 2577, 2689, 2739, 2797, 2885, 2937, 2996)"),
                                  p("Out-Sample Data:"),
                                  code("x0 = (2350, 2465, 2557, 2577, 2689, 2739, 2797, 2885, 2937, 2996, 3042, 3120, 3132, 3237)"),";",
                                  code("remnantgm11(x0)"),

                                  p("The", code("tgm11"), "function implements the", strong("TGM (1, 1) model"), "which takes input values"),
                                  p("In-Sample Data:"),
                                  code("x0 = (2350, 2465, 2557, 2577, 2689, 2739, 2797, 2885, 2937, 2996)"),
                                  p("Out-Sample Data:"),
                                  code("x0 = (2350, 2465, 2557, 2577, 2689, 2739, 2797, 2885, 2937, 2996, 3042, 3120, 3132, 3237)"),";",
                                  code("tgm11(x0)"),


                                ),

                                box(
                                  title = "Multivariate sequences", width = 6, solidHeader = TRUE, status = "primary",
                                  collapsible = TRUE,collapsed = TRUE,

                                  h4("Usage"),
                                  code("gm13(x1,x2,x3)"),",",
                                  code("igm13(x1,x2,x3)"),",",
                                  code("nhmgm1(x01,x02)"),",",
                                  code("nhmgm2(x01,x02)"),",",
                                  code("gmcg12(x01,x02)"),",",
                                  code("gmc12(x01,x02)"),",",
                                  code("dbgm12(x01,x02)"),

                                  h4("Arguments"),
                                  p(code("gm13"), "Grey multivariate model with first order differential equation and 3 variables"),
                                  p(code("igm13"), "Improved grey multivariate model with first order differential equation and 3 variables"),
                                  p(code("nhmgm1"), "Non-homogeneous multivariate grey model with first order differential equation and 2 variables with p = 1"),
                                  p(code("nhmgm2"), "Non-homogeneous multivariate grey model with first order differential equation and 2 variables with p = 2"),
                                  p(code("gmcg12"), "Multivariate grey convolution model with first order differential equation and
                                      2 variables using the Gaussian rule"),
                                  p(code("gmc12"), "Multivariate grey convolution model with first order differential equation and
                                      2 variables using the trapezoidal rule"),
                                  p(code("dbgm12"), "Multivariate grey model with dynamic background value, first order differential
                                      equation and 2 variables using the Gaussian rule"),


                                  h4("Examples (Test case(s))"),
                                  p("The", code("gm13"), "function implements the", strong("GM (1, 3) model"), "which takes input values"),
                                  code("x1 = (21198.56, 23358.15, 26931.32, 28570.71, 33900.91, 32511.61, 39007.39, 42525.13, 48116.08, 52018.51)"),";",
                                  br(),
                                  code("x2 = (219438.5, 270092.3, 319244.6, 348517.7, 412119.3, 487940.2, 538580.0, 592963.2, 641280.6, 685992.9)"),";",
                                  br(),
                                  code("x3 = (131448, 132129, 132802, 133450, 134091, 134735, 135404, 136072, 136782, 137462)"),";",
                                  br(),
                                  code("gm13(x1,x2,x3)"),

                                  p("The", code("igm13"), "function implements the", strong("IGM (1, 3) model"), "which takes input values"),
                                  code("x1 = (21198.56, 23358.15, 26931.32, 28570.71, 33900.91, 32511.61, 39007.39, 42525.13, 48116.08, 52018.51)"),";",
                                  br(),
                                  code("x2 = (219438.5, 270092.3, 319244.6, 348517.7, 412119.3, 487940.2, 538580.0, 592963.2, 641280.6, 685992.9)"),";",
                                  br(),
                                  code("x3 = (131448, 132129, 132802, 133450, 134091, 134735, 135404, 136072, 136782, 137462)"),";",
                                  br(),
                                  code("igm13(x1,x2,x3)"),

                                  p("The", code("nhmgm1"), "function implements the", strong("NHMGM_1 (1, 2) model"), "which takes input values"),
                                  code("x01 = (4.5, 11, 29, 82, 238)"),";",
                                  br(),
                                  code("x02 = (5, 10.5, 28, 80, 235)"),";",
                                  br(),
                                  code("nhmgm1(x01,x02)"),

                                  p("The", code("nhmgm2"), "function implements the", strong("NHMGM_2 (1, 2) model"), "which takes input values"),
                                  code("x01 = (4.5, 11, 29, 82, 238)"),";",
                                  br(),
                                  code("x02 = (5, 10.5, 28, 80, 235)"),";",
                                  br(),
                                  code("nhmgm2(x01,x02)"),

                                  p("The", code("gmcg12"), "function implements the", strong("GMC_g (1, 2) model"), "which takes input values"),
                                  p("In-Sample Data:"),
                                  code("x01 = (897, 897, 890, 876, 848,814)"),";",
                                  br(),
                                  code("x02 = (514, 495, 444, 401, 352, 293)"),";",
                                  p("Out-Sample Data:"),
                                  code("x02 = (514, 495, 444, 401, 352, 293, 269, 235, 201, 187)"),";",
                                  br(),
                                  code("gmcg12(x01,x02)"),

                                  p("The", code("gmc12"), "function implements the", strong("GMC (1, 2) model"), "which takes input values"),
                                  p("In-Sample Data:"),
                                  code("x01 = (897, 897, 890, 876, 848,814)"),";",
                                  br(),
                                  code("x02 = (514, 495, 444, 401, 352, 293)"),";",
                                  p("Out-Sample Data:"),
                                  code("x02 = (514, 495, 444, 401, 352, 293, 269, 235, 201, 187)"),";",
                                  br(),
                                  code("gmc12(x01,x02)"),


                                  p("The", code("dbgm12"), "function implements the", strong("DBGM (1, 2) model"), "which takes input values"),
                                  p("In-Sample Data:"),
                                  code("x01 = (9.42, 12.35, 13.54, 18.04, 20.02, 23.55, 26.72, 34.67, 38.55)"),";",
                                  br(),
                                  code("x02 = (8.56, 16.53, 19.64, 21.02, 23.69, 24.72, 30.12, 33.97, 39.29)"),";",
                                  p("Out-Sample Data:"),
                                  code("x02 = (8.56, 16.53, 19.64, 21.02, 23.69, 24.72, 30.12, 33.97, 39.29, 42.65, 48.66, 52.62, 60.66, 64.99)"),";",
                                  br(),
                                  code("dbgm12(x01,x02)"),

                                ),

                                box(
                                  title = "Multivariate interval sequence", width = 6, solidHeader = TRUE, status = "primary",
                                  collapsible = TRUE,collapsed = TRUE,

                                  h4("Usage"),
                                  code("igndgm12(LB,UB)"),",",
                                  code("mdbgm12(x01L,x01U,x02L,x02U,x01La,x01Ua,x02La,x02Ua)"),

                                  h4("Arguments"),
                                  p(code("LB, UB"), "Lower and upper bound of interval sequence"),
                                  p(code("x01L,x01U"), "Lower and upper bound of first interval sequence (training set)"),
                                  p(code("x02L,x02U"), "Lower and upper bound of second interval sequence (training set)"),
                                  p(code("x01La,x01Ua"), "Lower and upper bound of first interval sequence (testing set)"),
                                  p(code("x02La,x02Ua"), "Lower and upper bound of second interval sequence (testing set)"),
                                  p(code("igndgm12"), "Interval grey number sequence based on non-homogeneous discrete grey model"),
                                  p(code("mdbgm12"), "Multivariate grey model based on dynamic background algorithm"),

                                  h4("Examples (Test case(s))"),
                                  p("The", code("igndgm12"), "function implements the", strong("IG-NDGM (1, 2) model"), "which takes input values"),
                                  code("LB = (12.30, 6.20, 16.20, 10.10, 18.20)"),";",
                                  br(),
                                  code("UB = (22.50, 16.40, 26.60, 20.30, 28.60)"),";",
                                  br(),
                                  code("igndgm12(LB,UB)"),

                                  p("The", code("mdbgm12"), "function implements the", strong("MDBGM (1, 2) model"), "which takes input values"),
                                  p("In-Sample Data:"),
                                  code("x01L = (2721, 3136, 3634, 3374, 3835, 3595, 3812, 4488)"),";",br(),
                                  code("x01U = (3975, 4349, 4556, 5103, 5097, 5124, 5631, 6072)"),";",br(),
                                  code("x02L = (24581, 30070, 36656, 36075, 42173, 42074, 45537, 55949)"),";",br(),
                                  code("x02U = (41731, 49700, 55567, 61684, 68295, 68342, 73989, 78194)"),";",
                                  p("Out-Sample Data:"),
                                  code("x01La = (2721, 3136, 3634, 3374, 3835, 3595, 3812, 4488, 4557, 5560, 5986, 6253)"),";",br(),
                                  code("x01Ua = (3975, 4349, 4556, 5103, 5097, 5124, 5631, 6072, 6521, 7251, 7694,8544)"),";",br(),
                                  code("x02La = (24581, 30070, 36656, 36075, 42173, 42074, 45537, 55949, 66261, 77235, 71722, 79585)"),";",br(),
                                  code("x02Ua = (41731, 49700, 55567, 61684, 68295, 68342, 73989, 78194, 83137, 84256, 91723, 97522)"),";",
                                  br(),
                                  code("mdbgm12(x01L,x01U,x02L,x02U,x01La,x01Ua,x02La,x02Ua)"),



                                )

                              ),
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
                              h1("Parameters Estimation of Grey Models"),
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
                              h1("Optimization-based Grey Models"),
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
                                                  title = "Actual and Fitted Data", width = NULL,height = 900, solidHeader = TRUE,
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
                                tabPanel(title = "Plots",
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

}
