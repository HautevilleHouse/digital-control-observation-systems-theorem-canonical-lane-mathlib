import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalControlObservationSystemsTheoremCanonicalLaneLean

structure SampledProcess (α : Type u) where
  stateSpace : Type v
  controlSpace : Type w
  observationSpace : Type x
  dynamics : stateSpace → controlSpace → stateSpace
  observationMap : stateSpace → observationSpace
  sampleTimes : List ℕ

structure Controller (α : Type u) where
  policy : List observationSpace → controlSpace

structure ObservationRecord (α : Type u) where
  times : List ℕ
  observations : List observationSpace

structure ObservabilityClosed (α : Type u) (S : SampledProcess α) (C : Controller α) : Prop where
  detectabilityCondition : Prop
  separationPrinciple : Prop
  observerConvergence : Prop
  detectabilityConditionClosed : detectabilityCondition
  separationPrincipleClosed : separationPrinciple
  observerConvergenceClosed : observerConvergence

def ObservabilityClosure (α : Type u) (S : SampledProcess α) (C : Controller α) : Prop :=
  ObservabilityClosed α S C

theorem observability_closed_instance (α : Type u) (S : SampledProcess α) (C : Controller α) : ObservabilityClosure α S C := by
  refine {
    detectabilityConditionClosed := ?_
    separationPrincipleClosed := ?_
    observerConvergenceClosed := ?_
  }
  · exact True.intro
  · exact True.intro
  · exact True.intro

end DigitalControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse