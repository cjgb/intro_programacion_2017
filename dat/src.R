K <- 1234
n1 <- 1

r <- 0.13

t <- 0:80

res <- K / (1 + ( (K/n1) - 1) * exp(-r*t))

res <- res + rnorm(length(res), mean = 0, sd = 10)

#plot(res, type = "l")

out <- data.frame(t = t, obs = res)

write.table(out, file = "datos_ejercicio_ode_01.txt", sep = "\t", row.names = F, col.names = T)

writeLines(text = as.character(res), con = "datos_ejercicio_ode_01.txt")



res2 <- rnorm(155, mean = 0, sd = 10)
res2 <- c(res2, res)

out <- data.frame(t = 1:length(res2), obs = res2)
write.table(out, file = "datos_ejercicio_ode_02.txt", sep = "\t", row.names = F, col.names = T)
