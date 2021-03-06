within IDEAS.Thermal.Components.GroundHeatExchanger.Borefield.BaseClasses.GroundHX.BaseClasses.Examples;
model test_integrandBh_rt
  extends Modelica.Icons.Example;

  parameter Real samplePeriod=0.01;
  parameter Integer lim=5;
  Real int;
  Real res;
algorithm
  if time < 0.007 then
    int := 0;
  else
    int := integrandBh_rt(
      r=0.055,
      D=100,
      u=time*lim);
  end if;

  res := Modelica.Math.Nonlinear.quadratureLobatto(
    function BaseClasses.integrandBf_bt(
      D=100,
      rBor=0.055,
      nbBh=1,
      cooBh={{0,0}}),
    0.001,
    0.001+time);

  annotation (experiment(
      StopTime=5,
      __Dymola_NumberOfIntervals=100,
      Tolerance=1e-005,
      __Dymola_Algorithm="Dassl"), __Dymola_experimentSetupOutput);
end test_integrandBh_rt;
