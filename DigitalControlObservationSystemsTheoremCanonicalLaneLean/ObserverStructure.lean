import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalControlObservationSystemsTheoremCanonicalLaneLean

structure ObserverStructure where
  observerType : String
  gainMatrixType : String
  observerDynamics : Prop
  stateEstimates : Prop
  convergenceCondition : Prop

structure ObserverStructureEvidence (O : ObserverStructure) where
  observerTypeClosed : O.observerType = "luenberger"
  gainMatrixTypeClosed : O.gainMatrixType = "constant"
  observerDynamicsClosed : O.observerDynamics
  stateEstimatesClosed : O.stateEstimates
  convergenceConditionClosed : O.convergenceCondition

def ObserverStructureClosed (O : ObserverStructure) : Prop :=
  O.observerType = "luenberger" ∧ O.gainMatrixType = "constant" ∧
  O.observerDynamics ∧ O.stateEstimates ∧ O.convergenceCondition

theorem observer_structure_closed_from_evidence (O : ObserverStructure) (E : ObserverStructureEvidence O) :
    ObserverStructureClosed O := by
  exact And.intro E.observerTypeClosed
    (And.intro E.gainMatrixTypeClosed
      (And.intro E.observerDynamicsClosed
        (And.intro E.stateEstimatesClosed E.convergenceConditionClosed)))

end DigitalControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse
