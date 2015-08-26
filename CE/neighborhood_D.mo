within CE;
model neighborhood_D

  inner IDEAS.SimInfoManager sim
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  IDEAS.Interfaces.Building building2(
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare CE.Occupants.ISO13790 occupant,
    redeclare CE.VentilationSystems.None
      ventilationSystem,
    redeclare CE.Models.D1 building(orientation=3.1415926535898),
    redeclare CE.HeatingSystems.HeatPump heatingSystem(QNom={2200,2500,0}))
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-80,-70})));
  IDEAS.Interfaces.Building building6(
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare CE.Occupants.ISO13790 occupant,
    redeclare CE.VentilationSystems.None
      ventilationSystem,
    redeclare CE.Models.D2 building(orientation=3.1415926535898),
    redeclare CE.HeatingSystems.Boiler heatingSystem(QNom={6600,11000,0}))
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-20,-70})));
  IDEAS.Interfaces.Building building8(
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare CE.VentilationSystems.None
      ventilationSystem,
    redeclare CE.Occupants.ISO13790 occupant,
    redeclare CE.Models.D1 building(orientation=3.1415926535898),
    redeclare CE.HeatingSystems.HeatPump heatingSystem(QNom={2200,2500,0}))
                         annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={10,-70})));
  IDEAS.Interfaces.Building building10(
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare CE.Occupants.ISO13790 occupant,
    redeclare CE.VentilationSystems.None
      ventilationSystem,
    redeclare CE.Models.D1 building(orientation=3.1415926535898),
    redeclare CE.HeatingSystems.HeatPump heatingSystem(QNom={2200,2500,0}))
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={40,-70})));
  IDEAS.Interfaces.Building building13(
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare CE.Occupants.ISO13790 occupant,
    redeclare CE.VentilationSystems.None
      ventilationSystem,
    redeclare CE.Models.D1 building(orientation=3.1415926535898),
    redeclare CE.HeatingSystems.HeatPump heatingSystem(QNom={2200,2500,0}))
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={80,-70})));
  IDEAS.Interfaces.Building building15(
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare CE.Occupants.ISO13790 occupant,
    redeclare CE.VentilationSystems.None
      ventilationSystem,
    redeclare CE.Models.D2 building(orientation=3.1415926535898),
    redeclare CE.HeatingSystems.Boiler heatingSystem(QNom={6600,11000,0}))
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={100,-70})));
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
      StopTime=3.1536e+007,
      Interval=3600,
      __Dymola_Algorithm="Lsodar"),
    __Dymola_experimentSetupOutput);
end neighborhood_D;
