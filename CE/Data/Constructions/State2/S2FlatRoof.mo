within CE.Data.Constructions.State2;
record S2FlatRoof
  "S2 Flat roof for the period 1945-1970 (same as pitched roof)"

  extends IDEAS.Buildings.Data.Interfaces.Construction(nLay=3, mats={
        Materials.S2TiledRoof(),
        Materials.CavityVert(),
        Materials.GypsumBoard()});
end S2FlatRoof;
