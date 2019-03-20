#Lotka-Volterra Model

#installing and calling the necessary toolkits
install.packages(deSolve)
install.packages("phaseR")
#once you've installed the two packages, you can comment out the above part
library(deSolve)
library(phaseR)

#setting up our system of differential equations
LVmodel <- function(t,y,parameters) {
  x <- y[1]
  y <- y[2]
  alpha <- parameters[1]
  beta <- parameters[2]
  delta <- parameters[3]
  gamma <- parameters[4]
  dy <- numeric(2)
  dy[1] <- alpha*x - beta*x*y
  dy[2] <- delta*x*y - gamma*y
  list(dy)
}

LVmodel.flowfield <- flowField(LVmodel,xlim = c(-10, 10),ylim = c(-10, 10),
                               parameters = c(10,5,3,7),points = 20,add = FALSE,
                               main = "Predator-Prey Model",xlab="Prey",ylab="Predator")

LVmodel.nullclines <- nullclines(LVmodel,xlim = c(-10, 10),ylim = c(-10, 10),
                                 parameters = c(10,5,3,7),points = 20,lwd=2,
                                 col=c("red","blue"))
