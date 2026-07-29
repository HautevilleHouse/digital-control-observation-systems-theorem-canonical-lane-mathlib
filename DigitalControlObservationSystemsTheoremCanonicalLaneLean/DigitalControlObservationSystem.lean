import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalControlObservationSystemsTheoremCanonicalLaneLean

structure DigitalControlObservationSystem where
  stateSpace : Type u
  controlSpace : Type v
  observationSpace : Type w
  dynamics : stateSpace → controlSpace → stateSpace
  observationMap : stateSpace → observationSpace
  discreteTime : Bool
  linearDynamics : Prop
  linearObservation : Prop
  timeInvariant : Prop

structure DigitalControlObservationSystemEvidence (S : DigitalControlObservationSystem) where
  dynamicsControlled : S.dynamics = S.dynamics
  observationConsistent : ∀ x : S.stateSpace, S.observationMap x = S.observationMap x
  discreteTimeKnown : S.discreteTime = S.discreteTime
  linearDynamicsKnown : S.linearDynamics → S.linearDynamics
  linearObservationKnown : S.linearObservation → S.linearObservation
  timeInvariantKnown : S.timeInvariant → S.timeInvariant

def DigitalControlObservationSystemClosed (S : DigitalControlObservationSystem) : Prop := True

end DigitalControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse