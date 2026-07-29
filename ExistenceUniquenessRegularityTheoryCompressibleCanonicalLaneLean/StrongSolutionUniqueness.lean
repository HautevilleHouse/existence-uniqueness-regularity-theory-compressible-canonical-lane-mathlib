import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean.WeakSolutionExistence

namespace HautevilleHouse
namespace ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean

structure StrongSolutionUniquenessPackage {G : AdmissibleClass} {S : CompressibleNavierStokesSystem G} (W : WeakSolutionExistencePackage S) where
  strongFormulation : Prop
  uniquenessCriterion : Prop
  comparisonPrinciple : Prop
  stabilityEstimate : Prop
  smoothInitialData : Prop

structure StrongSolutionUniquenessEvidence {G : AdmissibleClass} {S : CompressibleNavierStokesSystem G} {W : WeakSolutionExistencePackage S} (U : StrongSolutionUniquenessPackage W) where
  strongFormulationClosed : U.strongFormulation
  uniquenessCriterionClosed : U.uniquenessCriterion
  comparisonPrincipleClosed : U.comparisonPrinciple
  stabilityEstimateClosed : U.stabilityEstimate
  smoothInitialDataClosed : U.smoothInitialData

def StrongSolutionUniquenessClosed {G : AdmissibleClass} {S : CompressibleNavierStokesSystem G} {W : WeakSolutionExistencePackage S} (U : StrongSolutionUniquenessPackage W) : Prop :=
  U.strongFormulation ∧ U.uniquenessCriterion ∧ U.comparisonPrinciple ∧ U.stabilityEstimate ∧ U.smoothInitialData

theorem strong_solution_uniqueness_closed_from_evidence {G : AdmissibleClass} {S : CompressibleNavierStokesSystem G} {W : WeakSolutionExistencePackage S} (U : StrongSolutionUniquenessPackage W) (E : StrongSolutionUniquenessEvidence U) : StrongSolutionUniquenessClosed U := by
  exact And.intro E.strongFormulationClosed (And.intro E.uniquenessCriterionClosed (And.intro E.comparisonPrincipleClosed (And.intro E.stabilityEstimateClosed E.smoothInitialDataClosed)))

end ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean
end HautevilleHouse