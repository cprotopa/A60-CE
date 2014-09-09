within CE;
model neighborhood_App

  inner IDEAS.SimInfoManager sim
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  IDEAS.Interfaces.Building building12(
    redeclare CE.Models.Appartment building,
    redeclare CE.Occupants.ISO13790 occupant,
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare IDEAS.Buildings.Validation.BaseClasses.VentilationSystem.None
      ventilationSystem,
    redeclare CE.HeatingSystems.HeatPump heatingSystem(QNom={1200,400,1200,1000,
          400,1000,1000,400,1000,1000,400,1000,1000,400,1000}))
                                       annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={70,-30})));
  inner Modelica.Fluid.System system
    annotation (Placement(transformation(extent={{-80,80},{-60,100}})));
  annotation (Diagram(coordinateSystem(extent={{-100,-100},{120,100}},
          preserveAspectRatio=false), graphics={
        Line(
          points={{-100,-48},{120,-48}},
          color={0,128,255},
          smooth=Smooth.None,
          thickness=0.5),
        Line(
          points={{6,80},{6,-48}},
          color={0,128,255},
          smooth=Smooth.None,
          thickness=0.5),
        Line(
          points={{-100,-46},{4,-46}},
          smooth=Smooth.None,
          color={127,0,0}),
        Line(
          points={{-100,-56},{120,-56}},
          smooth=Smooth.None,
          color={127,0,0}),
        Line(
          points={{14,80},{14,-46}},
          color={127,0,0},
          smooth=Smooth.None),
        Line(
          points={{4,80},{4,-46}},
          color={127,0,0},
          smooth=Smooth.None),
        Line(
          points={{14,-46},{120,-46}},
          color={127,0,0},
          smooth=Smooth.None),
        Ellipse(
          extent={{-106,-45},{-100,-51}},
          lineColor={0,128,255},
          lineThickness=0.5),
        Ellipse(
          extent={{-110,-45},{-104,-51}},
          lineColor={0,128,255},
          lineThickness=0.5)}), Icon(coordinateSystem(extent={{-100,-100},{120,
            100}})),
    experiment(
      StopTime=864000,
      Interval=3600,
      __Dymola_Algorithm="Lsodar"),
    __Dymola_experimentSetupOutput);
end neighborhood_App;
