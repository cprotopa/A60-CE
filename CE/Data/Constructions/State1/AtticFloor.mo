within CE.Data.Constructions.State1;
record AtticFloor "Attic floor for both periods"

  extends IDEAS.Buildings.Data.Interfaces.Construction(nLay=3, mats={
        CE.Data.Insulation.MineralWool(d=0.06),
        CE.Data.Materials.Wood(d=0.02),
        CE.Data.Materials.Plaster()});

end AtticFloor;
