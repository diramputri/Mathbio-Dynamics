#Hodgkin-Huxley type model

#install.packages(deSolve)
#install.packages("phaseR")
library(deSolve)
library(phaseR)

HHmodel <- function(t,y,parameters) {
  V <- y[1]
  n <- y[2]
  C <- parameters[1]
  I <- parameters[2]
  gL <- parameters[3]
  gNa <- parameters[4]
  mm <- parameters[5]
  EL <- parameters[6]
  nn <- parameters[7]
  ENa <- parameters[8]
  gk <- parameters[9]
  Ek <- parameters[10]
  tau <- parameters[11]
  dy <- numeric(2)
  dy[1] <- ((I-gL*(V-EL)-gNa*mm*V*(V-ENa))-n*(gk*(V-Ek)))/C
  dy[2] <- (nn-n)/tau
  list(dy)
}

HHmodel.flowfield <- flowField(HHmodel,xlim = c(0, 100),ylim = c(-50, 20),
                parameters = c(1,0,8,20,1,-80,1,60,10,90,1),points = 19,add = FALSE,
                main = "Neuron Firing Dynamics")

grid()

HHmodel.nullclines <- nullclines(HHmodel, xlim = c(0, 100), ylim = c(-50, 20),
                 parameters = c(1,0,8,20,1,-80,1,60,10,90,1), points = 500,lwd=2,
                 col=c("red","blue"))

y0 <- matrix(c(0, 0, 10, 10, 60, 20), ncol = 2, nrow = 3, byrow = TRUE)

HHmodel.trajectories <- trajectory(HHmodel, y0 = y0, t.end=10, tlim=c(-10,100),
                 parameters = c(1,0,8,20,1,-80,1,60,10,90,1), color=rep("black", 3))

## numerical iterations
## varying the synaptic current

# time series plot
