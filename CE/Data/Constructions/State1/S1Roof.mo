within CE.Data.Constructions.State1;
model S1Roof "S1 Pitched roof for the period after 2007"

  extends IDEAS.Buildings.Data.Interfaces.Construction(nLay=5, mats={
        Materials.S1TiledRoof(),
        Materials.CavityVert(),
        Insulation.MineralWool(d=0.10),
        Materials.Wood(d=0.02),
        Materials.Plaster()});
end S1Roof;
