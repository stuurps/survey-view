#to do
#Add current location, same as google #
#Update marker to include distance #
#Add table with N/S pointer or link to Gmaps

library(shiny)
library(leaflet)
library(shinyMobile)

md <- read.csv("/srv/shiny-server/survey/id_output.csv")
#md <- read.csv("/Users/stuartbarker/Documents/survey/id_output.csv")

md <- md[1:nrow(md),]
md <- md[order(-md$row_id),]

md$FLAG <- "0"
if(nrow(md) < 5){
    md$FLAG <- "1"
} else {
md$FLAG[1:5,] <- "1"
}

md$lbl <- paste0("<b>", md$id,"</b><br>", md$notes, "<br>", md$time, "<br>"," survey id: ",md$row_id)


icons <- awesomeIcons(icon = "whatever",
                      iconColor = "black",
                      library = "ion",
                      markerColor = md$FLAG)

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
    
    # # Create the map
    output$map <- renderLeaflet({
        leaflet(data = md) %>% addTiles() %>%
            addTiles(
                urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
                attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>') %>%
            addAwesomeMarkers(~lng, ~lat, popup = ~lbl, #label = ~as.character(id), 
                              icon = icons)
            
    })
    
    

    })


