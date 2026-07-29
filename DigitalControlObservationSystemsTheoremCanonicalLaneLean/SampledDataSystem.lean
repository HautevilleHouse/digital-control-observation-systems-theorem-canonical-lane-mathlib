import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalControlObservationSystemsTheoremCanonicalLaneLean

structure SampledDataSystem where
  plantType : String
  networkType : String
  samplingPeriod : ℕ
  controllerType : String
  initialConditions : Prop

structure SampledDataSystemEvidence (S : SampledDataSystem) where
  plantTypeClosed : S.plantType = "continuousTime"
  networkTypeClosed : S.networkType = "sharedBus"
  samplingPeriodClosed : S.samplingPeriod > 0
  controllerTypeClosed : S.controllerType = "stateFeedback"
  initialConditionsClosed : S.initialConditions

def SampledDataSystemClosed (S : SampledDataSystem) : Prop :=
  S.plantType = "continuousTime" ∧ S.networkType = "sharedBus" ∧
  S.samplingPeriod > 0 ∧ S.controllerType = "stateFeedback" ∧ S.initialConditions

theorem sampled_data_system_closed_from_evidence (S : SampledDataSystem) (E : SampledDataSystemEvidence S) :
    SampledDataSystemClosed S := by
  exact And.intro E.plantTypeClosed
    (And.intro E.networkTypeClosed
      (And.intro E.samplingPeriodClosed
        (And.intro E.controllerTypeClosed E.initialConditionsClosed)))

end DigitalControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse
