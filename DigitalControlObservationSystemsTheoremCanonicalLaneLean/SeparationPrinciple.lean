import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalControlObservationSystemsTheoremCanonicalLaneLean

structure SeparationPrinciplePackage (A : AdmissibleClass) where
  controllerDesigned : Prop
  observerDesigned : Prop
  closedLoopStable : Prop
  stabilityProof : closedLoopStable

structure SeparationPrincipleEvidence (S : SeparationPrinciplePackage A) where
  controllerDesignedClosed : S.controllerDesigned
  observerDesignedClosed : S.observerDesigned
  closedLoopStableClosed : S.closedLoopStable

def SeparationPrincipleClosed (S : SeparationPrinciplePackage A) : Prop :=
  S.controllerDesigned ∧ S.observerDesigned ∧ S.closedLoopStable

theorem separation_principle_closed_from_evidence (S : SeparationPrinciplePackage A) (E : SeparationPrincipleEvidence S) :
    SeparationPrincipleClosed S := by
  exact And.intro E.controllerDesignedClosed (And.intro E.observerDesignedClosed E.closedLoopStableClosed)

end DigitalControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse