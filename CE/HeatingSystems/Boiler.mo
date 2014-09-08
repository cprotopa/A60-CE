within CE.HeatingSystems;
model Boiler "A60 Boiler model"

  extends IDEAS.HeatingSystems.Interfaces.Partial_IdealHeating(nZones = nZones);
  extends IDEAS.Interfaces.BaseClasses.HeatingSystem(
    final isHea = true,
    final isCoo = false,
    final nConvPorts = nZones,
    final nRadPorts = nZones,
    final nTemSen = nZones,
    final nLoads=1,
    nZones = nZones);

  Real FRF = 1 "Flowrate fraction";
  Real PLR = QHeaSys/sum(QNom) "Part load ratio";
  Real PBoi;

  Modelica.SIunits.Temperature TAir = sim.Te "Outdoor air temperature";
  Modelica.SIunits.Temperature TWex = 273.15 + 40 "Supply water temperature";
  Modelica.SIunits.Temperature dT;

equation
   for i in 1:nZones loop
     if noEvent((TSet[i] - TSensor[i]) > 0) then
       QHeatZone[i] = IDEAS.Utilities.Math.Functions.smoothMin(x1=C[i]*(294.15- TSensor[i])/t, x2=QNom[i],deltaX=1);
     else
       QHeatZone[i] = 0;
     end if;
     heatPortRad[i].Q_flow = -fractionRad[i]*QHeatZone[i];
     heatPortCon[i].Q_flow = -(1 - fractionRad[i])*QHeatZone[i];
   end for;

  for j in 1:nEmbPorts loop
     heatPortEmb[j].Q_flow = 0;
  end for;

  QHeaSys = sum(QHeatZone);
//  P[1] = QHeaSys/COP;
//  Q[1] = 0;

  PBoi = -0.0591*PLR+0.9303;

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end Boiler;
