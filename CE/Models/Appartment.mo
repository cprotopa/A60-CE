within CE.Models;
model Appartment

  extends IDEAS.Interfaces.BaseClasses.Structure(
    nZones=15, nEmb=10);

  BaseClasses.AppartmentFloor appartmentFloor
    annotation (Placement(transformation(extent={{-40,-80},{-10,-60}})));
  BaseClasses.AppartmentFloor appartmentFloor1
    annotation (Placement(transformation(extent={{-40,-40},{-10,-20}})));
  BaseClasses.AppartmentFloor appartmentFloor2
    annotation (Placement(transformation(extent={{-40,0},{-10,20}})));
  BaseClasses.AppartmentFloor appartmentFloor3
    annotation (Placement(transformation(extent={{-40,40},{-10,60}})));
  BaseClasses.AppartmentFloor appartmentFloor4
    annotation (Placement(transformation(extent={{-40,68},{-10,88}})));
  IDEAS.Buildings.Components.InternalWall[3] internalWall(
    AWall={55.8,30.4,59.8},
    each azi=0,
    redeclare each CE.Data.Constructions.State1.S1Floor constructionType,
    each inc=0,
    each insulationThickness=0)                                           annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={-69,30})));
  IDEAS.Buildings.Components.InternalWall[3] internalWall1(
    AWall={55.8,30.4,59.8},
    each azi=0,
    redeclare each CE.Data.Constructions.State1.S1Floor constructionType,
    each inc=0,
    each insulationThickness=0)                                           annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={-69,70})));
  IDEAS.Buildings.Components.InternalWall[3] internalWall2(
    AWall={55.8,30.4,59.8},
    each azi=0,
    redeclare each CE.Data.Constructions.State1.S1Floor constructionType,
    each inc=0,
    each insulationThickness=0)                                           annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={-69,-10})));
  IDEAS.Buildings.Components.InternalWall[3] internalWall3(
    AWall={55.8,30.4,59.8},
    each azi=0,
    redeclare each CE.Data.Constructions.State1.S1Floor      constructionType,
    each inc=0,
    each insulationThickness=0)                                           annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={-69,-50})));
  IDEAS.Buildings.Components.SlabOnGround[3] internalWall4(
    AWall={55.8,30.4,59.8},
    each azi=0,
    redeclare each CE.Data.Constructions.State1.S1Floor constructionType,
    each inc=0,
    each insulationThickness=0,
    PWall={12.8,4,12.8})                                                        annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={-69,-90})));
  IDEAS.Buildings.Components.OuterWall[3] internalWall5(
    AWall={55.8,30.4,59.8},
    each azi=0,
    redeclare each CE.Data.Constructions.State1.S1Floor constructionType,
    each inc=0,
    each insulationThickness=0)                                           annotation (Placement(transformation(
        extent={{5,-10},{-5,10}},
        rotation=90,
        origin={-69,110})));
  outer Modelica.Fluid.System system
    annotation (Placement(transformation(extent={{100,-100},{120,-80}})));
equation
  connect(internalWall3.propsBus_a, appartmentFloor1.floor) annotation (Line(
      points={{-73,-45},{-53.5,-45},{-53.5,-39.8},{-34,-39.8}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(internalWall3.propsBus_b, appartmentFloor.roof) annotation (Line(
      points={{-73,-55},{-53.5,-55},{-53.5,-60.2},{-34,-60.2}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(internalWall2.propsBus_b, appartmentFloor1.roof) annotation (Line(
      points={{-73,-15},{-53.5,-15},{-53.5,-20.2},{-34,-20.2}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(internalWall2.propsBus_a, appartmentFloor2.floor) annotation (Line(
      points={{-73,-5},{-52.5,-5},{-52.5,0.2},{-34,0.2}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(internalWall.propsBus_b, appartmentFloor2.roof) annotation (Line(
      points={{-73,25},{-52.5,25},{-52.5,19.8},{-34,19.8}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(internalWall.propsBus_a, appartmentFloor3.floor) annotation (Line(
      points={{-73,35},{-54.5,35},{-54.5,40.2},{-34,40.2}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(internalWall1.propsBus_b, appartmentFloor3.roof) annotation (Line(
      points={{-73,65},{-53.5,65},{-53.5,59.8},{-34,59.8}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(internalWall1.propsBus_a, appartmentFloor4.floor) annotation (Line(
      points={{-73,75},{-54,75},{-54,68.2},{-34,68.2}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(internalWall4.propsBus_a, appartmentFloor.floor) annotation (Line(
      points={{-73,-85},{-53.5,-85},{-53.5,-79.8},{-34,-79.8}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(internalWall5.propsBus_a, appartmentFloor4.roof) annotation (Line(
      points={{-73,105},{-54,105},{-54,87.8},{-34,87.8}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(appartmentFloor4.heatPortEmb, heatPortEmb[1:2]) annotation (Line(
      points={{-10,84},{70,84},{70,53},{150,53}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(appartmentFloor3.heatPortEmb, heatPortEmb[3:4]) annotation (Line(
      points={{-10,56},{72,56},{72,57},{150,57}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(appartmentFloor2.heatPortEmb, heatPortEmb[5:6]) annotation (Line(
      points={{-10,16},{68,16},{68,61},{150,61}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(appartmentFloor1.heatPortEmb, heatPortEmb[7:8]) annotation (Line(
      points={{-10,-24},{70,-24},{70,65},{150,65}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(appartmentFloor.heatPortEmb, heatPortEmb[9:10]) annotation (Line(
      points={{-10,-64},{70,-64},{70,69},{150,69}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(appartmentFloor4.heatPortCon, heatPortCon[1:3]) annotation (Line(
      points={{-10,80},{70,80},{70,13.3333},{150,13.3333}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(appartmentFloor3.heatPortCon, heatPortCon[4:6]) annotation (Line(
      points={{-10,52},{68,52},{68,17.3333},{150,17.3333}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(appartmentFloor2.heatPortCon, heatPortCon[7:9]) annotation (Line(
      points={{-10,12},{70,12},{70,21.3333},{150,21.3333}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(appartmentFloor1.heatPortCon, heatPortCon[10:12]) annotation (Line(
      points={{-10,-28},{70,-28},{70,25.3333},{150,25.3333}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(appartmentFloor.heatPortCon, heatPortCon[13:15]) annotation (Line(
      points={{-10,-68},{70,-68},{70,29.3333},{150,29.3333}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(appartmentFloor4.heatPortRad, heatPortRad[1:3]) annotation (Line(
      points={{-10,76},{70,76},{70,-26.6667},{150,-26.6667}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(appartmentFloor3.heatPortRad, heatPortRad[4:6]) annotation (Line(
      points={{-10,48},{74,48},{74,-22.6667},{150,-22.6667}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(appartmentFloor2.heatPortRad, heatPortRad[7:9]) annotation (Line(
      points={{-10,8},{72,8},{72,-18.6667},{150,-18.6667}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(appartmentFloor1.heatPortRad, heatPortRad[10:12]) annotation (Line(
      points={{-10,-32},{68,-32},{68,-14.6667},{150,-14.6667}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(appartmentFloor.heatPortRad, heatPortRad[13:15]) annotation (Line(
      points={{-10,-72},{72,-72},{72,-10.6667},{150,-10.6667}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(appartmentFloor4.TSensor, TSensor[1:3]) annotation (Line(
      points={{-9.4,72},{74,72},{74,-66.6667},{156,-66.6667}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(appartmentFloor3.TSensor, TSensor[4:6]) annotation (Line(
      points={{-9.4,44},{70,44},{70,-62.6667},{156,-62.6667}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(appartmentFloor2.TSensor, TSensor[7:9]) annotation (Line(
      points={{-9.4,4},{70,4},{70,-58.6667},{156,-58.6667}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(appartmentFloor1.TSensor, TSensor[10:12]) annotation (Line(
      points={{-9.4,-36},{72,-36},{72,-54.6667},{156,-54.6667}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(appartmentFloor.TSensor, TSensor[13:15]) annotation (Line(
      points={{-9.4,-76},{70,-76},{70,-50.6667},{156,-50.6667}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(flowPort_Out[1:3], appartmentFloor4.flowPort_Out) annotation (Line(
      points={{-20,93.3333},{-20,94},{-27,94},{-27,88}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(flowPort_In[1:3], appartmentFloor4.flowPort_In) annotation (Line(
      points={{20,93.3333},{-2,93.3333},{-2,88},{-23,88}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(flowPort_Out[4:6], appartmentFloor3.flowPort_Out) annotation (Line(
      points={{-20,97.3333},{-24,97.3333},{-24,60},{-27,60}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(flowPort_In[4:6], appartmentFloor3.flowPort_In) annotation (Line(
      points={{20,97.3333},{-2,97.3333},{-2,60},{-23,60}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(flowPort_Out[7:9], appartmentFloor2.flowPort_Out) annotation (Line(
      points={{-20,101.333},{-24,101.333},{-24,20},{-27,20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(flowPort_In[7:9], appartmentFloor2.flowPort_In) annotation (Line(
      points={{20,101.333},{20,60},{-23,60},{-23,20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(flowPort_Out[10:12], appartmentFloor1.flowPort_Out) annotation (Line(
      points={{-20,105.333},{-24,105.333},{-24,-20},{-27,-20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(flowPort_In[10:12], appartmentFloor1.flowPort_In) annotation (Line(
      points={{20,105.333},{-2,105.333},{-2,-20},{-23,-20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(flowPort_Out[13:15], appartmentFloor.flowPort_Out) annotation (Line(
      points={{-20,109.333},{-24,109.333},{-24,-60},{-27,-60}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(flowPort_In[13:15], appartmentFloor.flowPort_In) annotation (Line(
      points={{20,109.333},{20,20},{-23,20},{-23,-60}},
      color={0,0,0},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-150,
            -100},{150,100}}), graphics));
end Appartment;
