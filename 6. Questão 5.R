###Questão 5
library(dplyr)
library(ggplot2)

Em<-NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
Ema <- summarise(group_by(Em, year), Emissions=sum(Emissions))

png("plot5.png", width=480, height=480)
ggplot(Ema, aes(x=factor(year), y=Emissions,fill=year, label = round(Emissions,2))) +
  geom_bar(stat="identity") +
  xlab("Ano") +
  ylab(expression("total PM"[2.5]*"Emissão em quilotoneladas")) +
  ggtitle("Emissão de veiculos em Baltimore de 1999 a 2008")+
  geom_label(aes(fill = year),colour = "white", fontface = "bold")
dev.off()