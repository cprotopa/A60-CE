within CE;
model neighborhood_R_FR

  inner IDEAS.SimInfoManager sim
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  IDEAS.Interfaces.Building building9(
    redeclare CE.Models.SL2 building(orientation=0),
    redeclare CE.Occupants.ISO13790 occupant,
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare IDEAS.Buildings.Validation.BaseClasses.VentilationSystem.None
      ventilationSystem,
    redeclare CE.HeatingSystems.Boiler heatingSystem(QNom={1,1,1}))
                                      annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={30,-30})));
  IDEAS.Interfaces.Building building11(
    redeclare CE.Occupants.ISO13790 occupant,
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare IDEAS.Buildings.Validation.BaseClasses.VentilationSystem.None
      ventilationSystem,
    redeclare CE.Models.T1 building(orientation=0),
    redeclare CE.HeatingSystems.HeatPump heatingSystem(QNom={1,1,1}))
                                       annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={50,-30})));
  IDEAS.Interfaces.Building building16(
    redeclare CE.Occupants.ISO13790 occupant,
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare IDEAS.Buildings.Validation.BaseClasses.VentilationSystem.None
      ventilationSystem,
    redeclare CE.Models.SR1 building(orientation=0),
    redeclare CE.HeatingSystems.HeatPump heatingSystem(QNom={1,1,1}))
                                       annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={110,-30})));
  IDEAS.Interfaces.Building building18(
    redeclare CE.Models.SR1 building(orientation=1.5707963267949),
    redeclare CE.Occupants.ISO13790 occupant,
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare IDEAS.Buildings.Validation.BaseClasses.VentilationSystem.None
      ventilationSystem,
    redeclare CE.HeatingSystems.Boiler heatingSystem(QNom={1,1,1}))
    annotation (Placement(transformation(extent={{20,4},{40,24}})));
  IDEAS.Interfaces.Building building20(
    redeclare CE.Models.T2 building(orientation=1.5707963267949),
    redeclare CE.Occupants.ISO13790 occupant,
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare IDEAS.Buildings.Validation.BaseClasses.VentilationSystem.None
      ventilationSystem,
    redeclare CE.HeatingSystems.Boiler heatingSystem(QNom={1,1,1}))
    annotation (Placement(transformation(extent={{20,24},{40,44}})));
  IDEAS.Interfaces.Building building22(
    redeclare CE.Models.T1 building(orientation=1.5707963267949),
    redeclare CE.Occupants.ISO13790 occupant,
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare IDEAS.Buildings.Validation.BaseClasses.VentilationSystem.None
      ventilationSystem,
    redeclare CE.HeatingSystems.HeatPump heatingSystem(QNom={1,1,1}))
    annotation (Placement(transformation(extent={{20,44},{40,64}})));
  IDEAS.Interfaces.Building building24(
    redeclare CE.Models.SL2 building(orientation=1.5707963267949),
    redeclare IDEAS.Buildings.Validation.BaseClasses.Occupant.None occupant,
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare IDEAS.Buildings.Validation.BaseClasses.VentilationSystem.None
      ventilationSystem,
    redeclare CE.HeatingSystems.Boiler heatingSystem(QNom={1,1,1}))
    annotation (Placement(transformation(extent={{20,64},{40,84}})));
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
end neighborhood_R_FR;
