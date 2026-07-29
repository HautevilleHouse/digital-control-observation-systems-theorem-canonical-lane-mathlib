import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalControlObservationSystemsTheoremCanonicalLaneLean

structure DigitalControlObservationSystem where
  stateSpace : Type
  controlInput : Type
  observationOutput : Type
  dynamics : stateSpace → controlInput → stateSpace
  observationMap : stateSpace → observationOutput

def controlSystemBridgeClosed (Sys : DigitalControlObservationSystem) : Prop :=
  ∀ (x : Sys.stateSpace) (u : Sys.controlInput),
    Sys.observationMap (Sys.dynamics x u) = Sys.observationMap x

theorem bridge_from_system (System : DigitalControlObservationSystem)
    (h : ∀ (x : System.stateSpace) (u : System.controlInput),
          System.dynamics x u = x) : controlSystemBridgeClosed System := by
  intro x u
  rw [h x u]

end DigitalControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse