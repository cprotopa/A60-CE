within CE;
model neighborhood

  inner IDEAS.SimInfoManager sim
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  IDEAS.Interfaces.Building building1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-90,-30})));
  IDEAS.Interfaces.Building building2(
    redeclare CE.Models.D1 building,
    redeclare CE.HeatingSystems.HeatPump heatingSystem,
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare CE.Occupants.ISO13790 occupant)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-80,-70})));
  IDEAS.Interfaces.Building building3 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-70,-30})));
  IDEAS.Interfaces.Building building4 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-50,-30})));
  IDEAS.Interfaces.Building building5 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-30,-30})));
  IDEAS.Interfaces.Building building6(
    redeclare CE.Models.D2 building,
    redeclare CE.HeatingSystems.Boiler heatingSystem,
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare CE.Occupants.ISO13790 occupant)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-20,-70})));
  IDEAS.Interfaces.Building building7 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-10,-30})));
  IDEAS.Interfaces.Building building8(
    redeclare CE.Models.D1 building,
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare CE.HeatingSystems.HeatPump heatingSystem,
    redeclare IDEAS.Buildings.Validation.BaseClasses.VentilationSystem.None
      ventilationSystem,
    redeclare CE.Occupants.ISO13790 occupant)
                         annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={10,-70})));
  IDEAS.Interfaces.Building building9 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={30,-30})));
  IDEAS.Interfaces.Building building10(
    redeclare CE.Models.D1 building,
    redeclare CE.HeatingSystems.HeatPump heatingSystem,
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare CE.Occupants.ISO13790 occupant)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={40,-70})));
  IDEAS.Interfaces.Building building11 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={50,-30})));
  IDEAS.Interfaces.Building building12 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={70,-30})));
  IDEAS.Interfaces.Building building13(
    redeclare CE.Models.D1 building,
    redeclare CE.HeatingSystems.HeatPump heatingSystem,
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare CE.Occupants.ISO13790 occupant)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={80,-70})));
  IDEAS.Interfaces.Building building14 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={90,-30})));
  IDEAS.Interfaces.Building building15(
    redeclare CE.Models.D2 building,
    redeclare CE.HeatingSystems.Boiler heatingSystem,
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare CE.Occupants.ISO13790 occupant)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={100,-70})));
  IDEAS.Interfaces.Building building16 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={110,-30})));
  IDEAS.Interfaces.Building building17
    annotation (Placement(transformation(extent={{-20,0},{0,20}})));
  IDEAS.Interfaces.Building building18
    annotation (Placement(transformation(extent={{20,4},{40,24}})));
  IDEAS.Interfaces.Building building19
    annotation (Placement(transformation(extent={{-20,20},{0,40}})));
  IDEAS.Interfaces.Building building20
    annotation (Placement(transformation(extent={{20,24},{40,44}})));
  IDEAS.Interfaces.Building building21
    annotation (Placement(transformation(extent={{-20,40},{0,60}})));
  IDEAS.Interfaces.Building building22
    annotation (Placement(transformation(extent={{20,44},{40,64}})));
  IDEAS.Interfaces.Building building23
    annotation (Placement(transformation(extent={{-20,60},{0,80}})));
  IDEAS.Interfaces.Building building24
    annotation (Placement(transformation(extent={{20,64},{40,84}})));
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
            100}})));
end neighborhood;
