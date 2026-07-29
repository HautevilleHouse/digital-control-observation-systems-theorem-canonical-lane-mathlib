import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalControlObservationSystemsTheoremCanonicalLaneLean

def ConstrainedDigitalControlObservationClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_digital_control_observation_endgame (A : AdmissibleClass) :
    ConstrainedDigitalControlObservationClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DigitalControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse
