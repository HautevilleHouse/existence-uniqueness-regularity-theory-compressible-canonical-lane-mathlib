import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean.CompressibleNavierStokesSystem

namespace HautevilleHouse
namespace ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean

structure WeakSolutionExistencePackage {G : AdmissibleClass} (S : CompressibleNavierStokesSystem G) where
  weakFormulation : Prop
  renormalizedContinuity : Prop
  momentumBalance : Prop
  energyInequality : Prop
  finiteEnergyInitialData : Prop

structure WeakSolutionExistenceEvidence {G : AdmissibleClass} {S : CompressibleNavierStokesSystem G} (W : WeakSolutionExistencePackage S) where
  weakFormulationClosed : W.weakFormulation
  renormalizedContinuityClosed : W.renormalizedContinuity
  momentumBalanceClosed : W.momentumBalance
  energyInequalityClosed : W.energyInequality
  finiteEnergyInitialDataClosed : W.finiteEnergyInitialData

def WeakSolutionExistenceClosed {G : AdmissibleClass} {S : CompressibleNavierStokesSystem G} (W : WeakSolutionExistencePackage S) : Prop :=
  W.weakFormulation ∧ W.renormalizedContinuity ∧ W.momentumBalance ∧ W.energyInequality ∧ W.finiteEnergyInitialData

theorem weak_solution_existence_closed_from_evidence {G : AdmissibleClass} {S : CompressibleNavierStokesSystem G} (W : WeakSolutionExistencePackage S) (E : WeakSolutionExistenceEvidence W) : WeakSolutionExistenceClosed W := by
  exact And.intro E.weakFormulationClosed (And.intro E.renormalizedContinuityClosed (And.intro E.momentumBalanceClosed (And.intro E.energyInequalityClosed E.finiteEnergyInitialDataClosed)))

end ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean
end HautevilleHouse