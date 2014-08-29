within CE.Data.Constructions.State1;
model S1FlatRoof "S1 Flat roof for the period after 2007"

  extends IDEAS.Buildings.Data.Interfaces.Construction(nLay=3, mats={
        Materials.LightConcrete(d=0.03),
        Insulation.XPS(d=0.08),
        Materials.Concrete( d=0.13)});
end S1FlatRoof;
