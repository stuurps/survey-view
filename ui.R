#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinyMobile)
library(leaflet)
library(DT)

# Define UI
shinyUI(f7Page(
    theme = "dark",
    f7SingleLayout(
        navbar = f7Navbar(
            title = "Tree Survey",
            subtitle = a("Get In Touch", href = "mailto:thetreeid@gmail.com"),
            hairline = F,
            shadow = T
        ),

        leafletOutput("map"),
        tags$style(type = "text/css", "#map {height: calc(100vh - 80px) !important;}"),
        
        #leafletOutput("map"),
        #tags$style(type = "text/css", "#map {height: calc(100vh - 80px) !important;}"),
        
        toolbar = f7Toolbar(
            position = "bottom",
            f7Link(
                label = "Home",
                src = "https://thetreeid.com/",
                external = T
            ),
            f7Link(
                label = "Survey",
                src = "https://thetreeid.com/shiny/survey",
                external = T
            )
        )
        
    )#,
    
    #f7BlockFooter(text = "For more information please contact..")
    
))
