import tellurium as te
import roadrunner
import antimony

r = te.loada ('''
    model pathway()

  $X -> V; ((I-gL*(V-EL)-gNa*mm*V*(V-ENa))-n*(gk*(V-Ek)))/C
  $X -> n; (nn-n)/tau

C=1
I=0
gL=8
gNa=20
mm=1
EL=-80
nn=1
ENa=60
gk=10
Ek=90
tau=1

end''')

result = r.simulate(0, 10, 10, ['TIME','V'])
r.plot(result)
