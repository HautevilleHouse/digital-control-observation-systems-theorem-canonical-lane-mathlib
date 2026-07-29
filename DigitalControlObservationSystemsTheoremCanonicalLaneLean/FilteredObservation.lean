import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalControlObservationSystemsTheoremCanonicalLaneLean

structure FilteredObservationPackage (A : AdmissibleClass) where
  sampleSpace : Type u
  sigmaAlgebra : MeasurableSpace sampleSpace
  filtration : ℕ → MeasurableSpace sampleSpace
  observationAdapted : ∀ n, MeasurableSpace.comap (fun x : sampleSpace => (x, x)) (filtration n ×ₘ filtration n) ≤ filtration n

structure FilteredObservationEvidence (F : FilteredObservationPackage A) where
  observationAdaptedClosed : F.observationAdapted

def FilteredObservationClosed (F : FilteredObservationPackage A) : Prop :=
  F.observationAdapted

theorem filtered_observation_closed_from_evidence (F : FilteredObservationPackage A) (E : FilteredObservationEvidence F) :
    FilteredObservationClosed F := by
  exact E.observationAdaptedClosed

end DigitalControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse