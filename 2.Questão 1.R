###Questão 1
eta <- aggregate(Emissions ~ year, NEI, FUN = sum)
png("plot1.png", width=480, height=480)
cores <- 2:(length(eta$year)+1)
with(eta, barplot(height=Emissions/1000, names.arg = year, col = cores, 
    xlab = "Ano", ylab = expression('PM'[2.5]*' em quilotoneladas'),
    main = expression('Emissão anual (PM)'[2.5]*' de 1999 ate 2008')))
dev.off()