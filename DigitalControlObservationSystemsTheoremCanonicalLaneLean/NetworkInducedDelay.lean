import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalControlObservationSystemsTheoremCanonicalLaneLean

structure NetworkInducedDelay where
  maxDelay : ℕ
  jitter : ℕ
  packetDropProbability : ℚ
  delayModel : String
  constantDelay : Prop

structure NetworkInducedDelayEvidence (D : NetworkInducedDelay) where
  maxDelayClosed : D.maxDelay < 100
  jitterClosed : D.jitter ≤ D.maxDelay
  packetDropProbabilityClosed : D.packetDropProbability < 0.01
  delayModelClosed : D.delayModel = "bounded"
  constantDelayClosed : D.constantDelay

def NetworkInducedDelayClosed (D : NetworkInducedDelay) : Prop :=
  D.maxDelay < 100 ∧ D.jitter ≤ D.maxDelay ∧
  D.packetDropProbability < 0.01 ∧ D.delayModel = "bounded" ∧ D.constantDelay

theorem network_induced_delay_closed_from_evidence (D : NetworkInducedDelay) (E : NetworkInducedDelayEvidence D) :
    NetworkInducedDelayClosed D := by
  exact And.intro E.maxDelayClosed
    (And.intro E.jitterClosed
      (And.intro E.packetDropProbabilityClosed
        (And.intro E.delayModelClosed E.constantDelayClosed)))

end DigitalControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse
