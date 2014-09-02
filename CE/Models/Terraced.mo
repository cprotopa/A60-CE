within CE.Models;
model Terraced "Terraced"

  extends IDEAS.Interfaces.BaseClasses.Structure(
    nZones=3,
    final AZones={D_Afloor,N_Aintfloor+D_N_Acommonfloor,N_A_Acommonfloor},
    final VZones={D_Volume,N_Volume, A_Volume},
    final nEmb=nZones,
    final ATrans);

  parameter Modelica.SIunits.Angle orientation
    "Tilt compared to original orientation (=0)";
  parameter Modelica.SIunits.Angle Roof_incl "Inclination of the roof";
  parameter Real f=0.15 " Frame/window fraction: 0.15 ";

    //Attic
  parameter Modelica.SIunits.Volume A_Volume "Volume of the ATTIC";
  parameter Modelica.SIunits.Area A_Aroof "Area of roof (one side), ATTIC";
   parameter Modelica.SIunits.Area A_Awall_west
    "Area of west common walls, ATTIC";
  parameter Modelica.SIunits.Area A_Awall_east
    "Area of east common walls, ATTIC";

  //Nightzone

  parameter Modelica.SIunits.Volume N_Volume "Volume of the NIGHT zone";
  parameter Modelica.SIunits.Area N_Awall_south
    "Area of south facing walls (south on the original model), NIGHT zone";
  parameter Modelica.SIunits.Area N_Awall_west
    "Area of west common walls, NIGHT zone";
  parameter Modelica.SIunits.Area N_Awall_north
    "Area of north facing walls, NIGHT zone";
  parameter Modelica.SIunits.Area N_Awall_east
    "Area of east common walls, NIGHT zone";
  parameter Modelica.SIunits.Area N_Awind_south
    "Area of south facing windows, NIGHT zone";
  parameter Modelica.SIunits.Area N_Awind_north
    "Area of north facing windows, NIGHT zone";
  parameter Modelica.SIunits.Area N_Aroof
    "Area of piched roof of the NIGHT zone (only one side)";
  parameter Modelica.SIunits.Area N_Aintwalls
    "Total area of internal walls, NIGHT zone";
  parameter Modelica.SIunits.Area N_Aintfloor
    "Total area of internal floors, NIGHT zone";
  parameter Modelica.SIunits.Area N_A_Acommonfloor
    "Area of the common floor between NIGHT zone and ATTIC";

  // Dayzone
  parameter Modelica.SIunits.Volume D_Volume "Volume of the DAY zone";
  parameter Modelica.SIunits.Area D_Awall_south
    "Area of south facing walls (south on the original model), DAY zone";
  parameter Modelica.SIunits.Area D_Awall_west
    "Area of west common walls, DAY zone";
  parameter Modelica.SIunits.Area D_Awall_north
    "Area of north facing walls, DAY zone";
  parameter Modelica.SIunits.Area D_Awall_east
    "Area of east common walls, DAY zone";
  parameter Modelica.SIunits.Area D_Awind_south
    "Area of south facing windows, DAY zone";
  parameter Modelica.SIunits.Area D_Awind_north
    "Area of north facing windows, DAY zone";
  parameter Modelica.SIunits.Area D_Adoor_south "Area of door to the south";
  parameter Modelica.SIunits.Area D_Adoor_north "Area of door to the north";
  parameter Modelica.SIunits.Area D_Afloor "Area of floor on ground, DAY zone";
  parameter Modelica.SIunits.Length D_Pfloor
    "Perimeter of floor on ground, DAY zone";
  parameter Modelica.SIunits.Area D_Aintwalls
    "Total area of internal walls, DAY zone";
  parameter Modelica.SIunits.Area D_Aroof "Area of flat roof of the DAY zone";
  parameter Modelica.SIunits.Area D_N_Acommonfloor
    "Area of the common floor between DAY and NIGHT zones";

  //Nightzone

  IDEAS.Buildings.Components.Zone nightzone(
    V=N_Volume,
     corrCV=5,
    nSurf=14) "Night zone"
    annotation (Placement(transformation(extent={{80,-10},{100,10}})));

  IDEAS.Buildings.Components.OuterWall roof_N[2](
    AWall={N_Aroof,N_Aroof},
    inc={Roof_incl,Roof_incl},
    azi={IDEAS.Constants.South + orientation,IDEAS.Constants.North +
        orientation}) "Roof of nightzone"
                                      annotation (Placement(
        transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={-29,-14})));

  IDEAS.Buildings.Components.AdiabaticWall
                                        comm_wall_N[2](
    AWall={N_Awall_west,N_Awall_east},
    azi={IDEAS.Constants.West + orientation,IDEAS.Constants.East +
        orientation},
    inc={1.5707963267949,1.5707963267949})
    "Common walls with neighbors of the night zone"
                                               annotation (Placement(
        transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={-109,-14})));

  IDEAS.Buildings.Components.Window windows_N[2](
    redeclare IDEAS.Buildings.Components.Shading.None shaType,
    A={N_Awind_south,N_Awind_north},
    azi={IDEAS.Constants.South + orientation,IDEAS.Constants.North +
        orientation},
    redeclare CE.Data.Glazing.Ins2 glazing,
    frac={f,f},
    inc={1.5707963267949,1.5707963267949},
    redeclare CE.Data.Frames.FrameU2_5 fraType) "Window of attic"
                                           annotation (
      Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={51,-14})));

  IDEAS.Buildings.Components.InternalWall int_floor_N(
    azi=0,
    AWall=N_Aintfloor,
    inc=0) "Floor in the night zone" annotation (Placement(transformation(
        extent={{-5,-9},{5,9}},
        rotation=90,
        origin={-69,15})));
  IDEAS.Buildings.Components.InternalWall int_wall_N(
    azi=0,
    AWall=N_Aintwalls,
    inc=1.5707963267949) "Walls in the nightzone" annotation (Placement(
        transformation(
        extent={{-5,-9},{5,9}},
        rotation=90,
        origin={-69,-13})));
  IDEAS.Buildings.Components.OuterWall walls_N[2](
    azi={IDEAS.Constants.South + orientation,IDEAS.Constants.North +
        orientation},
    AWall={D_Awall_south,D_Awall_north},
    inc={1.5707963267949,1.5707963267949}) "Outer walls of nightzone"
    annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={11,-14})));

  //Dayzone
  IDEAS.Buildings.Components.Zone dayzone(
    V=D_Volume,
    corrCV=5,
    nSurf=13) "Dayzone (living room & kitchen)"
    annotation (Placement(transformation(extent={{80,-70},{100,-50}})));

  IDEAS.Buildings.Components.SlabOnGround floor_D(
    inc=0,
    azi=0,
    PWall=D_Pfloor,
    AWall=D_Afloor) "Slab on ground of dayzone" annotation (Placement(
        transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={-29,-74})));
  IDEAS.Buildings.Components.OuterWall walls_D[2](
    AWall={D_Awall_south,D_Awall_north},
    azi={IDEAS.Constants.South + orientation,IDEAS.Constants.North +
        orientation},
    inc={1.5707963267949,1.5707963267949}) "Outer walls of dayzone"
    annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={11,-74})));
  IDEAS.Buildings.Components.AdiabaticWall
                                        comm_wall_D[2](
    AWall={D_Awall_west,D_Awall_east},
    azi={IDEAS.Constants.West + orientation,IDEAS.Constants.East +
        orientation},
    inc={1.5707963267949,1.5707963267949})
    "Common walls with neighbors of the dayzone" annotation (Placement(
        transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={-109,-74})));
  IDEAS.Buildings.Components.Window windows_D[2](
    redeclare IDEAS.Buildings.Components.Shading.None shaType,
    A={D_Awind_south,D_Awind_north},
    azi={IDEAS.Constants.South + orientation,IDEAS.Constants.North +
        orientation},
    redeclare CE.Data.Glazing.Ins2 glazing,
    frac={f,f},
    inc={1.5707963267949,1.5707963267949},
    redeclare CE.Data.Frames.FrameU2_5 fraType) "Windows of dayzone"
    annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={51,-74})));

  IDEAS.Buildings.Components.OuterWall doors_D[2](
    redeclare CE.Data.Constructions.State1.S1Door constructionType,
    azi={IDEAS.Constants.South + orientation,IDEAS.Constants.North +
        orientation},
    AWall={D_Adoor_south,D_Adoor_north},
    redeclare IDEAS.Buildings.Data.Insulation.none insulationType,
    inc={1.5707963267949,1.5707963267949}) "Exterior doors of dayzone"
                                                     annotation (
      Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={51,-94})));
  IDEAS.Buildings.Components.InternalWall int_wall_D(
    azi=0,
    AWall=D_Aintwalls,
    inc=1.5707963267949) "Walls in the dayzone" annotation (Placement(
        transformation(
        extent={{-5.5,-9.5},{5.5,9.5}},
        rotation=90,
        origin={-69.5,-72.5})));

  IDEAS.Buildings.Components.OuterWall roof_D(
    inc=0,
    azi=IDEAS.Constants.South + orientation,
    AWall=D_Aroof) "Roof of dayzone"
                      annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={-29,-48})));

  //Floors between zones
  IDEAS.Buildings.Components.InternalWall int_floor_D_N(
    inc=0,
    azi=0,
    AWall=D_N_Acommonfloor) "Internal floors between day and night zones"
    annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={71,-40})));

  IDEAS.Buildings.Components.Zone Attic(
    V=N_Volume,
    corrCV=5,
    nSurf=5) "Attic"
    annotation (Placement(transformation(extent={{80,50},{100,70}})));
  IDEAS.Buildings.Components.OuterWall roof_A[2](
    inc={Roof_incl,Roof_incl},
    azi={IDEAS.Constants.South + orientation,IDEAS.Constants.North +
        orientation},
    AWall={A_Aroof,A_Aroof}) "Roof of attic"
                                      annotation (Placement(
        transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={-29,46})));
  IDEAS.Buildings.Components.AdiabaticWall comm_wall_A[2](
    azi={IDEAS.Constants.West + orientation,IDEAS.Constants.East + orientation},
    AWall={A_Awall_west,A_Awall_east},
    inc={1.5707963267949,1.5707963267949})
    "Common walls with neighbors of the attic" annotation (Placement(
        transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={-109,46})));

  IDEAS.Buildings.Components.InternalWall int_floor_N_A(
    inc=0,
    azi=0,
    AWall=N_A_Acommonfloor) "Internal floors between day and night zones"
    annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={71,20})));
equation
  connect(comm_wall_A.propsBus_a, Attic.propsBus[1:2]) annotation (Line(
      points={{-113,51},{-113,64.8},{80,64.8}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(roof_A.propsBus_a, Attic.propsBus[3:4]) annotation (Line(
      points={{-33,51},{-33,64},{80,64},{80,63.2}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(int_floor_N_A.propsBus_a, Attic.propsBus[5]) annotation (Line(
      points={{67,25},{67,64},{80,64},{80,62.4}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(int_floor_N_A.propsBus_b, nightzone.propsBus[1]) annotation (Line(
      points={{67,15},{67,5.85714},{80,5.85714}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(comm_wall_N.propsBus_a, nightzone.propsBus[2:3]) annotation (Line(
      points={{-113,-9},{-113,-2},{74,-2},{74,5.28571},{80,5.28571}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(int_wall_N.propsBus_a, nightzone.propsBus[4]) annotation (Line(
      points={{-72.6,-8},{-72,-8},{-72,5},{80,5}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(int_wall_N.propsBus_b, nightzone.propsBus[5]) annotation (Line(
      points={{-72.6,-18},{-70,-18},{-70,-26},{-48,-26},{-48,2},{-50,2},{80,2},
          {80,4.71429}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(int_floor_N.propsBus_b, nightzone.propsBus[6]) annotation (Line(
      points={{-72.6,10},{-72,10},{-72,4},{4,4},{4,4.42857},{80,4.42857}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(int_floor_N.propsBus_a, nightzone.propsBus[7]) annotation (Line(
      points={{-72.6,20},{-72,20},{-72,24},{-48,24},{-48,2},{80,2},{80,4.14286}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));

  connect(roof_N.propsBus_a, nightzone.propsBus[8:9]) annotation (Line(
      points={{-33,-9},{-33,2},{80,2},{80,3.57143}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(walls_N.propsBus_a, nightzone.propsBus[10:11]) annotation (Line(
      points={{7,-9},{7,2},{80,2},{80,3}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(windows_N.propsBus_a, nightzone.propsBus[12:13]) annotation (Line(
      points={{47,-9},{47,2.42857},{80,2.42857}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(int_floor_D_N.propsBus_a, nightzone.propsBus[14]) annotation (Line(
      points={{67,-35},{67,6},{80,6},{80,2.14286}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(int_floor_D_N.propsBus_b, dayzone.propsBus[1]) annotation (Line(
      points={{67,-45},{67,-54.1538},{80,-54.1538}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(comm_wall_D.propsBus_a, dayzone.propsBus[2:3]) annotation (Line(
      points={{-113,-69},{-113,-54.7692},{80,-54.7692}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(int_wall_D.propsBus_a, dayzone.propsBus[4]) annotation (Line(
      points={{-73.3,-67},{-73.3,-56},{-73.3,-58},{80,-58},{80,-55.0769}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(int_wall_D.propsBus_b, dayzone.propsBus[5]) annotation (Line(
      points={{-73.3,-78},{-72,-78},{-72,-86},{-50,-86},{-50,-58},{80,-58},{80,
          -55.3846}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));

  connect(floor_D.propsBus_a, dayzone.propsBus[6]) annotation (Line(
      points={{-33,-69},{-33,-55.6923},{80,-55.6923}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(roof_D.propsBus_a, dayzone.propsBus[7]) annotation (Line(
      points={{-33,-43},{-33,-40},{-10,-40},{-10,-56},{80,-56},{80,-56}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(walls_D.propsBus_a, dayzone.propsBus[8:9]) annotation (Line(
      points={{7,-69},{7,-56},{80,-56},{80,-56.6154}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(windows_D.propsBus_a, dayzone.propsBus[10:11]) annotation (Line(
      points={{47,-69},{47,-56},{80,-56},{80,-57.2308}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(doors_D.propsBus_a, dayzone.propsBus[12:13]) annotation (Line(
      points={{47,-89},{47,-84},{68,-84},{68,-54},{80,-54},{80,-57.8462}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));

  connect(Attic.TSensor, TSensor[3]) annotation (Line(
      points={{100.6,60},{132,60},{132,-53.3333},{156,-53.3333}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Attic.gainCon, heatPortCon[3]) annotation (Line(
      points={{100,57},{112,57},{112,20},{150,20},{150,26.6667}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(Attic.gainRad, heatPortRad[3]) annotation (Line(
      points={{100,54},{124,54},{124,-13.3333},{150,-13.3333}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(nightzone.TSensor, TSensor[2]) annotation (Line(
      points={{100.6,0},{132,0},{132,-60},{156,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(nightzone.gainCon, heatPortCon[2]) annotation (Line(
      points={{100,-3},{112,-3},{112,-2},{112,-2},{112,20},{150,20}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(nightzone.gainRad, heatPortRad[2]) annotation (Line(
      points={{100,-6},{124,-6},{124,-20},{150,-20}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(dayzone.TSensor, TSensor[1]) annotation (Line(
      points={{100.6,-60},{132,-60},{132,-64},{144,-64},{144,-66.6667},{156,-66.6667}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(dayzone.gainCon, heatPortCon[1]) annotation (Line(
      points={{100,-63},{108,-63},{108,-64},{112,-64},{112,13.3333},{150,13.3333}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(dayzone.gainRad, heatPortRad[1]) annotation (Line(
      points={{100,-66},{110,-66},{110,-64},{124,-64},{124,-26.6667},{150,-26.6667}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(int_floor_N_A.port_emb, heatPortEmb[3]) annotation (Line(
      points={{81,20},{104,20},{104,42},{140,42},{140,60},{150,60}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(int_floor_D_N.port_emb, heatPortEmb[2]) annotation (Line(
      points={{81,-40},{104,-40},{104,42},{140,42},{140,60},{150,60}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(floor_D.port_emb, heatPortEmb[1]) annotation (Line(
      points={{-19,-74},{-6,-74},{-6,-26},{104,-26},{104,42},{140,42},{140,
          60},{150,60}},
      color={191,0,0},
      smooth=Smooth.None));
  annotation (
    Line(
      points={{27,131},{27,140},{70,140},{70,134},{80,134}},
      color={0,0,255},
      smooth=Smooth.None),
    Line(
      points={{65,44},{68,44},{68,50},{92,50},{92,120}},
      color={191,0,0},
      smooth=Smooth.None),
    Diagram(coordinateSystem(extent={{-120,-100},{160,80}},
          preserveAspectRatio=false), graphics),
    Icon(coordinateSystem(extent={{-120,-100},{160,80}})));
end Terraced;