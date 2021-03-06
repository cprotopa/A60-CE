within IDEAS.Utilities.Psychrometrics.Functions.BaseClasses.Examples;
model DewPointTemperatureDerivativeCheck_amb
  "Model to test correct implementation of derivative"
  extends Modelica.Icons.Example;

  Real x;
  Real y;
  parameter Real uniCon(unit="K/s") = 1 "Constant to convert units";
initial equation
  y = x;
equation
  x = IDEAS.Utilities.Psychrometrics.Functions.pW_TDewPoi_amb(T=time*uniCon);
  der(y) = der(x);
  assert(abs(x - y) < 1E-2, "Model has an error");
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})),
    __Dymola_Commands(file="modelica://IDEAS/Resources/Scripts/Dymola/Utilities/Psychrometrics/Functions/BaseClasses/Examples/DewPointTemperatureDerivativeCheck_amb.mos"
        "Simulate and plot"),
    experiment(
      StartTime=273.15,
      StopTime=323.15),
    Documentation(info="<html>
<p>
This example checks whether the function derivative
is implemented correctly. If the derivative implementation
is not correct, the model will stop with an assert statement.
</p>
</html>", revisions="<html>
<ul>
<li>
October 29, 2008, by Michael Wetter:<br/>
First implementation.
</li>
</ul>
</html>"));
end DewPointTemperatureDerivativeCheck_amb;
