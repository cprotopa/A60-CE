within CE.Data.Constructions.State1;
model S1Floor_Int "S1 Internal floor for the period after 2007"
  extends IDEAS.Buildings.Data.Interfaces.Construction(nLay=4, mats={
        CE.Data.Materials.Tile(d=0.02),
        CE.Data.Materials.Screed(d=0.06),
        CE.Data.Materials.Concrete(d=0.2),
        CE.Data.Materials.Plaster(d=0.02)});

  //Be carefull with the heat ports, here the exterior is the upper floor

end S1Floor_Int;
