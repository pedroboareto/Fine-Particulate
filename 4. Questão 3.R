###Questão 3
library(dplyr)
library(ggplot2)
em <- NEI %>%
  filter(fips == "24510") %>%
  group_by(year, type) %>%
  summarise(Emissions=sum(Emissions))

png("plot3.png", width=480, height=480)
graf <- ggplot(data = em, aes(x = factor(year), y = Emissions, fill = type, colore = "black")) +
        geom_bar(stat = "identity") + 
        facet_grid(. ~ type) + 
        xlab("Ano") + 
        ylab(expression('PM'[2.5]*' Emissão')) +
        ggtitle("Emissão por tipo de fonte em Baltimore") 
print(graf)

dev.off()