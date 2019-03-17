% Plotting nullclines for a 2D Hodkin-Huxley type model

%%% setting up nullcline equations and our parameter space %%%

% constants from Figure 4.1
C=1;
I=0;
gL=8;
gNa=20;
mm=1;
EL=-80;
nn=1;
ENa=60;
gk=10;
Ek=-90;

syms n V
nullcline_n=nn*V;
nullcline_V=(I-gL*(V-EL)-gNa*mm*V*(V-ENa))/(gk*(V-Ek));

[X, Y] = meshgrid(0:1:100,0:1:60);
nullN = subs(nullcline_n, [n V], {X,Y});
nullV = subs(nullcline_V, [n V], {X,Y});

plot(nullN)
hold on
plot(nullV)
hold on