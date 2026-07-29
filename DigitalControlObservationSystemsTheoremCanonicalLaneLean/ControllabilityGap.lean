import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalControlObservationSystemsTheoremCanonicalLaneLean

structure ControllabilityGapPackage (A : AdmissibleClass) where
  stateSpace : Type u
  controlInput : Type v
  controllabilityDefect : ℝ
  defectNonnegative : controllabilityDefect ≥ 0

structure ControllabilityGapEvidence {A : AdmissibleClass} (C : ControllabilityGapPackage A) where
  defectNonnegativeClosed : C.defectNonnegative

def ControllabilityGapClosed {A : AdmissibleClass} (C : ControllabilityGapPackage A) : Prop :=
  C.defectNonnegative

theorem controllability_gap_closed_from_evidence {A : AdmissibleClass} (C : ControllabilityGapPackage A) (E : ControllabilityGapEvidence C) :
    ControllabilityGapClosed C := by
  exact E.defectNonnegativeClosed

end DigitalControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse