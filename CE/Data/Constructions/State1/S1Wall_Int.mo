within CE.Data.Constructions.State1;
model S1Wall_Int "S1 Internal wall for the period after 2007"
  extends IDEAS.Buildings.Data.Interfaces.Construction(nLay=3, mats={
        Materials.Plaster(d=0.02),
        Materials.BrickHD(d=0.10),
        Materials.Plaster(d=0.02)});
end S1Wall_Int;
