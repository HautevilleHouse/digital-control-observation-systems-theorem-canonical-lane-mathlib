import DigitalControlObservationSystemsTheoremCanonicalLaneLean.DigitalControlObservationSystems
import DigitalControlObservationSystemsTheoremCanonicalLaneLean.ControllabilityStructure
import DigitalControlObservationSystemsTheoremCanonicalLaneLean.ObservabilityFilter

namespace HautevilleHouse
namespace DigitalControlObservationSystemsTheoremCanonicalLaneLean

structure SeparatorPrinciple {S : DigitalControlObservationSystem}
  (C : ControllabilityStructure S) (O : ObservabilityFilter S) where
  separationCondition : Prop
  stateEstimateAchievable : Prop
  separationConditionTerm : separationCondition
  stateEstimateAchievableTerm : stateEstimateAchievable

structure SeparatorPrincipleEvidence {S : DigitalControlObservationSystem}
  {C : ControllabilityStructure S} {O : ObservabilityFilter S}
  (P : SeparatorPrinciple C O) where
  separationConditionClosed : P.separationCondition
  stateEstimateAchievableClosed : P.stateEstimateAchievable

def SeparatorPrincipleClosed {S : DigitalControlObservationSystem}
  {C : ControllabilityStructure S} {O : ObservabilityFilter S}
  (P : SeparatorPrinciple C O) : Prop :=
  P.separationCondition ∧ P.stateEstimateAchievable

theorem separator_principle_closed_from_evidence
  {S : DigitalControlObservationSystem} {C : ControllabilityStructure S}
  {O : ObservabilityFilter S} (P : SeparatorPrinciple C O)
  (E : SeparatorPrincipleEvidence P) : SeparatorPrincipleClosed P :=
by
  exact And.intro E.separationConditionClosed E.stateEstimateAchievableClosed

end DigitalControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse