import DigitalControlObservationSystemsTheoremCanonicalLaneLean.DigitalControlObservationSystems

namespace HautevilleHouse
namespace DigitalControlObservationSystemsTheoremCanonicalLaneLean

structure ControllabilityStructure {S : DigitalControlObservationSystem} where
  reachableSet : Set S.stateSpace
  controllabilityCondition : Prop
  timeOptimalControl : Prop
  controllabilityConditionTerm : controllabilityCondition
  timeOptimalControlTerm : timeOptimalControl

structure ControllabilityEvidence {S : DigitalControlObservationSystem} (C : ControllabilityStructure S) where
  reachableSetClosed : C.reachableSet = Set.univ
  controllabilityConditionClosed : C.controllabilityCondition
  timeOptimalControlClosed : C.timeOptimalControl

def ControllabilityClosed {S : DigitalControlObservationSystem} (C : ControllabilityStructure S) : Prop :=
  C.reachableSet = Set.univ ∧ C.controllabilityCondition ∧ C.timeOptimalControl

theorem controllability_closed_from_evidence
  {S : DigitalControlObservationSystem} (C : ControllabilityStructure S)
  (E : ControllabilityEvidence C) : ControllabilityClosed C :=
by
  exact And.intro E.reachableSetClosed
    (And.intro E.controllabilityConditionClosed E.timeOptimalControlClosed)

end DigitalControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse