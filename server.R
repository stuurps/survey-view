#to do
#Add current location, same as google #
#Update marker to include distance #
#Add table with N/S pointer or link to Gmaps

library(shiny)
library(leaflet)
library(shinyMobile)
library(DT)

md <- read.csv("/srv/shiny-server/survey/id_output.csv")
md <- md[2:nrow(md),]
md <- md[order(-md$row_id),]

tmp <- md
tmp$FLAG <- "0"
if(nrow(tmp) < 5){
    tmp$FLAG <- "1"
} else {
tmp$FLAG[1:5,] <- "1"
}

icons <- awesomeIcons(icon = "whatever",
                      iconColor = "black",
                      library = "ion",
                      markerColor = tmp$FLAG)

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
    
    output$mytable = DT::renderDataTable({md
    })
    
    
    # # Create the map
    output$map <- renderLeaflet({
        leaflet(data = md) %>% addTiles() %>%
            addTiles(
                urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
                attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>') %>%
            addAwesomeMarkers(~lng, ~lat, popup = ~as.character(id), label = ~as.character(id), icon = icons)
            
    })
    
    

    })


