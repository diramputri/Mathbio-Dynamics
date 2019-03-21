import tellurium as te
from tellurium import ParameterScan as ps

r = te.loada ('''
    model pathway()

  $X -> V; ((I-gL*(V-EL)-gNa*(1/1+exp((v12a-V/k1)))*V*(V-ENa))-n*(gk*(V-Ek)))/C
  $X -> n; ((1/1+exp((v12b-V/k2)))-n)/tau

C=1
I=0
gL=8
gNa=20
EL=-80
ENa=60
gk=10
Ek=90
tau=1
v12a=-20
k1=15
v12b=-25
k2=5

end''')

result = r.simulate(0, 10, 10, ['TIME','V'])
r.plot(result)

# parameter scan for synaptic current, I

p = ps(r)

p.endTime = 10
p.numberOfPoints = 200
p.polyNumber = 10
p.startValue = 0
p.endValue = 50
#parameter to test
p.value = 'I' 
#variable you want to see affected by changing parameter
p.selection = ['V']
p.plotGraduatedArray()
