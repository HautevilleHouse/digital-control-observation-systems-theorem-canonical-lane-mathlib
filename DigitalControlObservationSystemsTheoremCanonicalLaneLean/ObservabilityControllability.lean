import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DigitalControlObservationSystemsTheoremCanonicalLaneLean.DigitalControlObservationSystem

namespace HautevilleHouse
namespace DigitalControlObservationSystemsTheoremCanonicalLaneLean

structure ObservabilityControllabilityPackage {S : DigitalControlObservationSystem} where
  observabilityGramianDefined : Prop
  controllabilityGramianDefined : Prop
  observabilityCondition : Prop
  controllabilityCondition : Prop
  dualityPrinciple : Prop

structure ObservabilityControllabilityEvidence {S : DigitalControlObservationSystem}
    (P : ObservabilityControllabilityPackage S) where
  observabilityGramianKnown : P.observabilityGramianDefined
  controllabilityGramianKnown : P.controllabilityGramianDefined
  observabilityConditionHeld : P.observabilityCondition
  controllabilityConditionHeld : P.controllabilityCondition
  dualityPrincipleClosed : P.dualityPrinciple

def ObservabilityControllabilityClosed {S : DigitalControlObservationSystem}
    (P : ObservabilityControllabilityPackage S) : Prop :=
  P.observabilityGramianDefined ∧ P.controllabilityGramianDefined ∧
  P.observabilityCondition ∧ P.controllabilityCondition ∧ P.dualityPrinciple

theorem observability_controllability_closed_from_evidence
    {S : DigitalControlObservationSystem} (P : ObservabilityControllabilityPackage S)
    (E : ObservabilityControllabilityEvidence P) : ObservabilityControllabilityClosed P := by
  exact And.intro E.observabilityGramianKnown
    (And.intro E.controllabilityGramianKnown
      (And.intro E.observabilityConditionHeld
        (And.intro E.controllabilityConditionHeld E.dualityPrincipleClosed)))

end DigitalControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse