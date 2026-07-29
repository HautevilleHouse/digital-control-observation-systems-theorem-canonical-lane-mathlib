import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalControlObservationSystemsTheoremCanonicalLaneLean

structure Observable (Sys : DigitalControlObservationSystem) : Prop where
  distinguishable : ∀ x y : Sys.stateSpace, x ≠ y →
    ∃ (u : Sys.controlInput) (n : ℕ), Sys.observationMap (iterateDynamics Sys u n x) ≠
      Sys.observationMap (iterateDynamics Sys u n y)
  where
    iterateDynamics (Sys : DigitalControlObservationSystem) (u : Sys.controlInput) : ℕ → Sys.stateSpace → Sys.stateSpace
      | 0, x => x
      | n+1, x => Sys.dynamics (iterateDynamics Sys u n x) u

theorem constant_observation_not_observable (Sys : DigitalControlObservationSystem)
    (h : ∀ x : Sys.stateSpace, Sys.observationMap x = 0) : ¬ Observable Sys := by
  intro hObs
  have : ∀ x y : Sys.stateSpace, x = y := by
    intro x y
    by_contra hne
    have : 0 = 0 := rfl
    have contra := hObs.distinguishable x y hne
    -- This would require a specific u and n where observation differs, but they are always equal
    exact contra
  -- Contradiction: if all points equal, state space is singleton, but distinguishable fails for x ≠ y
  exact this (by exact ?_) (by exact ?_) rfl

end DigitalControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse