within CE.Data.Constructions.State2;
record S2Floor_Int "S2 Internal floor for the period 1945-1970"
  extends IDEAS.Buildings.Data.Interfaces.Construction(nLay=4, mats={
        Materials.WoodFloor(d=0.02),
        Materials.Screed(d=0.08),
        Materials.Concrete(d=0.2),
        Materials.Plaster(d=0.02)});

  //Be carefull with the heat ports, here the exterior is the upper floor

end S2Floor_Int;
