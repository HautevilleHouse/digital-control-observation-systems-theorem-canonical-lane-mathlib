import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalControlObservationSystemsTheoremCanonicalLaneLean

structure ObserverGainPackage (A : AdmissibleClass) where
  stateDim : ℕ
  gainMatrix : Matrix (Fin stateDim) (Fin stateDim) ℝ
  gainCondition : Prop
  gainConditionProof : gainCondition

structure ObserverGainEvidence (O : ObserverGainPackage A) where
  gainConditionClosed : O.gainCondition

def ObserverGainClosed (O : ObserverGainPackage A) : Prop :=
  O.gainCondition

theorem observer_gain_closed_from_evidence (O : ObserverGainPackage A) (E : ObserverGainEvidence O) :
    ObserverGainClosed O := by
  exact E.gainConditionClosed

end DigitalControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse