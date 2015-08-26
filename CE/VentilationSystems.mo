within CE;
package VentilationSystems
  model None "None"
    extends IDEAS.VentilationSystems.Ideal(final m_flow = zeros(nZones), final nLoads=1,redeclare
        package Medium =
            CE.Data.Medium);
  end None;
end VentilationSystems;
