within CE.Data.Materials;
record GypsumBoard =
                 IDEAS.Buildings.Data.Interfaces.Material (
    d=0.02,
    k=0.6,
    c=840,
    rho=975,
    epsLw=0.85,
    epsSw=0.65) "Gypsum board";
