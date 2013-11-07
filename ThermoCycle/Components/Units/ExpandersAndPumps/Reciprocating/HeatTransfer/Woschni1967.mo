within ThermoCycle.Components.Units.ExpandersAndPumps.Reciprocating.HeatTransfer;
model Woschni1967 "Recip ICE correlation of Woschni 1967"
  extends
    ThermoCycle.Components.Units.ExpandersAndPumps.Reciprocating.HeatTransfer.RePrHeatTransfer(
     final a = 0.035, final b = 0.800, final c = 0.000);

  import Modelica.Constants.pi;
  Modelica.SIunits.Velocity[n]        c_m "Piston speed";
  Modelica.SIunits.Angle[n]           theta "Crankshaft angle";
  Modelica.SIunits.AngularVelocity[n] omega "Angular crank velocity";
  Modelica.SIunits.Length             bore;

equation
  pistonCrossArea = pi*bore*bore/4 "Defines bore";
  for i in 1:n loop
    theta[i] = mod(crankshaftAngle,2*pi) "Promote input to array";
    omega[i] = der(crankshaftAngle) "Use continuous input for derivative";
    assert(noEvent(omega[i] > 1e-6), "Very low rotational speed, make sure connected the crank angle input properly.", level=  AssertionLevel.warning);
    assert(noEvent(strokeLength > 1e-6), "Very short stroke length, make sure you set the parameter in your cylinder model.", level=  AssertionLevel.warning);

    c_m[i] = omega[i]/2/pi*strokeLength;

    //Use compression phase only, neglect scavenging and combustion terms.
    Lambda[i] = 2.28*c_m[i];
    Gamma[i]  = bore;

  end for;

  annotation(Documentation(info="<html>
<body>
<h4>Reference: </h4>
<dl>
<dt><a name=\"Woschni1967\">(Woschni1967)</a></dt>
<dd>Woschni, G.</dd>
<dd><i>A Universally Applicable Equation for the Instantaneous Heat Transfer Coefficient in the Internal Combustion Engine</i></dd>
<dd>SAE Preprints, Society of Automotive Engineers (SAE), <b>1967</b>(670931)</dd>
</dl>
<p>You can find the paper describing the correlation here: <a href=\"http://papers.sae.org/670931/\">http://papers.sae.org/670931/</a> </p>
<h4>Implementation: </h4>
<p>2013 for Technical University of Denmark, DTU Mechanical Engineering, Kongens Lyngby, Denmark by Jorrit Wronski (jowr@mek.dtu.dk) </p>
</body>
</html>


"));
end Woschni1967;