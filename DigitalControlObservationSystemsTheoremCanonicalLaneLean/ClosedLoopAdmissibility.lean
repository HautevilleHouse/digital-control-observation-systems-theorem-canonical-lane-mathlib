import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalControlObservationSystemsTheoremCanonicalLaneLean

structure ClosedLoopSystem (α : Type u) where
  process : SampledProcess α
  controller : Controller α
  initialCondition : process.stateSpace

theorem closed_loop_dynamics_well_defined (α : Type u) (cl : ClosedLoopSystem α) : cl.process.stateSpace := by
  exact cl.initialCondition

end DigitalControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse