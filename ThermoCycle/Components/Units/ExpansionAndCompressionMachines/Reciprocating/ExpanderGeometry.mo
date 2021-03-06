within ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Reciprocating;
record ExpanderGeometry =
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Reciprocating.BaseClasses.BaseGeometry
    (
    l_conrod=0.15,
    d_ppin=0.001,
    r_crank=0.05,
    r_piston=0.05,
    V_tdc=50e-6,
    h_piston=0.05,
    d_inlet=0.05,
    d_outlet=0.05,
    zeta_inout=0.0005,
    d_leak=0.00005,
    zeta_leak=0.5) "Small scale ORC expander";
