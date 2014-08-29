within CE.Models;
model Detached "Detached"

  extends IDEAS.Interfaces.BaseClasses.Structure(
    nZones=3,
    final AZones={D_Afloor,D_N_Acommonfloor,N_A_Acommonfloor},
    final VZones={D_Volume,N_Volume, A_Volume},
    final nEmb=nZones,
    final ATrans);

  parameter Modelica.SIunits.Angle orientation
    "Tilt compared to original orientation (=0)";
  parameter Modelica.SIunits.Angle Roof_incl "Inclination of the roof";
  parameter Real f=0.21 " Frame/window fraction: 0.21 ";

   //Attic
  parameter Modelica.SIunits.Volume A_Volume "Volume of the ATTIC";
  parameter Modelica.SIunits.Area A_Aroof_south "Area of south roof, ATTIC";
  parameter Modelica.SIunits.Area A_Aroof_north "Area of north roof, ATTIC";
  parameter Modelica.SIunits.Area A_Awall_west
    "Area of west facing walls, ATTIC";
  parameter Modelica.SIunits.Area A_Awall_east
    "Area of east facing walls, ATTIC";

  //Nightzone

  parameter Modelica.SIunits.Volume N_Volume "Volume of the NIGHT zone";
  parameter Modelica.SIunits.Area N_Awall_south
    "Area of south facing walls (south on the original model), NIGHT zone";
  parameter Modelica.SIunits.Area N_Awall_west
    "Area of west facing walls, NIGHT zone";
  parameter Modelica.SIunits.Area N_Awall_north
    "Area of north facing walls, NIGHT zone";
  parameter Modelica.SIunits.Area N_Awall_east
    "Area of east facing walls, NIGHT zone";
  parameter Modelica.SIunits.Area N_Awind_south
    "Area of south facing windows, NIGHT zone";
  parameter Modelica.SIunits.Area N_Awind_west
    "Area of west facing windows, NIGHT zone";
  parameter Modelica.SIunits.Area N_Awind_north
    "Area of north facing windows, NIGHT zone";
  parameter Modelica.SIunits.Area N_Awind_east
    "Area of east facing windows, NIGHT zone";
  parameter Modelica.SIunits.Area N_Aintwalls
    "Total area of internal walls, NIGHT zone";
  parameter Modelica.SIunits.Area N_Aroof_south
    "Total area of south pitched roof, NIGHT zone";
  parameter Modelica.SIunits.Area N_Aroof_north
    "Total area of north pitched roof, NIGHT zone";
  parameter Modelica.SIunits.Area N_A_Acommonfloor
    "Area of the common floor between NIGHT zone and ATTIC";

  // Dayzone

  parameter Modelica.SIunits.Volume D_Volume "Volume of the DAY zone";
  parameter Modelica.SIunits.Area D_Awall_south
    "Area of south facing walls (south on the original model), DAY zone";
  parameter Modelica.SIunits.Area D_Awall_west
    "Area of west facing walls, DAY zone";
  parameter Modelica.SIunits.Area D_Awall_north
    "Area of north facing walls, DAY zone";
  parameter Modelica.SIunits.Area D_Awall_east
    "Area of east facing walls, DAY zone";
  parameter Modelica.SIunits.Area D_Awind_south
    "Area of south facing windows, DAY zone";
  parameter Modelica.SIunits.Area D_Awind_west
    "Area of west facing windows, DAY zone";
  parameter Modelica.SIunits.Area D_Awind_north
    "Area of north facing windows, DAY zone";
  parameter Modelica.SIunits.Area D_Awind_east
    "Area of east facing windows, DAY zone";
  parameter Modelica.SIunits.Area D_Adoor "Area of each door";
  parameter Modelica.SIunits.Area D_Afloor "Area of floor on ground, DAY zone";
  parameter Modelica.SIunits.Length D_Pfloor
    "Perimeter of floor on ground, DAY zone";
  parameter Modelica.SIunits.Area D_Aintwalls
    "Total area of internal walls, DAY zone";
  parameter Modelica.SIunits.Area D_N_Acommonfloor
    "Area of the common floor between DAY zone and NIGHT";

   //Attic
  IDEAS.Buildings.Components.Zone Attic(
    V=N_Volume,
    corrCV=5,
    nSurf=5) "Attic"
    annotation (Placement(transformation(extent={{80,50},{100,70}})));
  IDEAS.Buildings.Components.OuterWall roof_A[2](
    inc={Roof_incl,Roof_incl},
    azi={IDEAS.Constants.South + orientation,IDEAS.Constants.North +
        orientation},
    AWall={A_Aroof_south,A_Aroof_north},
    redeclare CE.Data.Constructions.State1.S1Roof constructionType)
    "Roof of attic"                   annotation (Placement(
        transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={-29,46})));
  IDEAS.Buildings.Components.OuterWall walls_A[2](
    AWall={N_Awall_south,N_Awall_west,N_Awall_north,N_Awall_east},
    azi={IDEAS.Constants.West + orientation,IDEAS.Constants.East + orientation},
    redeclare CE.Data.Constructions.State1.S1Wall constructionType,
    inc={1.5707963267949,1.5707963267949}) "Outer walls of attic"
    annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={11,46})));

  //Nightzone

  IDEAS.Buildings.Components.Zone nightzone(
    V=N_Volume,
    corrCV=5,
    nSurf=14) "Nightzone (bedrooms, corridors & bathroom)"
    annotation (Placement(transformation(extent={{80,-10},{100,10}})));

  IDEAS.Buildings.Components.OuterWall roof_N[2](
    inc={Roof_incl,Roof_incl},
    azi={IDEAS.Constants.South + orientation,IDEAS.Constants.North +
        orientation},
    AWall={N_Aroof_south,N_Aroof_north},
    redeclare CE.Data.Constructions.State1.S1Roof constructionType)
    "Roof of nightzone"                         annotation (Placement(
        transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={-29,-14})));

  IDEAS.Buildings.Components.InternalWall int_wall_N(
    azi=0,
    AWall=N_Aintwalls,
    redeclare CE.Data.Constructions.State1.S1Wall_Int constructionType,
    inc=1.5707963267949) "Walls in the nightzone" annotation (Placement(
        transformation(
        extent={{-5,-9},{5,9}},
        rotation=90,
        origin={-69,-13})));

  IDEAS.Buildings.Components.OuterWall walls_N[4](
    azi={IDEAS.Constants.South + orientation,IDEAS.Constants.West + orientation,
        IDEAS.Constants.North + orientation,IDEAS.Constants.East + orientation},
    AWall={N_Awall_south,N_Awall_west,N_Awall_north,N_Awall_east},
    redeclare CE.Data.Constructions.State1.S1Wall constructionType,
    inc={1.5707963267949,1.5707963267949,1.5707963267949,1.5707963267949})
    "Outer walls of nightzone"
    annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={11,-14})));

  IDEAS.Buildings.Components.Window windows_N[4](
    redeclare IDEAS.Buildings.Components.Shading.None shaType,
    azi={IDEAS.Constants.South + orientation,IDEAS.Constants.West + orientation,
        IDEAS.Constants.North + orientation,IDEAS.Constants.East + orientation},
    A={N_Awind_south,N_Awind_west,N_Awind_north,N_Awind_east},
    redeclare CE.Data.Glazing.Ins2 glazing,
    redeclare CE.Data.Frames.FrameU2_5 fraType,
    frac={f,f,f,f},
    inc={1.5707963267949,1.5707963267949,1.5707963267949,1.5707963267949})
    "Windows of nightzone"
    annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={51,-14})));

  //Dayzone

  IDEAS.Buildings.Components.Zone dayzone(
    V=D_Volume,
    corrCV=5,
    nSurf=14) "Dayzone (living room & kitchen)"
    annotation (Placement(transformation(extent={{80,-70},{100,-50}})));
  IDEAS.Buildings.Components.SlabOnGround floor_D(
    inc=0,
    azi=0,
    AWall=D_Afloor,
    PWall=D_Pfloor,
    redeclare CE.Data.Constructions.State1.S1Floor constructionType)
    "Slab on ground of dayzone"                 annotation (Placement(
        transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={-29,-74})));
  IDEAS.Buildings.Components.InternalWall int_wall_D(
    azi=0,
    AWall=D_Aintwalls,
    redeclare CE.Data.Constructions.State1.S1Wall_Int constructionType,
    inc=1.5707963267949) "Walls in the dayzone" annotation (Placement(
        transformation(
        extent={{-5.5,-9.5},{5.5,9.5}},
        rotation=90,
        origin={-69.5,-72.5})));
  IDEAS.Buildings.Components.OuterWall walls_D[4](
    azi={IDEAS.Constants.South + orientation,IDEAS.Constants.West +
        orientation,IDEAS.Constants.North + orientation,IDEAS.Constants.East
         + orientation},
    AWall={D_Awall_south,D_Awall_west,D_Awall_north,D_Awall_east},
    redeclare CE.Data.Constructions.State1.S1Wall constructionType,
    inc={1.5707963267949,1.5707963267949,1.5707963267949,1.5707963267949})
    "Outer walls of dayzone" annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={11,-74})));
  IDEAS.Buildings.Components.OuterWall doors_D[2](
    redeclare CE.Data.Constructions.State1.S1Door constructionType,
    AWall={D_Adoor,D_Adoor},
    azi={IDEAS.Constants.North + orientation,IDEAS.Constants.West + orientation},
    redeclare IDEAS.Buildings.Data.Insulation.none insulationType,
    inc={1.5707963267949,1.5707963267949}) "Exterior doors of dayzone"
                                                     annotation (
      Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={51,-94})));
  IDEAS.Buildings.Components.Window windows_D[4](
    redeclare IDEAS.Buildings.Components.Shading.None shaType,
    A={D_Awind_south,D_Awind_west,D_Awind_north,D_Awind_east},
    azi={IDEAS.Constants.South + orientation,IDEAS.Constants.West + orientation,
        IDEAS.Constants.North + orientation,IDEAS.Constants.East + orientation},
    redeclare CE.Data.Glazing.Ins2 glazing,
    redeclare CE.Data.Frames.FrameU2_5 fraType,
    frac={f,f,f,f},
    inc={1.5707963267949,1.5707963267949,1.5707963267949,1.5707963267949})
    "Windows of dayzone" annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={51,-74})));

  //Floors and walls between zones
  IDEAS.Buildings.Components.InternalWall int_floor_D_N(
    inc=0,
    azi=0,
    AWall=D_N_Acommonfloor,
    redeclare CE.Data.Constructions.State1.S1Floor_Int constructionType)
    "Internal floors between day and night zones"
    annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={71,-40})));

  IDEAS.Buildings.Components.InternalWall int_floor_N_A(
    inc=0,
    azi=0,
    AWall=N_A_Acommonfloor,
    redeclare CE.Data.Constructions.State1.S1Floor_Int constructionType)
    "Internal floors between day and night zones"
    annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={71,20})));

equation
  connect(dayzone.TSensor, TSensor[1]) annotation (Line(
      points={{100.6,-60},{134,-60},{134,-66.6667},{156,-66.6667}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(nightzone.TSensor, TSensor[2]) annotation (Line(
      points={{100.6,0},{134,0},{134,-60},{156,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Attic.TSensor, TSensor[3]) annotation (Line(
      points={{100.6,60},{134,60},{134,-54},{140,-54},{140,-53.3333},{156,
          -53.3333}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(Attic.gainCon, heatPortCon[3]) annotation (Line(
      points={{100,57},{116,57},{116,28},{122,28},{122,26.6667},{150,
          26.6667}},
      color={191,0,0},
      smooth=Smooth.None));

  connect(Attic.gainRad, heatPortRad[3]) annotation (Line(
      points={{100,54},{124,54},{124,-12},{136,-12},{136,-13.3333},{150,
          -13.3333}},
      color={191,0,0},
      smooth=Smooth.None));

  connect(nightzone.gainCon, heatPortCon[2]) annotation (Line(
      points={{100,-3},{108,-3},{116,-3},{116,-4},{116,20},{150,20}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(nightzone.gainRad, heatPortRad[2]) annotation (Line(
      points={{100,-6},{124,-6},{124,-20},{150,-20}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(dayzone.gainCon, heatPortCon[1]) annotation (Line(
      points={{100,-63},{108,-63},{116,-63},{116,-64},{116,14},{130,14},{
          130,13.3333},{150,13.3333}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(dayzone.gainRad, heatPortRad[1]) annotation (Line(
      points={{100,-66},{124,-66},{124,-26},{142,-26},{142,-26.6667},{150,
          -26.6667}},
      color={191,0,0},
      smooth=Smooth.None));

  connect(int_floor_N_A.port_emb, heatPortEmb[3]) annotation (Line(
      points={{81,20},{110,20},{110,40},{140,40},{140,60},{150,60}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(int_floor_D_N.port_emb, heatPortEmb[2]) annotation (Line(
      points={{81,-40},{88,-40},{88,-28},{110,-28},{110,40},{140,40},{140,60},{150,
          60}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(floor_D.port_emb, heatPortEmb[1]) annotation (Line(
      points={{-19,-74},{-6,-74},{-6,-28},{110,-28},{110,40},{140,40},{140,60},{
          150,60}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(roof_A.propsBus_a, Attic.propsBus[1:2]) annotation (Line(
      points={{-33,51},{-33,64.8},{80,64.8}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(walls_A.propsBus_a, Attic.propsBus[3:4]) annotation (Line(
      points={{7,51},{7,63.2},{80,63.2}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(int_floor_N_A.propsBus_a, Attic.propsBus[5]) annotation (Line(
      points={{67,25},{67,54},{80,54},{80,62.4}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(int_floor_N_A.propsBus_b, nightzone.propsBus[1]) annotation (Line(
      points={{67,15},{67,5.85714},{80,5.85714}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(int_wall_N.propsBus_b, nightzone.propsBus[2]) annotation (Line(
      points={{-72.6,-18},{-74,-18},{-74,-24},{-84,-24},{-84,5.57143},{80,
          5.57143}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));

  connect(int_wall_N.propsBus_a, nightzone.propsBus[3]) annotation (Line(
      points={{-72.6,-8},{-74,-8},{-74,5.28571},{80,5.28571}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(roof_N.propsBus_a, nightzone.propsBus[4:5]) annotation (Line(
      points={{-33,-9},{-33,4.71429},{80,4.71429}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(walls_N.propsBus_a, nightzone.propsBus[6:9]) annotation (Line(
      points={{7,-9},{7,3.57143},{80,3.57143}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(windows_N.propsBus_a, nightzone.propsBus[10:13]) annotation (Line(
      points={{47,-9},{48,-9},{48,2},{80,2},{80,2.42857}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(int_floor_D_N.propsBus_a, nightzone.propsBus[14]) annotation (Line(
      points={{67,-35},{67,-4},{80,-4},{80,2.14286}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(int_floor_D_N.propsBus_b, dayzone.propsBus[1]) annotation (Line(
      points={{67,-45},{67,-54.1429},{80,-54.1429}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(int_wall_D.propsBus_b, dayzone.propsBus[2]) annotation (Line(
      points={{-73.3,-78},{-74,-78},{-74,-84},{-82,-84},{-82,-54.4286},{80,
          -54.4286}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));

  connect(int_wall_D.propsBus_a, dayzone.propsBus[3]) annotation (Line(
      points={{-73.3,-67},{-73.3,-54.7143},{80,-54.7143}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(floor_D.propsBus_a, dayzone.propsBus[4]) annotation (Line(
      points={{-33,-69},{-33,-55},{80,-55}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(walls_D.propsBus_a, dayzone.propsBus[5:8]) annotation (Line(
      points={{7,-69},{7,-56.1429},{80,-56.1429}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(windows_D.propsBus_a, dayzone.propsBus[9:12]) annotation (Line(
      points={{47,-69},{47,-57.2857},{80,-57.2857}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(doors_D.propsBus_a, dayzone.propsBus[13:14]) annotation (Line(
      points={{47,-89},{47,-82},{70,-82},{70,-70},{70,-70},{70,-56},{70,-56},
          {70,-56},{80,-56},{80,-57.8571}},
      color={255,204,51},
      thickness=0.5,
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
end Detached;
