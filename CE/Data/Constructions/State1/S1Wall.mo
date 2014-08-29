within CE.Data.Constructions.State1;
model S1Wall "S1 Exterior wall for the period after 2007"
  extends IDEAS.Buildings.Data.Interfaces.Construction(nLay=5, mats={
        Materials.BrickHD(d=0.10),
        Materials.CavityHor(),
        Insulation.MineralWool(d=0.6),
        Materials.BrickLD(d=0.14),
        Materials.Plaster()});
end S1Wall;
