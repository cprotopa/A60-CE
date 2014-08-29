within CE.Data.Materials;
record CavityVert = IDEAS.Buildings.Data.Interfaces.Material (
    d=0.1,
    k=0.1/0.16,
    c=20,
    rho=100,
    epsLw=0.88,
    epsSw=0.55,
    final gas=true) "Large Cavity Vertical heat transfer";
