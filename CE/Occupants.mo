within CE;
package Occupants

  model ISO13790 "A60 Fixed setpoint"
    extends IDEAS.Interfaces.BaseClasses.Occupant(nZones=nZones, nLoads=1);

    Modelica.Blocks.Sources.RealExpression realExpression(y=0)
      annotation (Placement(transformation(extent={{0,-4},{20,16}})));
    Modelica.Blocks.Sources.RealExpression realExpression1(y=0)
      annotation (Placement(transformation(extent={{0,-28},{20,-8}})));
  equation
    mDHW60C = 0;
    heatPortRad.Q_flow =  zeros(nZones);
    heatPortCon.Q_flow =  zeros(nZones);
    TSet =  ones(nZones)*294.15;

    connect(realExpression.y, wattsLawPlug.P[1]) annotation (Line(
        points={{21,6},{40,6}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(realExpression1.y, wattsLawPlug.Q[1]) annotation (Line(
        points={{21,-18},{30,-18},{30,2},{40,2}},
        color={0,0,127},
        smooth=Smooth.None));
  end ISO13790;

end Occupants;
