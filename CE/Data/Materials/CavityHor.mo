within CE.Data.Materials;
record CavityHor = IDEAS.Buildings.Data.Interfaces.Material (
    d=0.1,
    k=0.1/0.18,
    c=20,
    rho=0.1,
    epsLw=0.88,
    epsSw=0.55,
    final gas=true) "Large Cavity Horizontal heat transfer";
