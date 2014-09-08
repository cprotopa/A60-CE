within CE.Models;
model SR2 "Semi-Detached house on the RIGHTside of the block, state 2"

  extends IDEAS.Interfaces.BaseClasses.Structure(
    nZones=3,
    final AZones={D_Afloor,D_N_Acommonfloor,N_A_Acommonfloor},
    final VZones={D_Volume,N_Volume, A_Volume},
    final nEmb=nZones,
    final ATrans);

  parameter Modelica.SIunits.Angle orientation
    "Tilt compared to original orientation (=0)";
  parameter Real f=0.15 " Frame/window fraction: 0.15 ";

protected
parameter Modelica.SIunits.Angle  Roof_incl = 32.47*Modelica.Constants.pi/180;
parameter Modelica.SIunits.Volume  A_Volume = 43.26;
parameter Modelica.SIunits.Area  A_Aroof_south = 28.49;
parameter Modelica.SIunits.Area  A_Aroof_north = 28.49;
parameter Modelica.SIunits.Area  A_Awall_west =  5.67;
parameter Modelica.SIunits.Area  A_Awall_comm = 5.67;
parameter Modelica.SIunits.Volume  N_Volume = 126.52;
parameter Modelica.SIunits.Area  N_Aroof_south = 23.19;
parameter Modelica.SIunits.Area  N_Aroof_north = 22.39;
parameter Modelica.SIunits.Area  N_Awall_south =  9.66;
parameter Modelica.SIunits.Area  N_Awall_west =  21.02;
parameter Modelica.SIunits.Area  N_Awall_north =  9.66;
parameter Modelica.SIunits.Area  N_Awall_comm =  26.78;
parameter Modelica.SIunits.Area  N_Awind_south =  0.80;
parameter Modelica.SIunits.Area  N_Awind_west = 5.76;
parameter Modelica.SIunits.Area  N_Awind_north =  1.60;
parameter Modelica.SIunits.Area  N_Aintwalls =  58.78;
parameter Modelica.SIunits.Area  N_A_Acommonfloor =  48.07;
parameter Modelica.SIunits.Volume  D_Volume = 209.11;
parameter Modelica.SIunits.Area  D_Awall_south =  17.70;
parameter Modelica.SIunits.Area  D_Awall_west =  24.20;
parameter Modelica.SIunits.Area  D_Awall_north =  13.83;
parameter Modelica.SIunits.Area  D_Awall_comm = 22.54;
parameter Modelica.SIunits.Area  D_Awind_south =  2.86;
parameter Modelica.SIunits.Area  D_Awind_west = 6.60;
parameter Modelica.SIunits.Area  D_Awind_north =  8.71;
parameter Modelica.SIunits.Area   D_Adoor = 1.98;
parameter Modelica.SIunits.Area  D_Afloor = 88.55;
parameter Modelica.SIunits.Length  D_Pfloor =  27.10;
parameter Modelica.SIunits.Area   D_Aintwalls =  45.70;
parameter Modelica.SIunits.Area   D_N_Acommonfloor =  88.55;

  //Attic
public
    IDEAS.Buildings.Components.Zone Attic(
    V=N_Volume,
    corrCV=5,
    nSurf=5,
    n50=10) "Attic"
    annotation (Placement(transformation(extent={{80,50},{100,70}})));
  IDEAS.Buildings.Components.OuterWall roof_A[2](
    inc={Roof_incl,Roof_incl},
    azi={IDEAS.Constants.South + orientation,IDEAS.Constants.North +
        orientation},
   redeclare CE.Data.Constructions.State2.S2Roof  constructionType,
    AWall={A_Aroof_south,A_Aroof_north}) "Roof of attic"
                                      annotation (Placement(
        transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={-29,46})));
  IDEAS.Buildings.Components.AdiabaticWall comm_wall_A(
    AWall=A_Awall_comm,
    azi=IDEAS.Constants.East + orientation,
    redeclare CE.Data.Constructions.State2.S2Wall_Int  constructionType,
    inc=1.5707963267949) "Common wall with neighbors of the attic"
                                                  annotation (Placement(
        transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={-109,46})));
  IDEAS.Buildings.Components.OuterWall walls_A(
    AWall=A_Awall_west,
   redeclare CE.Data.Constructions.State2.S2Wall constructionType,
    azi=IDEAS.Constants.West + orientation,
    inc=1.5707963267949) "Outer wall of attic"
                               annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={11,46})));
  //Nightzone

  IDEAS.Buildings.Components.Zone nightzone(
    V=N_Volume,
    corrCV=5,
    nSurf=13,
    n50=10) "Nightzone (bedrooms, corridors & bathroom)"
    annotation (Placement(transformation(extent={{80,-10},{100,10}})));

  IDEAS.Buildings.Components.OuterWall roof_N[2](
    inc={Roof_incl,Roof_incl},
    azi={IDEAS.Constants.South + orientation,IDEAS.Constants.North +
        orientation},
    redeclare CE.Data.Constructions.State2.S2Roof  constructionType,
    AWall={N_Aroof_south,N_Aroof_north}) "Roof of nightzone"
                                                 annotation (Placement(
        transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={-29,-14})));

  IDEAS.Buildings.Components.OuterWall walls_N[3](
    AWall={N_Awall_south,N_Awall_west,N_Awall_north},
    redeclare CE.Data.Constructions.State2.S2Wall constructionType,
    azi={IDEAS.Constants.South + orientation,IDEAS.Constants.West + orientation,
        IDEAS.Constants.North + orientation},
    inc={1.5707963267949,1.5707963267949,1.5707963267949})
    "Outer walls of nightzone" annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={11,-14})));
  IDEAS.Buildings.Components.AdiabaticWall
                                        comm_wall_N(
    AWall=N_Awall_comm,
     redeclare CE.Data.Constructions.State2.S2Wall_Int  constructionType,
     azi=IDEAS.Constants.East + orientation,
    inc=1.5707963267949) "Common wall with neighbors of the nightzone"
                                                  annotation (Placement(
        transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={-109,-14})));

  IDEAS.Buildings.Components.Window windows_N[3](
    redeclare IDEAS.Buildings.Components.Shading.None shaType,
    redeclare CE.Data.Glazing.Ins2 glazing,
    A={N_Awind_south,N_Awind_west,N_Awind_north},
    azi={IDEAS.Constants.South + orientation,IDEAS.Constants.West + orientation,
        IDEAS.Constants.North + orientation},
    frac={f,f,f},
    redeclare CE.Data.Frames.FrameU2_5 fraType,
    inc={1.5707963267949,1.5707963267949,1.5707963267949})
    "Windows of nightzone"
    annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={51,-14})));

  IDEAS.Buildings.Components.InternalWall int_wall_N(
    azi=0,
    AWall=N_Aintwalls,
     redeclare CE.Data.Constructions.State2.S2Wall_Int  constructionType,
    inc=1.5707963267949) "Walls in the nightzone"  annotation (Placement(
        transformation(
        extent={{-5,-9},{5,9}},
        rotation=90,
        origin={-69,-13})));

  //Dayzone

  IDEAS.Buildings.Components.Zone dayzone(
    V=D_Volume,
    corrCV=5,
    nSurf=12,
    n50=10) "Dayzone (living room & kitchen)"
    annotation (Placement(transformation(extent={{80,-70},{100,-50}})));

  IDEAS.Buildings.Components.SlabOnGround floor_D(
    inc=0,
    azi=0,
    redeclare CE.Data.Constructions.State2.S2Floor constructionType,
    AWall=D_Afloor,
    PWall=D_Pfloor) "Slab on ground of dayzone" annotation (Placement(
        transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={-29,-74})));
  IDEAS.Buildings.Components.OuterWall walls_D[3](
    AWall={D_Awall_south,D_Awall_west,D_Awall_north},
    azi={IDEAS.Constants.South + orientation,IDEAS.Constants.West + orientation,
        IDEAS.Constants.North + orientation},
    redeclare CE.Data.Constructions.State2.S2Wall constructionType,
    inc={1.5707963267949,1.5707963267949,1.5707963267949})
    "Outer walls of dayzone" annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={11,-74})));
  IDEAS.Buildings.Components.AdiabaticWall
                                        comm_wall_D(
    AWall=D_Awall_comm,
    redeclare CE.Data.Constructions.State2.S2Wall_Int  constructionType,
     azi=IDEAS.Constants.East + orientation,
    inc=1.5707963267949) "Common walls with neighbors of the dayzone"
    annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={-109,-74})));

  IDEAS.Buildings.Components.Window windows_D[3](
    redeclare IDEAS.Buildings.Components.Shading.None shaType,
    redeclare CE.Data.Glazing.Ins2 glazing,
    A={D_Awind_south,D_Awind_west,D_Awind_north},
    azi={IDEAS.Constants.South + orientation,IDEAS.Constants.West + orientation,
        IDEAS.Constants.North + orientation},
    frac={f,f,f},
    redeclare CE.Data.Frames.FrameU2_5 fraType,
    inc={1.5707963267949,1.5707963267949,1.5707963267949}) "Windows of dayzone"
    annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={51,-74})));

  IDEAS.Buildings.Components.OuterWall doors_D(
    AWall=D_Adoor,
    redeclare CE.Data.Constructions.State2.S2Door constructionType,
    azi=IDEAS.Constants.South + orientation,
    redeclare IDEAS.Buildings.Data.Insulation.none insulationType,
    insulationThickness=0,
    inc=1.5707963267949) "Exterior doors of dayzone"
    annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={51,-94})));
  IDEAS.Buildings.Components.InternalWall int_wall_D(
    azi=0,
    AWall=D_Aintwalls,
     redeclare CE.Data.Constructions.State2.S2Wall_Int  constructionType,
    inc=1.5707963267949) "Walls in the dayzone"  annotation (Placement(
        transformation(
        extent={{-5.5,-9.5},{5.5,9.5}},
        rotation=90,
        origin={-69.5,-72.5})));

  //Floor between zones
  IDEAS.Buildings.Components.InternalWall int_floor_D_N(
    inc=0,
    azi=0,
    redeclare CE.Data.Constructions.State2.S2Floor_Int  constructionType,
     AWall=D_N_Acommonfloor) "Internal floors between day and night zones"
    annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={71,-40})));

  IDEAS.Buildings.Components.InternalWall int_floor_N_A(
    inc=0,
    azi=0,
    redeclare CE.Data.Constructions.State2.S2Floor_Int  constructionType,
     AWall=N_A_Acommonfloor) "Internal floors between day and night zones"
    annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={71,20})));
equation
  connect(Attic.TSensor, TSensor[3]) annotation (Line(
      points={{100.6,60},{126,60},{126,-53.3333},{156,-53.3333}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(nightzone.TSensor, TSensor[2]) annotation (Line(
      points={{100.6,0},{126,0},{126,-60},{156,-60}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(dayzone.TSensor, TSensor[1]) annotation (Line(
      points={{100.6,-60},{126,-60},{126,-66.6667},{156,-66.6667}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Attic.gainCon, heatPortCon[3]) annotation (Line(
      points={{100,57},{110,57},{110,26},{136,26},{136,26.6667},{150,26.6667}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(nightzone.gainCon, heatPortCon[2]) annotation (Line(
      points={{100,-3},{106,-3},{106,-2},{110,-2},{110,20},{150,20}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(dayzone.gainCon, heatPortCon[1]) annotation (Line(
      points={{100,-63},{106,-63},{106,-64},{110,-64},{110,14},{124,14},{124,
          13.3333},{150,13.3333}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(Attic.gainRad, heatPortRad[3]) annotation (Line(
      points={{100,54},{118,54},{118,-14},{134,-14},{134,-13.3333},{150,
          -13.3333}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(nightzone.gainRad, heatPortRad[2]) annotation (Line(
      points={{100,-6},{118,-6},{118,-20},{150,-20}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(dayzone.gainRad, heatPortRad[1]) annotation (Line(
      points={{100,-66},{118,-66},{118,-26.6667},{150,-26.6667}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(int_floor_N_A.port_emb, heatPortEmb[3]) annotation (Line(
      points={{81,20},{106,20},{106,40},{134,40},{134,60},{150,60}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(int_floor_D_N.port_emb, heatPortEmb[2]) annotation (Line(
      points={{81,-40},{90,-40},{90,-32},{106,-32},{106,40},{134,40},{134,
          60},{150,60}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(comm_wall_A.propsBus_a, Attic.propsBus[1]) annotation (Line(
      points={{-113,51},{-113,65.6},{80,65.6}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(roof_A.propsBus_a, Attic.propsBus[2:3]) annotation (Line(
      points={{-33,51},{-33,56},{80,56},{80,64}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(walls_A.propsBus_a, Attic.propsBus[4]) annotation (Line(
      points={{7,51},{7,63.2},{80,63.2}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(int_floor_N_A.propsBus_a, Attic.propsBus[5]) annotation (Line(
      points={{67,25},{67,56},{80,56},{80,62.4}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(int_floor_N_A.propsBus_b, nightzone.propsBus[1]) annotation (Line(
      points={{67,15},{67,5.84615},{80,5.84615}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(comm_wall_N.propsBus_a, nightzone.propsBus[2]) annotation (Line(
      points={{-113,-9},{-113,5.53846},{80,5.53846}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(int_wall_N.propsBus_a, nightzone.propsBus[3]) annotation (Line(
      points={{-72.6,-8},{-72,-8},{-72,5.23077},{80,5.23077}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(roof_N.propsBus_a, nightzone.propsBus[4:5]) annotation (Line(
      points={{-33,-9},{-33,4.61538},{80,4.61538}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(walls_N.propsBus_a, nightzone.propsBus[6:8]) annotation (Line(
      points={{7,-9},{7,3.69231},{80,3.69231}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(windows_N.propsBus_a, nightzone.propsBus[9:11]) annotation (Line(
      points={{47,-9},{47,2.76923},{80,2.76923}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(int_floor_D_N.propsBus_a, nightzone.propsBus[12]) annotation (
      Line(
      points={{67,-35},{67,6},{80,6},{80,2.46154}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(int_floor_D_N.propsBus_b, dayzone.propsBus[1]) annotation (Line(
      points={{67,-45},{67,-54.1667},{80,-54.1667}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(comm_wall_D.propsBus_a, dayzone.propsBus[2]) annotation (Line(
      points={{-113,-69},{-113,-54.5},{80,-54.5}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(int_wall_N.propsBus_b, nightzone.propsBus[13]) annotation (Line(
      points={{-72.6,-18},{-72,-18},{-72,-28},{-52,-28},{-52,6},{80,6},{80,
          2.15385}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(int_wall_D.propsBus_a, dayzone.propsBus[3]) annotation (Line(
      points={{-73.3,-67},{-73.3,-54.8333},{80,-54.8333}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(int_wall_D.propsBus_b, dayzone.propsBus[4]) annotation (Line(
      points={{-73.3,-78},{-72,-78},{-72,-86},{-48,-86},{-48,-58},{80,-58},{80,
          -55.1667}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(floor_D.propsBus_a, dayzone.propsBus[5]) annotation (Line(
      points={{-33,-69},{-33,-56},{80,-56},{80,-55.5}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(walls_D.propsBus_a, dayzone.propsBus[6:8]) annotation (Line(
      points={{7,-69},{7,-56},{80,-56},{80,-56.5}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(windows_D.propsBus_a, dayzone.propsBus[9:11]) annotation (Line(
      points={{47,-69},{47,-56},{80,-56},{80,-57.5}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(doors_D.propsBus_a, dayzone.propsBus[12]) annotation (Line(
      points={{47,-89},{47,-84},{68,-84},{68,-58},{80,-58},{80,-57.8333}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(int_wall_D.port_emb, heatPortEmb[1]) annotation (Line(
      points={{-60,-72.5},{-56,-72.5},{-56,-32},{106,-32},{106,40},{134,40},
          {134,60},{150,60}},
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
end SR2;
