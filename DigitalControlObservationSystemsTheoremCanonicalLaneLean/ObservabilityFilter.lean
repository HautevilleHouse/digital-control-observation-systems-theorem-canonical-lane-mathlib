import DigitalControlObservationSystemsTheoremCanonicalLaneLean.DigitalControlObservationSystems

namespace HautevilleHouse
namespace DigitalControlObservationSystemsTheoremCanonicalLaneLean

structure ObservabilityFilter {S : DigitalControlObservationSystem} where
  indistinguishableStates : Set (S.stateSpace × S.stateSpace)
  observabilityMatrixRankCondition : Prop
  filterStability : Prop
  indistinguishableStatesTerm : indistinguishableStates = {(x, y) | x = y}
  observabilityMatrixRankConditionTerm : observabilityMatrixRankCondition
  filterStabilityTerm : filterStability

structure ObservabilityEvidence {S : DigitalControlObservationSystem} (O : ObservabilityFilter S) where
  indistinguishableStatesClosed : O.indistinguishableStates = {(x, y) | x = y}
  observabilityMatrixRankConditionClosed : O.observabilityMatrixRankCondition
  filterStabilityClosed : O.filterStability

def ObservabilityClosed {S : DigitalControlObservationSystem} (O : ObservabilityFilter S) : Prop :=
  O.indistinguishableStates = {(x, y) | x = y} ∧ O.observabilityMatrixRankCondition ∧ O.filterStability

theorem observability_closed_from_evidence
  {S : DigitalControlObservationSystem} (O : ObservabilityFilter S)
  (E : ObservabilityEvidence O) : ObservabilityClosed O :=
by
  exact And.intro E.indistinguishableStatesClosed
    (And.intro E.observabilityMatrixRankConditionClosed E.filterStabilityClosed)

end DigitalControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse