within CE.Data.Constructions.State2;
record S2Floor "S2 Floor for the period 1945-1970"

  extends IDEAS.Buildings.Data.Interfaces.Construction(nLay=3, mats={
        Materials.Tile(),
        Materials.Screed( d=0.05),
        Materials.Concrete(d=0.12)});
end S2Floor;
