#Hodgkin-Huxley type model

#installing and calling the necessary toolkits
#install.packages("deSolve")
#install.packages("phaseR")
#once you've installed the two packages, you can comment out the above part
library(deSolve)
library(phaseR)

#setting up our system of differential equations
HHmodel <- function(t,y,parameters) {
  V <- y[1]
  n <- y[2]
  C <- parameters[1]
  I <- parameters[2]
  gL <- parameters[3]
  gNa <- parameters[4]
  v12a <- parameters[5]
  EL <- parameters[6]
  v12b <- parameters[7]
  ENa <- parameters[8]
  gk <- parameters[9]
  Ek <- parameters[10]
  tau <- parameters[11]
  k1 <- parameters[12]
  k2 <- parameters[13]
  dy <- numeric(2)
  dy[1] <- ((I-gL*(V-EL)-gNa*(1/1+exp((v12a-V/k1)))*V*(V-ENa))-n*(gk*(V-Ek)))/C
  dy[2] <- ((1/1+exp((v12b-V/k2)))-n)/tau
  list(dy)
}

#there's an argument for parameters...parameters = c(...)
#this is where we define the parameter values
#c(C,I,gL,gNa,v12a,EL,v12b,nn,ENa,gk,Ek,tau,k1,k2)

HHmodel.flowfield <- flowField(HHmodel,xlim = c(-100, 100),ylim = c(-200, 50),
                parameters = c(1,0,8,20,-20,-80,-25,60,10,-90,1,15,5),points = 20,add = FALSE,
                main = "Scenario A",xlab="membrane voltage, V",ylab="K+ activation variable, n")

#adding a grid to our plot
grid()

#plotting nullclines
HHmodel.nullclines <- nullclines(HHmodel, xlim = c(-100, 100), ylim = c(-200, 50),
                 parameters = c(1,0,8,20,-20,-80,-25,60,10,-90,1,15,5), points = 500,lwd=2,
                 col=c("red","blue"))

#starting points for trajectories
#(0,0)
#(10,10)
#(60,20)
#you can change this
y0 <- matrix(c(0, 0, 10, 10, 60, 20), ncol = 2, nrow = 3, byrow = TRUE)

#trajectories
HHmodel.trajectories <- trajectory(HHmodel, y0 = y0, t.end=10, tlim=c(-10,100),
                 parameters = c(1,0,8,20,1,-80,1,60,10,90,1), color=rep("black", 3))
