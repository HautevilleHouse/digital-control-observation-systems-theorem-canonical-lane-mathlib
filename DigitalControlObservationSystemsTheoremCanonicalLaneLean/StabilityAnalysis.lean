import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalControlObservationSystemsTheoremCanonicalLaneLean

structure StabilityAnalysis where
  lyapunovFunctionType : String
  exponentialStability : Prop
  robustStability : Prop
  stabilityMargin : ℕ
  stabilityCondition : Prop

structure StabilityAnalysisEvidence (S : StabilityAnalysis) where
  lyapunovFunctionTypeClosed : S.lyapunovFunctionType = "quadratic"
  exponentialStabilityClosed : S.exponentialStability
  robustStabilityClosed : S.robustStability
  stabilityMarginClosed : S.stabilityMargin > 0
  stabilityConditionClosed : S.stabilityCondition

def StabilityAnalysisClosed (S : StabilityAnalysis) : Prop :=
  S.lyapunovFunctionType = "quadratic" ∧ S.exponentialStability ∧
  S.robustStability ∧ S.stabilityMargin > 0 ∧ S.stabilityCondition

theorem stability_analysis_closed_from_evidence (S : StabilityAnalysis) (E : StabilityAnalysisEvidence S) :
    StabilityAnalysisClosed S := by
  exact And.intro E.lyapunovFunctionTypeClosed
    (And.intro E.exponentialStabilityClosed
      (And.intro E.robustStabilityClosed
        (And.intro E.stabilityMarginClosed E.stabilityConditionClosed)))

end DigitalControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse
