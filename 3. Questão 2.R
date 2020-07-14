###Questão 2
library(dplyr)
et <- NEI %>%
    filter(fips == "24510") %>%
        group_by(year) %>%
            summarise(Emissions = sum(Emissions))
png("plot2.png", width=480, height=480)

with(et,barplot(height=Emissions/1000, names.arg = year, col = cores, 
             xlab = "Year", ylab = expression('PM'[2.5]*' em quilotoneladas'),
             main = expression('Baltimore, Maryland Emissions de 1999 ate 2008')))
dev.off()