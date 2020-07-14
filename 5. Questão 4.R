###Questão 4
library(dplyr)
library(ggplot2)
pSCC <- SCC[grep("[Cc][Oo][Aa][Ll]", SCC$EI.Sector), "SCC"]
pNEI <- NEI %>% filter(SCC %in% pSCC)
rdp <- pNEI %>% group_by(year) %>% summarise(Emissions = sum(Emissions))

png("plot4.png", width=480, height=480)
c_plot <- ggplot(rdp, aes(x=year, y=round(Emissions/1000,2), label=round(Emissions/1000,2), fill=year)) +
  geom_bar(stat="Identity") + 
  ylab(expression('PM'[2.5]*' Emissões por kilotonelada')) + 
  xlab("Ano") +
  geom_label(aes(fill = year),colour = "white", fontface = "bold") +
  ggtitle("Emissões por combustão de carvão de 1999 até 2008.")
print(c_plot)
dev.off()