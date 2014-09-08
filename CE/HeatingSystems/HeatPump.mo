within CE.HeatingSystems;
model HeatPump "A60 Consoclim heatpump model"

  extends IDEAS.HeatingSystems.Interfaces.Partial_IdealHeating(nZones = nZones);
  extends IDEAS.Interfaces.BaseClasses.HeatingSystem(
    final isHea = true,
    final isCoo = false,
    final nConvPorts = nZones,
    final nRadPorts = nZones,
    final nTemSen = nZones,
    final nLoads=1,
    nZones = nZones);

  final parameter Real[3] Cp = {0.949,-8.05,111.09};
  final parameter Real[3] Dp = {0.968,0.0226,-0.0063};
  final parameter Real[2] Kp = {0,0.67};

  final parameter Modelica.SIunits.Temperature TAirNom = 7 + 273.15;
  final parameter Modelica.SIunits.Temperature TWexNom = 35+273.15;
  final parameter Modelica.SIunits.Efficiency COPNom = 3.9;

  Real EIRFT;
  Real CAPFT;
  Real EIRFPLR;
  Real PLR = QHeaSys/sum(QNom) "Part load ratio";

  Modelica.SIunits.Temperature TAir = sim.Te "Outdoor air temperature";
  Modelica.SIunits.Temperature TWex = 273.15 + 40 "Supply water temperature";
  Modelica.SIunits.Temperature dT;

equation
   for i in 1:nZones loop
     if noEvent((294.15 - TSensor[i]) > 0) then
       QHeatZone[i] = IDEAS.Utilities.Math.Functions.smoothMin(x1=C[i]*(294.15 - TSensor[i])/t, x2=QNom[i],deltaX=1);
     else
       QHeatZone[i] = 0;
     end if;
     heatPortRad[i].Q_flow = -fractionRad[i]*QHeatZone[i];
     heatPortCon[i].Q_flow = -(1 - fractionRad[i])*QHeatZone[i];
     heatPortEmb[i].Q_flow = 0;
   end for;
  QHeaSys = sum(QHeatZone);
  P[1] = QHeaSys/COP;
  Q[1] = 0;

  dT = TAir/TWex - TAirNom/TWexNom;
  EIRFT = Cp[1] + Cp[2]*dT +Cp[3]*(dT^2);
  CAPFT = Dp[1] + Dp[2]*(TAir-TAirNom) + Dp[3]*(TWex-TWexNom);
  EIRFPLR = Kp[1] + (Kp[2]-Kp[1])*PLR + (1-Kp[2])*PLR;

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end HeatPump;
