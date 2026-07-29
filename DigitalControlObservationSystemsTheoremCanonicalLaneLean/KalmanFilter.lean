import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DigitalControlObservationSystemsTheoremCanonicalLaneLean.DigitalControlObservationSystem

namespace HautevilleHouse
namespace DigitalControlObservationSystemsTheoremCanonicalLaneLean

structure KalmanFilterPackage {S : DigitalControlObservationSystem} where
  processNoiseCovariance : Prop
  measurementNoiseCovariance : Prop
  initialEstimate : Prop
  initialErrorCovariance : Prop
  predictionStep : Prop
  updateStep : Prop
  optimalGain : Prop

structure KalmanFilterEvidence {S : DigitalControlObservationSystem}
    (K : KalmanFilterPackage S) where
  processNoiseCovarianceKnown : K.processNoiseCovariance
  measurementNoiseCovarianceKnown : K.measurementNoiseCovariance
  initialEstimateKnown : K.initialEstimate
  initialErrorCovarianceKnown : K.initialErrorCovariance
  predictionStepClosed : K.predictionStep
  updateStepClosed : K.updateStep
  optimalGainClosed : K.optimalGain

def KalmanFilterClosed {S : DigitalControlObservationSystem}
    (K : KalmanFilterPackage S) : Prop :=
  K.processNoiseCovariance ∧ K.measurementNoiseCovariance ∧
  K.initialEstimate ∧ K.initialErrorCovariance ∧
  K.predictionStep ∧ K.updateStep ∧ K.optimalGain

theorem kalman_filter_closed_from_evidence
    {S : DigitalControlObservationSystem} (K : KalmanFilterPackage S)
    (E : KalmanFilterEvidence K) : KalmanFilterClosed K := by
  exact And.intro E.processNoiseCovarianceKnown
    (And.intro E.measurementNoiseCovarianceKnown
      (And.intro E.initialEstimateKnown
        (And.intro E.initialErrorCovarianceKnown
          (And.intro E.predictionStepClosed
            (And.intro E.updateStepClosed E.optimalGainClosed)))))

end DigitalControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse