import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalControlObservationSystemsTheoremCanonicalLaneLean

structure BoundedObservationPackage (A : AdmissibleClass) where
  sampleSpace : Type u
  sampleTopology : TopologicalSpace sampleSpace
  observationMap : sampleSpace → ℝ
  boundedRange : Set ℝ
  rangeBounded : boundedRange.IsBounded

structure BoundedObservationEvidence {A : AdmissibleClass} (P : BoundedObservationPackage A) where
  observationMapMeasurable : Measurable P.observationMap
  rangeBoundedClosed : P.rangeBounded

def BoundedObservationClosed {A : AdmissibleClass} (P : BoundedObservationPackage A) : Prop :=
  P.rangeBounded

theorem bounded_observation_closed_from_evidence {A : AdmissibleClass} (P : BoundedObservationPackage A) (E : BoundedObservationEvidence P) :
    BoundedObservationClosed P := by
  exact E.rangeBoundedClosed

end DigitalControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse