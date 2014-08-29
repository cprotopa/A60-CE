within CE.Data.Constructions.State2;
model S2Roof "S2 Pitched roof for the period 1945-1970"

  extends IDEAS.Buildings.Data.Interfaces.Construction(nLay=3, mats={
        Materials.S2TiledRoof(),
        Materials.CavityVert(),
        Materials.GypsumBoard()});
end S2Roof;
