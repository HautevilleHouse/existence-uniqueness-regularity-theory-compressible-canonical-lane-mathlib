import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceUniquenessRegularityTheoryCompressible

structure WeakSolutionEnergyPackage where
  renormalizedSolution : Prop
  entropyCondition : Prop
  energyEstimate : Prop
  relativeEntropy : Prop

structure WeakSolutionEnergyEvidence (E : WeakSolutionEnergyPackage) where
  renormalizedSolutionClosed : E.renormalizedSolution
  entropyConditionClosed : E.entropyCondition
  energyEstimateClosed : E.energyEstimate
  relativeEntropyClosed : E.relativeEntropy

def WeakSolutionEnergyClosed (E : WeakSolutionEnergyPackage) : Prop :=
  E.renormalizedSolution ∧ E.entropyCondition ∧
  E.energyEstimate ∧ E.relativeEntropy

theorem weak_solution_energy_closed_from_evidence
    (E : WeakSolutionEnergyPackage) (Ev : WeakSolutionEnergyEvidence E) :
    WeakSolutionEnergyClosed E := by
  exact And.intro Ev.renormalizedSolutionClosed
    (And.intro Ev.entropyConditionClosed
      (And.intro Ev.energyEstimateClosed Ev.relativeEntropyClosed))

end ExistenceUniquenessRegularityTheoryCompressible
end HautevilleHouse
