within CE.Data.Constructions.State1;
model S1Roof "S1 Pitched roof for the period after 2007"

  extends IDEAS.Buildings.Data.Interfaces.Construction(nLay=5, mats={
        CE.Data.Materials.S1TiledRoof(),
        CE.Data.Materials.CavityVert(),
        CE.Data.Insulation.MineralWool(d=0.10),
        CE.Data.Materials.Wood(d=0.02),
        CE.Data.Materials.Plaster()});
end S1Roof;
