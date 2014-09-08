within CE.Models.BaseClasses;
model AppartmentFloor

  extends IDEAS.Interfaces.BaseClasses.Structure(
    nZones=3, nEmb=2);

  IDEAS.Buildings.Components.Zone Back(
    V=142.3,
    n50=2,
    nSurf=7) annotation (Placement(transformation(extent={{-20,60},{0,80}})));
  IDEAS.Buildings.Components.Zone Hall(
    V=77.5,
    n50=2,
    nSurf=4) annotation (Placement(transformation(extent={{-20,-2},{0,18}})));
  IDEAS.Buildings.Components.Zone Front(
    V=152.5,
    n50=2,
    nSurf=7) annotation (Placement(transformation(extent={{-20,-60},{0,-40}})));
  IDEAS.Buildings.Components.InternalWall internalWall(
    AWall=41.2,
    azi=0,
    redeclare CE.Data.Constructions.State1.S1Wall_Int constructionType,
    insulationThickness=0,
    inc=1.5707963267949)                                                annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={-29,-22})));
  IDEAS.Buildings.Components.InternalWall internalWall1(
    AWall=31.6,
    azi=0,
    redeclare CE.Data.Constructions.State1.S1Wall_Int constructionType,
    insulationThickness=0,
    inc=1.5707963267949)                                                annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={-29,38})));
  IDEAS.Buildings.Components.OuterWall[3] outerWall(redeclare each
      CE.Data.Constructions.State1.S1Wall                                                              constructionType,
    each insulationThickness=0,
    AWall={13.7,35.78 - 8.52,13.7},
    each inc=1.5707963267949,
    azi={-1.5707963267949,-3.1415926535898,1.5707963267949})                                                   annotation (Placement(
        transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={-129,66})));
  IDEAS.Buildings.Components.Window window(redeclare CE.Data.Glazing.Ins2 glazing,
    redeclare each CE.Data.Frames.FrameU2_5 fraType,
    A=8.52,
    inc=1.5707963267949,
    azi=-3.1415926535898)                            annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={-89,66})));
  IDEAS.Buildings.Components.OuterWall[3] outerWall1(redeclare each
      CE.Data.Constructions.State1.S1Wall                                                               constructionType,
    each insulationThickness=0,
    AWall={16.24,45.9 - 15.3,10.78},
    each inc=1.5707963267949,
    azi={-1.5707963267949,0,1.5707963267949})                                                                  annotation (Placement(
        transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={-129,-54})));
  IDEAS.Buildings.Components.Window window1(redeclare CE.Data.Glazing.Ins2      glazing,
    redeclare each CE.Data.Frames.FrameU2_5 fraType,
    A=10,
    inc=1.5707963267949,
    azi=0)                                           annotation (Placement(
        transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={-89,-54})));
  IDEAS.Buildings.Components.Interfaces.ZoneBus[3] roof
    annotation (Placement(transformation(extent={{-110,78},{-70,118}})));
  IDEAS.Buildings.Components.Interfaces.ZoneBus[3] floor
    annotation (Placement(transformation(extent={{-110,-78},{-70,-118}})));
  IDEAS.Fluid.Sources.FixedBoundary bou(          redeclare package Medium =
        IDEAS.Media.Air, nPorts=1)
    annotation (Placement(transformation(extent={{30,72},{18,84}})));
  IDEAS.Fluid.Sources.MassFlowSource_T boundary(nPorts=1, redeclare package
      Medium = IDEAS.Media.Air,
    use_T_in=true,
    m_flow=0)
    annotation (Placement(transformation(extent={{32,86},{18,100}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=sim.Te)
    annotation (Placement(transformation(extent={{54,88},{40,104}})));
  IDEAS.Fluid.Sources.FixedBoundary bou1(         redeclare package Medium =
        IDEAS.Media.Air, nPorts=1)
    annotation (Placement(transformation(extent={{28,12},{16,24}})));
  IDEAS.Fluid.Sources.MassFlowSource_T boundary1(
                                                nPorts=1, redeclare package
      Medium = IDEAS.Media.Air,
    use_T_in=true,
    m_flow=0)
    annotation (Placement(transformation(extent={{30,26},{16,40}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(
                                                        y=sim.Te)
    annotation (Placement(transformation(extent={{52,28},{38,44}})));
  IDEAS.Fluid.Sources.FixedBoundary bou2(         redeclare package Medium =
        IDEAS.Media.Air, nPorts=1)
    annotation (Placement(transformation(extent={{28,-48},{16,-36}})));
  IDEAS.Fluid.Sources.MassFlowSource_T boundary2(
                                                nPorts=1, redeclare package
      Medium = IDEAS.Media.Air,
    use_T_in=true,
    m_flow=0)
    annotation (Placement(transformation(extent={{30,-34},{16,-20}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(
                                                        y=sim.Te)
    annotation (Placement(transformation(extent={{52,-32},{38,-16}})));
equation
  connect(internalWall.propsBus_b, Front.propsBus[1]) annotation (Line(
      points={{-33,-27},{-33,-44.2857},{-20,-44.2857}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(internalWall.propsBus_a, Hall.propsBus[1]) annotation (Line(
      points={{-33,-17},{-33,13.5},{-20,13.5}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(internalWall1.propsBus_b, Hall.propsBus[2]) annotation (Line(
      points={{-33,33},{-33,12.5},{-20,12.5}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(internalWall1.propsBus_a, Back.propsBus[1]) annotation (Line(
      points={{-33,43},{-33,75.7143},{-20,75.7143}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(window.propsBus_a, Back.propsBus[2]) annotation (Line(
      points={{-93,71},{-93,75.1429},{-20,75.1429}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(outerWall.propsBus_a, Back.propsBus[3:5]) annotation (Line(
      points={{-133,71},{-133,73.4286},{-20,73.4286}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(window1.propsBus_a, Front.propsBus[2]) annotation (Line(
      points={{-93,-49},{-93,-44.8571},{-20,-44.8571}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(outerWall1.propsBus_a, Front.propsBus[3:5]) annotation (Line(
      points={{-133,-49},{-133,-46.5714},{-20,-46.5714}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(Back.TSensor, TSensor[1]) annotation (Line(
      points={{0.6,70},{76,70},{76,-66.6667},{156,-66.6667}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Hall.TSensor, TSensor[2]) annotation (Line(
      points={{0.6,8},{76,8},{76,-60},{156,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Front.TSensor, TSensor[3]) annotation (Line(
      points={{0.6,-50},{76,-50},{76,-53.3333},{156,-53.3333}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Back.gainCon, heatPortCon[1]) annotation (Line(
      points={{0,67},{74,67},{74,13.3333},{150,13.3333}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(Back.gainRad, heatPortRad[1]) annotation (Line(
      points={{0,64},{74,64},{74,-26.6667},{150,-26.6667}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(Hall.gainCon, heatPortCon[2]) annotation (Line(
      points={{0,5},{74,5},{74,20},{150,20}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(Hall.gainRad, heatPortRad[2]) annotation (Line(
      points={{0,2},{74,2},{74,-20},{150,-20}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(Front.gainCon, heatPortCon[3]) annotation (Line(
      points={{0,-53},{76,-53},{76,26.6667},{150,26.6667}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(Front.gainRad, heatPortRad[3]) annotation (Line(
      points={{0,-56},{76,-56},{76,-13.3333},{150,-13.3333}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(internalWall1.port_emb, heatPortEmb[1]) annotation (Line(
      points={{-19,38},{70,38},{70,60},{150,60},{150,55}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(internalWall.port_emb, heatPortEmb[2]) annotation (Line(
      points={{-19,-22},{64,-22},{64,65},{150,65}},
      color={191,0,0},
      smooth=Smooth.None));

  connect(floor[1], Back.propsBus[6]) annotation (Line(
      points={{-90,-84.6667},{-92,-84.6667},{-92,72.8571},{-20,72.8571}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(floor[2], Hall.propsBus[3]) annotation (Line(
      points={{-90,-98},{-90,11.5},{-20,11.5}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(floor[3], Front.propsBus[6]) annotation (Line(
      points={{-90,-111.333},{-90,-47.1429},{-20,-47.1429}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));

  connect(roof[1], Back.propsBus[7]) annotation (Line(
      points={{-90,84.6667},{-92,84.6667},{-92,72.2857},{-20,72.2857}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(roof[2], Hall.propsBus[4]) annotation (Line(
      points={{-90,98},{-90,10.5},{-20,10.5}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(roof[3], Front.propsBus[7]) annotation (Line(
      points={{-90,111.333},{-90,-47.7143},{-20,-47.7143}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));

  connect(realExpression.y, boundary.T_in) annotation (Line(
      points={{39.3,96},{39.65,96},{39.65,95.8},{33.4,95.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(boundary.ports[1], Back.flowPort_Out) annotation (Line(
      points={{18,93},{6,93},{6,86},{-12,86},{-12,80}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(bou.ports[1], Back.flowPort_In) annotation (Line(
      points={{18,78},{6,78},{6,86},{-8,86},{-8,80}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(realExpression1.y, boundary1.T_in) annotation (Line(
      points={{37.3,36},{37.65,36},{37.65,35.8},{31.4,35.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(realExpression2.y, boundary2.T_in) annotation (Line(
      points={{37.3,-24},{37.65,-24},{37.65,-24.2},{31.4,-24.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(boundary1.ports[1], Hall.flowPort_Out) annotation (Line(
      points={{16,33},{12,33},{12,34},{6,34},{6,26},{-12,26},{-12,18}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(bou1.ports[1], Hall.flowPort_In) annotation (Line(
      points={{16,18},{6,18},{6,26},{-8,26},{-8,18}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(boundary2.ports[1], Front.flowPort_Out) annotation (Line(
      points={{16,-27},{10,-27},{10,-28},{4,-28},{4,-32},{-12,-32},{-12,-40}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(bou2.ports[1], Front.flowPort_In) annotation (Line(
      points={{16,-42},{4,-42},{4,-32},{-8,-32},{-8,-40}},
      color={0,127,255},
      smooth=Smooth.None));
     annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-150,
            -100},{150,100}}), graphics));
end AppartmentFloor;
