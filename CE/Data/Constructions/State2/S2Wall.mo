within CE.Data.Constructions.State2;
model S2Wall "S2 Exterior wall for the period 1945-1970"

  extends IDEAS.Buildings.Data.Interfaces.Construction(nLay=4, mats={
        Materials.BrickHD(d=0.08),
        Materials.CavityHor(),
        Materials.BrickHD(d=0.14),
        Materials.Plaster()});
end S2Wall;
