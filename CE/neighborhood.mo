within CE;
model neighborhood

  inner IDEAS.SimInfoManager sim
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  IDEAS.Interfaces.Building building1(
    redeclare CE.Occupants.ISO13790 occupant,
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare CE.Models.SL1 building(orientation=0),
    redeclare CE.HeatingSystems.HeatPump heatingSystem(QNom={1000,1100,0}),
    redeclare IDEAS.VentilationSystems.None ventilationSystem)
                                      annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-90,-30})));
  IDEAS.Interfaces.Building building2(
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare CE.Occupants.ISO13790 occupant,
    redeclare IDEAS.VentilationSystems.None
      ventilationSystem,
    redeclare CE.Models.D1 building(orientation=3.1415926535898),
    redeclare CE.HeatingSystems.HeatPump heatingSystem(QNom={1000,1100,0}))
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-80,-70})));
  IDEAS.Interfaces.Building building3(
    redeclare CE.Occupants.ISO13790 occupant,
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare IDEAS.VentilationSystems.None
      ventilationSystem,
    redeclare CE.Models.T1 building(orientation=0),
    redeclare CE.HeatingSystems.HeatPump heatingSystem(QNom={1000,1100,0}))
                                      annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-70,-30})));
  IDEAS.Interfaces.Building building4(
    redeclare CE.Occupants.ISO13790 occupant,
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare IDEAS.VentilationSystems.None
      ventilationSystem,
    redeclare CE.Models.T2 building(orientation=0),
    redeclare CE.HeatingSystems.Boiler heatingSystem(QNom={2200,4200,0}))
                                      annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-50,-30})));
  IDEAS.Interfaces.Building building5(
    redeclare CE.Occupants.ISO13790 occupant,
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare IDEAS.VentilationSystems.None
      ventilationSystem,
    redeclare CE.Models.T1 building(orientation=0),
    redeclare CE.HeatingSystems.HeatPump heatingSystem(QNom={1000,1100,0}))
                                      annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-30,-30})));
  IDEAS.Interfaces.Building building6(
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare CE.Occupants.ISO13790 occupant,
    redeclare IDEAS.VentilationSystems.None
      ventilationSystem,
    redeclare CE.Models.D2 building(orientation=3.1415926535898),
    redeclare CE.HeatingSystems.Boiler heatingSystem(QNom={4200,9500,0}))
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-20,-70})));
  IDEAS.Interfaces.Building building7(
    redeclare CE.Occupants.ISO13790 occupant,
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare CE.Models.SR2 building(orientation=0),
    redeclare IDEAS.VentilationSystems.None
      ventilationSystem,
    redeclare CE.HeatingSystems.Boiler heatingSystem(QNom={3000,7000,0}))
                                      annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-10,-30})));
  IDEAS.Interfaces.Building building8(
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare IDEAS.VentilationSystems.None
      ventilationSystem,
    redeclare CE.Occupants.ISO13790 occupant,
    redeclare CE.Models.D1 building(orientation=3.1415926535898),
    redeclare CE.HeatingSystems.HeatPump heatingSystem(QNom={1000,1100,0}))
                         annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={10,-70})));
  IDEAS.Interfaces.Building building9(
    redeclare CE.Models.SL2 building(orientation=0),
    redeclare CE.Occupants.ISO13790 occupant,
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare IDEAS.VentilationSystems.None
      ventilationSystem,
    redeclare CE.HeatingSystems.Boiler heatingSystem(QNom={3000,7000,0}))
                                      annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={30,-30})));
  IDEAS.Interfaces.Building building10(
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare CE.Occupants.ISO13790 occupant,
    redeclare IDEAS.VentilationSystems.None
      ventilationSystem,
    redeclare CE.Models.D1 building(orientation=3.1415926535898),
    redeclare CE.HeatingSystems.HeatPump heatingSystem(QNom={1000,1100,0}))
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={40,-70})));
  IDEAS.Interfaces.Building building11(
    redeclare CE.Occupants.ISO13790 occupant,
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare IDEAS.VentilationSystems.None
      ventilationSystem,
    redeclare CE.Models.T1 building(orientation=0),
    redeclare CE.HeatingSystems.HeatPump heatingSystem(QNom={1000,1100,0}))
                                       annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={50,-30})));
  IDEAS.Interfaces.Building building12(
    redeclare CE.Models.Appartment building,
    redeclare CE.Occupants.ISO13790 occupant,
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare IDEAS.VentilationSystems.None
      ventilationSystem,
    redeclare CE.HeatingSystems.HeatPump heatingSystem(QNom={1200,400,1200,1000,
          400,1000,1000,400,1000,1000,400,1000,1000,400,1000}))
                                       annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={70,-30})));
  IDEAS.Interfaces.Building building13(
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare CE.Occupants.ISO13790 occupant,
    redeclare IDEAS.VentilationSystems.None
      ventilationSystem,
    redeclare CE.Models.D1 building(orientation=3.1415926535898),
    redeclare CE.HeatingSystems.HeatPump heatingSystem(QNom={1000,1100,0}))
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={80,-70})));
  IDEAS.Interfaces.Building building14(
    redeclare CE.Models.Appartment building,
    redeclare CE.Occupants.ISO13790 occupant,
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare IDEAS.VentilationSystems.None
      ventilationSystem,
    redeclare CE.HeatingSystems.HeatPump heatingSystem(QNom={1200,400,1200,1000,
          400,1000,1000,400,1000,1000,400,1000,1000,400,1000}))
                                       annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={90,-30})));
  IDEAS.Interfaces.Building building15(
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare CE.Occupants.ISO13790 occupant,
    redeclare IDEAS.VentilationSystems.None
      ventilationSystem,
    redeclare CE.Models.D2 building(orientation=3.1415926535898),
    redeclare CE.HeatingSystems.Boiler heatingSystem(QNom={4200,9500,0}))
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={100,-70})));
  IDEAS.Interfaces.Building building16(
    redeclare CE.Occupants.ISO13790 occupant,
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare IDEAS.VentilationSystems.None
      ventilationSystem,
    redeclare CE.Models.SR1 building(orientation=0),
    redeclare CE.HeatingSystems.HeatPump heatingSystem(QNom={3000,7000,0}))
                                       annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={110,-30})));
  IDEAS.Interfaces.Building building17(
    redeclare CE.Models.SL1 building(orientation=-1.5707963267949),
    redeclare CE.Occupants.ISO13790 occupant,
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare IDEAS.VentilationSystems.None
      ventilationSystem,
    redeclare CE.HeatingSystems.HeatPump heatingSystem(QNom={3000,7000,0}))
    annotation (Placement(transformation(extent={{-20,0},{0,20}})));
  IDEAS.Interfaces.Building building18(
    redeclare CE.Models.SR1 building(orientation=1.5707963267949),
    redeclare CE.Occupants.ISO13790 occupant,
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare IDEAS.VentilationSystems.None
      ventilationSystem,
    redeclare CE.HeatingSystems.Boiler heatingSystem(QNom={1000,1100,0}))
    annotation (Placement(transformation(extent={{20,4},{40,24}})));
  IDEAS.Interfaces.Building building19(
    redeclare CE.Models.T1 building(orientation=-1.5707963267949),
    redeclare CE.Occupants.ISO13790 occupant,
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare IDEAS.VentilationSystems.None
      ventilationSystem,
    redeclare CE.HeatingSystems.HeatPump heatingSystem(QNom={1000,1100,0}))
    annotation (Placement(transformation(extent={{-20,20},{0,40}})));
  IDEAS.Interfaces.Building building20(
    redeclare CE.Models.T2 building(orientation=1.5707963267949),
    redeclare CE.Occupants.ISO13790 occupant,
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare IDEAS.VentilationSystems.None
      ventilationSystem,
    redeclare CE.HeatingSystems.Boiler heatingSystem(QNom={2200,4200,0}))
    annotation (Placement(transformation(extent={{20,24},{40,44}})));
  IDEAS.Interfaces.Building building21(
    redeclare CE.Models.T2 building(orientation=-1.5707963267949),
    redeclare CE.Occupants.ISO13790 occupant,
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare IDEAS.VentilationSystems.None
      ventilationSystem,
    redeclare CE.HeatingSystems.Boiler heatingSystem(QNom={2200,4200,0}))
    annotation (Placement(transformation(extent={{-20,40},{0,60}})));
  IDEAS.Interfaces.Building building22(
    redeclare CE.Models.T1 building(orientation=1.5707963267949),
    redeclare CE.Occupants.ISO13790 occupant,
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare IDEAS.VentilationSystems.None
      ventilationSystem,
    redeclare CE.HeatingSystems.HeatPump heatingSystem(QNom={1000,1100,0}))
    annotation (Placement(transformation(extent={{20,44},{40,64}})));
  IDEAS.Interfaces.Building building23(
    redeclare CE.Models.T2 building(orientation=-1.5707963267949),
    redeclare CE.Occupants.ISO13790 occupant,
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare IDEAS.VentilationSystems.None
      ventilationSystem,
    redeclare CE.HeatingSystems.Boiler heatingSystem(QNom={1000,1100,0}))
    annotation (Placement(transformation(extent={{-20,60},{0,80}})));
  IDEAS.Interfaces.Building building24(
    redeclare CE.Models.SL2 building(orientation=1.5707963267949),
    redeclare IDEAS.Buildings.Validation.BaseClasses.Occupant.None occupant,
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare IDEAS.VentilationSystems.None
      ventilationSystem,
    redeclare CE.HeatingSystems.Boiler heatingSystem(QNom={3000,7000,0}))
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
      StopTime=864000,
      Interval=3600,
      __Dymola_Algorithm="Lsodar"),
    __Dymola_experimentSetupOutput);
end neighborhood;
