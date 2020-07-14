#####Questão 6
library(dplyr)
library(ggplot2)
lookup <- data.frame(fips = c("06037", "24510"), county = c("Los Angeles", "Baltimore"))

vSCC <- SCC[grep("[Vv]ehicle", SCC$EI.Sector), "SCC"]
ve <- NEI %>%
  filter(SCC %in% vSCC & fips %in% lookup$fips) %>%
  group_by(fips, year) %>%
  summarize(Emissions = sum(Emissions))
ve <- merge(ve, lookup)

png("plot6.png", width=480, height=480)
graf <- ggplot(ve, aes(x = factor(year), y = round(Emissions/1000, 2), label=round(Emissions/1000,2), fill = year)) +
  geom_bar(stat = "identity") + 
  facet_grid(. ~ county) +
  ylab(expression('PM'[2.5]*' Quilotoneladas de emissão')) + 
  xlab("Ano") +
  geom_label(aes(fill = year),colour = "white", fontface = "bold") +
  ggtitle("Emissão por veiculos em Los Angeles vs Baltimore.")
print(graf)
dev.off()