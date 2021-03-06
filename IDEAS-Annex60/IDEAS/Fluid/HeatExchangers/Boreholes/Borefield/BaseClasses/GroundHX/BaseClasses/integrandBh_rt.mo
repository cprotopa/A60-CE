within IDEAS.Thermal.Components.GroundHeatExchanger.Borefield.BaseClasses.GroundHX.BaseClasses;
function integrandBh_rt
  "Integrand for the mean temperature of a single borehole @ r from its center. u = integration variable  y = integrand "
  import SI = Modelica.SIunits;

  extends Modelica.Math.Nonlinear.Interfaces.partialScalarFunction;

  input SI.Distance r "distance to centre of bh";
  input SI.Distance D "depth of bh";

algorithm
  y := exp(-r^2*u^2)*(4*ierf(D*u) - ierf(2*D*u))/(D*u^2);

end integrandBh_rt;
