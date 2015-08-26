within CE.Models.BaseClasses;
model AppartmentFloor

  extends IDEAS.Interfaces.BaseClasses.Structure(
    nZones=3, nEmb=2, redeclare package Medium =
          CE.Data.Medium);

  IDEAS.Buildings.Components.Zone Back(
    V=142.3,
    n50=2,
    nSurf=7,
    redeclare package Medium = Medium)
             annotation (Placement(transformation(extent={{18,60},{38,80}})));
  IDEAS.Buildings.Components.Zone Hall(
    V=77.5,
    n50=2,
    nSurf=4,
    redeclare package Medium = Medium)
             annotation (Placement(transformation(extent={{18,-2},{38,18}})));
  IDEAS.Buildings.Components.Zone Front(
    V=152.5,
    n50=2,
    nSurf=7,
    redeclare package Medium = Medium)
             annotation (Placement(transformation(extent={{20,-60},{40,-40}})));
  IDEAS.Buildings.Components.InternalWall internalWall(
    AWall=41.2,
    azi=0,
    redeclare CE.Data.Constructions.State1.S1Wall_Int constructionType,
    insulationThickness=0,
    inc=1.5707963267949)                                                annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={-33,-22})));
  IDEAS.Buildings.Components.InternalWall internalWall1(
    AWall=31.6,
    azi=0,
    redeclare CE.Data.Constructions.State1.S1Wall_Int constructionType,
    insulationThickness=0,
    inc=1.5707963267949)                                                annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={-33,38})));
  IDEAS.Buildings.Components.OuterWall[3] outerWall(redeclare each
      CE.Data.Constructions.State1.S1Wall                                                              constructionType,
    each insulationThickness=0,
    AWall={13.7,35.78 - 8.52,13.7},
    each inc=1.5707963267949,
    azi={-1.5707963267949,-3.1415926535898,1.5707963267949})                                                   annotation (Placement(
        transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={-131,54})));
  IDEAS.Buildings.Components.Window window(redeclare CE.Data.Glazing.Ins2 glazing,
    redeclare each CE.Data.Frames.FrameU2_5 fraType,
    A=8.52,
    inc=1.5707963267949,
    azi=-3.1415926535898)                            annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={-103,52})));
  IDEAS.Buildings.Components.OuterWall[3] outerWall1(redeclare each
      CE.Data.Constructions.State1.S1Wall                                                               constructionType,
    each insulationThickness=0,
    AWall={16.24,45.9 - 15.3,10.78},
    each inc=1.5707963267949,
    azi={-1.5707963267949,0,1.5707963267949})                                                                  annotation (Placement(
        transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={-131,-60})));
  IDEAS.Buildings.Components.Window window1(redeclare CE.Data.Glazing.Ins2      glazing,
    redeclare each CE.Data.Frames.FrameU2_5 fraType,
    A=10,
    inc=1.5707963267949,
    azi=0)                                           annotation (Placement(
        transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={-105,-60})));
  IDEAS.Buildings.Components.Interfaces.ZoneBus[3] roof( each final numAzi=sim.numAzi,
      each final computeConservationOfEnergy=sim.computeConservationOfEnergy)
    annotation (Placement(transformation(extent={{-110,78},{-70,118}})));
  IDEAS.Buildings.Components.Interfaces.ZoneBus[3] floor( each final numAzi=sim.numAzi,
      each final computeConservationOfEnergy=sim.computeConservationOfEnergy)
    annotation (Placement(transformation(extent={{-110,-78},{-70,-118}})));
equation
  connect(internalWall.propsBus_b, Front.propsBus[1]) annotation (Line(
      points={{-37,-27},{-37,-44.2857},{20,-44.2857}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(internalWall.propsBus_a, Hall.propsBus[1]) annotation (Line(
      points={{-37,-17},{-37,13.5},{18,13.5}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(internalWall1.propsBus_b, Hall.propsBus[2]) annotation (Line(
      points={{-37,33},{-37,12.5},{18,12.5}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(internalWall1.propsBus_a, Back.propsBus[1]) annotation (Line(
      points={{-37,43},{-37,75.7143},{18,75.7143}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(window.propsBus_a, Back.propsBus[2]) annotation (Line(
      points={{-107,57},{-107,75.1429},{18,75.1429}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(outerWall.propsBus_a, Back.propsBus[3:5]) annotation (Line(
      points={{-135,59},{-135,73.4286},{18,73.4286}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(window1.propsBus_a, Front.propsBus[2]) annotation (Line(
      points={{-109,-55},{-109,-44.8571},{20,-44.8571}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(outerWall1.propsBus_a, Front.propsBus[3:5]) annotation (Line(
      points={{-135,-55},{-135,-46.5714},{20,-46.5714}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(Back.TSensor, TSensor[1]) annotation (Line(
      points={{38.6,70},{76,70},{76,-66.6667},{156,-66.6667}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Hall.TSensor, TSensor[2]) annotation (Line(
      points={{38.6,8},{76,8},{76,-60},{156,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Front.TSensor, TSensor[3]) annotation (Line(
      points={{40.6,-50},{76,-50},{76,-53.3333},{156,-53.3333}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Back.gainCon, heatPortCon[1]) annotation (Line(
      points={{38,67},{74,67},{74,13.3333},{150,13.3333}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(Back.gainRad, heatPortRad[1]) annotation (Line(
      points={{38,64},{74,64},{74,-26.6667},{150,-26.6667}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(Hall.gainCon, heatPortCon[2]) annotation (Line(
      points={{38,5},{74,5},{74,20},{150,20}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(Hall.gainRad, heatPortRad[2]) annotation (Line(
      points={{38,2},{74,2},{74,-20},{150,-20}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(Front.gainCon, heatPortCon[3]) annotation (Line(
      points={{40,-53},{76,-53},{76,26.6667},{150,26.6667}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(Front.gainRad, heatPortRad[3]) annotation (Line(
      points={{40,-56},{76,-56},{76,-13.3333},{150,-13.3333}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(internalWall1.port_emb, heatPortEmb[1]) annotation (Line(
      points={{-23,38},{70,38},{70,60},{150,60},{150,55}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(internalWall.port_emb, heatPortEmb[2]) annotation (Line(
      points={{-23,-22},{64,-22},{64,65},{150,65}},
      color={191,0,0},
      smooth=Smooth.None));

  connect(floor[1], Back.propsBus[6]) annotation (Line(
      points={{-90,-84.6667},{-90,-82},{-62,-82},{-62,72},{-50,72},{-50,72.8571},
          {18,72.8571}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(floor[2], Hall.propsBus[3]) annotation (Line(
      points={{-90,-98},{-46,-98},{-46,12},{18,12},{18,11.5}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(floor[3], Front.propsBus[6]) annotation (Line(
      points={{-90,-111.333},{-90,-110},{-44,-110},{-44,-48},{20,-48},{20,
          -47.1429}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));

  connect(roof[1], Back.propsBus[7]) annotation (Line(
      points={{-90,84.6667},{-50,84.6667},{-50,72.2857},{18,72.2857}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(roof[2], Hall.propsBus[4]) annotation (Line(
      points={{-90,98},{-76,98},{-76,12},{18,12},{18,10.5}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(roof[3], Front.propsBus[7]) annotation (Line(
      points={{-90,111.333},{-90,112},{-70,112},{-70,-46},{20,-46},{20,-47.7143}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));

  connect(flowPort_Out[1], Back.flowPort_Out) annotation (Line(
      points={{-20,93.3333},{-16,93.3333},{-16,80},{26,80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(flowPort_In[1], Back.flowPort_In) annotation (Line(
      points={{20,93.3333},{8,93.3333},{8,80},{30,80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(flowPort_Out[2], Hall.flowPort_Out) annotation (Line(
      points={{-20,100},{-16,100},{-16,18},{26,18}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(flowPort_In[2], Hall.flowPort_In) annotation (Line(
      points={{20,100},{6,100},{6,18},{30,18}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(flowPort_Out[3], Front.flowPort_Out) annotation (Line(
      points={{-20,106.667},{-18,106.667},{-18,-40},{28,-40}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(flowPort_In[3], Front.flowPort_In) annotation (Line(
      points={{20,106.667},{8,106.667},{8,-42},{32,-42},{32,-40}},
      color={0,0,0},
      smooth=Smooth.None));

      ////////////////////
//
// for i in 1:3 loop
//   connect(sim.weaBus, roof[i].weaBus);
//   connect(sim.weaBus, floor[i].weaBus);
//
// end for;

     annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-150,
            -100},{150,100}}), graphics));
end AppartmentFloor;
