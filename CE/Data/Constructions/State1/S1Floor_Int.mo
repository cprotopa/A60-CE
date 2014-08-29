within CE.Data.Constructions.State1;
model S1Floor_Int "S1 Internal floor for the period after 2007"
  extends IDEAS.Buildings.Data.Interfaces.Construction(nLay=4, mats={
        Materials.Tile(d=0.02),
        Materials.Screed(d=0.06),
        Materials.Concrete(d=0.2),
        Materials.Plaster(d=0.02)});

  //Be carefull with the heat ports, here the exterior is the upper floor

end S1Floor_Int;
