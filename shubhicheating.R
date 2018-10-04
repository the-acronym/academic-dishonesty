#Shubhi Cheating Data

setwd("/Users/Parth/Desktop/R/acronym/")

library(ggplot2)
library(gridExtra)
library(googleVis)
library(plotly)
library(RColorBrewer)

shubhi.data <- read.csv("shubhicheating.csv")

#Creat bar charts
a <- ggplot(data=shubhi.data, aes(x=reorder(Class,+Percent_Yes), y=Percent_Yes, fill=Type)) + scale_color_brewer("Dark2")+
  geom_bar(stat="identity", position = position_dodge())+theme_grey()+labs(x="",y="Percent of Respondents")+theme(legend.title=element_blank())
a


p <- plot_ly(shubhi.data, x = ~reorder(Class,+Percent_Yes), y = ~Percent_Yes, type = 'bar', name = 'I have committed academic dishonesty', marker = list(color = 'rgb(194, 3, 0)'),
             hoverinfo = 'text',
             text = ~paste('<em>',Class,'who have cheated</em>','<br>Number: ', Yes,
                           '<br> Percent: ', Percent_Yes,"%")) %>%
  add_trace(y = ~PercentWould, name = 'I would commit academic dishonesty in the future',marker = list(color = 'rgb(61, 56, 53)'),hoverinfo = 'text',
            text = ~paste('<em>',Class,'who would cheat in the future</em>','<br>Number: ', YesWould,
                          '<br> Percent: ', PercentWould,"%")) %>%
  layout(title="Academic Dishonesty at IMSA",yaxis = list(title = 'Percent of Respondents',showgrid=FALSE,showline=TRUE),xaxis=list(title="",showgrid=FALSE), barmode = 'group') %>%
  layout(legend = list(x=0,y=1))%>%layout(xaxis=list(fixedrange=TRUE)) %>% layout(yaxis=list(fixedrange=TRUE))

p


#plotly_POST(sharing="public")

