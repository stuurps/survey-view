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
            subtitle = f7Link(
                label = "Submit an ID",
                src = "https://treesurvey.online/shiny/tree-survey",
                external = T
            ),
            hairline = F,
            shadow = T
        ),
        
        DT::dataTableOutput("mytable"),
        leafletOutput("map"),
        
        #leafletOutput("map"),
        #tags$style(type = "text/css", "#map {height: calc(100vh - 80px) !important;}"),
        
        toolbar = f7Toolbar(
            position = "bottom",
            f7Link(
                label = "Trees of Bristol",
                src = "https://bristoltrees.space/Tree/",
                external = T
            ),
            f7Link(
                label = "Bristol Tree Forum",
                src = "https://bristoltreeforum.org/",
                external = T
            )
        )
        
    )#,
    
    #f7BlockFooter(text = "For more information please contact..")
    
))