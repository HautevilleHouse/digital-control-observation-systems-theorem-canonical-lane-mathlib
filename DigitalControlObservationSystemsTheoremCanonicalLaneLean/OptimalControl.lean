import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DigitalControlObservationSystemsTheoremCanonicalLaneLean.DigitalControlObservationSystem

namespace HautevilleHouse
namespace DigitalControlObservationSystemsTheoremCanonicalLaneLean

structure OptimalControlPackage {S : DigitalControlObservationSystem} where
  costFunctionDefined : Prop
  hamiltonJacobiBellmanEquation : Prop
  optimalControlLaw : Prop
  valueFunctionDefined : Prop
  dynamicProgrammingPrinciple : Prop

structure OptimalControlEvidence {S : DigitalControlObservationSystem}
    (O : OptimalControlPackage S) where
  costFunctionKnown : O.costFunctionDefined
  hjbEquationClosed : O.hamiltonJacobiBellmanEquation
  optimalControlLawClosed : O.optimalControlLaw
  valueFunctionClosed : O.valueFunctionDefined
  dynamicProgrammingPrincipleClosed : O.dynamicProgrammingPrinciple

def OptimalControlClosed {S : DigitalControlObservationSystem}
    (O : OptimalControlPackage S) : Prop :=
  O.costFunctionDefined ∧ O.hamiltonJacobiBellmanEquation ∧
  O.optimalControlLaw ∧ O.valueFunctionDefined ∧ O.dynamicProgrammingPrinciple

theorem optimal_control_closed_from_evidence
    {S : DigitalControlObservationSystem} (O : OptimalControlPackage S)
    (E : OptimalControlEvidence O) : OptimalControlClosed O := by
  exact And.intro E.costFunctionKnown
    (And.intro E.hjbEquationClosed
      (And.intro E.optimalControlLawClosed
        (And.intro E.valueFunctionClosed E.dynamicProgrammingPrincipleClosed)))

end DigitalControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse