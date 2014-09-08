within CE.Data.Constructions.State1;
record S1Wall "S1 Exterior wall for the period after 2007"
  extends IDEAS.Buildings.Data.Interfaces.Construction(nLay=5, mats={
        CE.Data.Materials.BrickHD(d=0.10),
        CE.Data.Materials.CavityHor(),
        CE.Data.Insulation.MineralWool(d=0.6),
        CE.Data.Materials.BrickLD(d=0.14),
        CE.Data.Materials.Plaster()});
end S1Wall;
