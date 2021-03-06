within IDEAS.Buildings.Components.Shading;
model ShadingControl "shading control based on irradiation"

  parameter Real uLow=250 "upper limit above which shading goes down";
  parameter Real uHigh=150 "lower limit below which shading goes up again";
  IDEAS.Controls.Control_fixme.Hyst_NoEvent hyst(uLow=uLow, uHigh=uHigh);
  Modelica.Blocks.Interfaces.RealInput irr "irradiance on the depicted surface"
    annotation (Placement(transformation(extent={{-128,30},{-88,70}}),
        iconTransformation(extent={{-108,50},{-88,70}})));
  Modelica.Blocks.Interfaces.RealOutput y "control signal"
    annotation (Placement(transformation(extent={{90,50},{110,70}})));

  //  Modelica.Blocks.Interfaces.RealInput TSensor
  //    annotation (Placement(transformation(extent={{-120,0},{-80,40}})));
equation
  hyst.u = irr;
  if noEvent(time > 8E6) and noEvent(time < 2.6E7) then
    hyst.y = y;
  else
    y = 0;
  end if;
  annotation (
    Diagram(graphics),
    Icon(graphics={Rectangle(
          extent={{-74,56},{74,-58}},
          lineColor={95,95,95},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),Rectangle(
          extent={{48,36},{54,-40}},
          lineColor={70,70,70},
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid),Rectangle(
          extent={{22,36},{28,-40}},
          lineColor={70,70,70},
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid),Rectangle(
          extent={{-4,36},{2,-40}},
          lineColor={70,70,70},
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid),Rectangle(
          extent={{-30,36},{-24,-40}},
          lineColor={70,70,70},
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid),Ellipse(
          extent={{-54,34},{-46,26}},
          lineColor={255,255,255},
          fillColor={128,255,0},
          fillPattern=FillPattern.Solid),Polygon(
          points={{-34,-6},{-22,-6},{-16,-12},{-22,-18},{-34,-18},{-34,-6}},
          lineColor={0,0,127},
          smooth=Smooth.None,
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid),Polygon(
          points={{-8,10},{4,10},{10,4},{4,-2},{-8,-2},{-8,10}},
          lineColor={0,0,127},
          smooth=Smooth.None,
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid),Polygon(
          points={{18,-2},{30,-2},{36,-8},{30,-14},{18,-14},{18,-2}},
          lineColor={0,0,127},
          smooth=Smooth.None,
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid),Polygon(
          points={{46,14},{58,14},{64,8},{58,2},{46,2},{46,14}},
          lineColor={0,0,127},
          smooth=Smooth.None,
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid)}),
    Documentation(info="<html>
<p><h4><font color=\"#008000\">General description</font></h4></p>
<p><h4>Goal</h4></p>
<p>The <code>ShadingControl.mo</code> model describes the shadeing controller lwoering the shadeing at a default irradiance level of 250 W/m2 and raising again at 150 W/m2 (values are input parameters).</p>
</html>"));
end ShadingControl;
