import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalControlObservationSystemsTheoremCanonicalLaneLean

structure LinearQuadraticRegulatorPackage (A : AdmissibleClass) where
  stateDim : ℕ
  controlDim : ℕ
  costWeightState : Matrix (Fin stateDim) (Fin stateDim) ℝ
  costWeightControl : Matrix (Fin controlDim) (Fin controlDim) ℝ
  costWeightStatePositiveSemidefinite : costWeightState.PosSemidef
  costWeightControlPositiveDefinite : costWeightControl.PosDef

structure LinearQuadraticRegulatorEvidence (L : LinearQuadraticRegulatorPackage A) where
  costWeightStatePositiveSemidefiniteClosed : L.costWeightStatePositiveSemidefinite
  costWeightControlPositiveDefiniteClosed : L.costWeightControlPositiveDefinite

def LinearQuadraticRegulatorClosed (L : LinearQuadraticRegulatorPackage A) : Prop :=
  L.costWeightStatePositiveSemidefinite ∧ L.costWeightControlPositiveDefinite

theorem linear_quadratic_regulator_closed_from_evidence (L : LinearQuadraticRegulatorPackage A) (E : LinearQuadraticRegulatorEvidence L) :
    LinearQuadraticRegulatorClosed L := by
  exact And.intro E.costWeightStatePositiveSemidefiniteClosed E.costWeightControlPositiveDefiniteClosed

end DigitalControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse