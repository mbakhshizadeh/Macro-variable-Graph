
shinyServer(
  
  function(input, output){
    
    output$MyPlot<- renderChart2({
      ###################################################

      ####

      ####
    
      ######################################################
      IndicatorType=input$indicator
      
      if(IndicatorType=="Export"){
        Export <- wb(country = c("CAN","MEX","USA"),indicator = "TX.VAL.MRCH.XD.WD", startdate = 2000, enddate = 2019)
        Export=Export[order(Export$date),]
        p1=nPlot(value~date, group="iso3c", data=Export,type = "multiBarChart")

      } else if (IndicatorType=="Population(Millions)"){
        pop_data <- wb(country = c("CAN","MEX","USA"),indicator = "SP.POP.TOTL", startdate = 2000, enddate = 2019)
        pop_data=pop_data[order(pop_data$date),]
        value2=pop_data$value/1000000
        pop_data["value"]=value2
        p1=nPlot(value~date, group="iso3c", data=pop_data,type = "multiBarChart")

      }else{
        GDP <- as.data.frame(wb(country = c("CAN","MEX","USA"),indicator = "NY.GDP.MKTP.CD", startdate = 2000, enddate = 2019))
        GDP=GDP[order(GDP$date),]
        value1=GDP$value/1000000000
        GDP["value"]=value1
        p1=nPlot(value~date, group="iso3c", data=GDP,type = "multiBarChart")

      }

    return(p1)
    })
    ############################################
    output$MyPlot2<- renderPlot({
      
      P_mortgage_rate <- as.data.frame(wb(country = c("CAN","MEX","USA"),indicator = "FR.INR.LEND", startdate = 1990, enddate = 2019))
      names(P_mortgage_rate)[1]<- "Country" # changin the name of firs col.
      
      
      theme_update(plot.title = element_text(hjust = 0.5))# centerize the title
      p2=ggplot(P_mortgage_rate, aes(date,value,group=Country,col=Country)) + 
        geom_line()+xlab("Year") + ylab("Percentage") + ggtitle("Prime Mortgage Rate")
      
      print(p2)
    })

  
})

