import DigitalControlObservationSystemsTheoremCanonicalLaneLean.DigitalControlObservationSystems
import DigitalControlObservationSystemsTheoremCanonicalLaneLean.SeparatorPrinciple

namespace HautevilleHouse
namespace DigitalControlObservationSystemsTheoremCanonicalLaneLean

structure DualControlTheory {S : DigitalControlObservationSystem}
  {C : ControllabilityStructure S} {O : ObservabilityFilter S}
  (P : SeparatorPrinciple C O) where
  dualControlObservationMap : S.controlSpace → S.observationSpace
  optimalControlDerived : Prop
  optimalControlDerivedTerm : optimalControlDerived

structure DualControlEvidence {S : DigitalControlObservationSystem}
  {C : ControllabilityStructure S} {O : ObservabilityFilter S}
  {P : SeparatorPrinciple C O} (D : DualControlTheory P) where
  optimalControlDerivedClosed : D.optimalControlDerived

def DualControlClosed {S : DigitalControlObservationSystem}
  {C : ControllabilityStructure S} {O : ObservabilityFilter S}
  {P : SeparatorPrinciple C O} (D : DualControlTheory P) : Prop :=
  D.optimalControlDerived

theorem dual_control_closed_from_evidence
  {S : DigitalControlObservationSystem} {C : ControllabilityStructure S}
  {O : ObservabilityFilter S} {P : SeparatorPrinciple C O}
  (D : DualControlTheory P) (E : DualControlEvidence D) : DualControlClosed D :=
by
  exact E.optimalControlDerivedClosed

end DigitalControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse