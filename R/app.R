# Run your app.R to load the GUI

run_app <- function(){

  shiny::shinyApp(ui, server, options = list(launch.browser = TRUE))

}
