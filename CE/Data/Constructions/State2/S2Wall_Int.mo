within CE.Data.Constructions.State2;
record S2Wall_Int "S2Internal wall for the period 1945-1970"
  extends IDEAS.Buildings.Data.Interfaces.Construction(nLay=3, mats={
        Materials.Plaster(d=0.02),
        Materials.BrickHD(d=0.14),
        Materials.Plaster(d=0.02)});
end S2Wall_Int;
