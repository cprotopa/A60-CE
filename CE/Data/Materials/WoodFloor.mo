within CE.Data.Materials;
record WoodFloor = IDEAS.Buildings.Data.Interfaces.Material (
    d=0.02,
    k=0.18,
    c=1880,
    rho=700,
    epsLw=0.86,
    epsSw=0.44) "Wooden floor";
