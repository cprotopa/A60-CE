within CE.Data.Constructions.State2;
record AtticFloor "Attic floor for both periods"

  extends IDEAS.Buildings.Data.Interfaces.Construction(nLay=3, mats={
        Insulation.MineralWool(d=0.06),
        Materials.Wood(d=0.02),
        Materials.Plaster()});

end AtticFloor;
