import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean

structure UniquenessPackage {E : CompressibleEulerPackage} (P : ExistencePackage E) where
  energyEstimates : Prop
  stabilityEstimate : Prop
  weakStrongUniqueness : Prop
  admissibleWeakSolutions : Prop

structure UniquenessEvidence {E : CompressibleEulerPackage} {P : ExistencePackage E} (U : UniquenessPackage P) where
  energyEstimatesClosed : U.energyEstimates
  stabilityEstimateClosed : U.stabilityEstimate
  weakStrongUniquenessClosed : U.weakStrongUniqueness
  admissibleWeakSolutionsClosed : U.admissibleWeakSolutions

def UniquenessClosed {E : CompressibleEulerPackage} {P : ExistencePackage E} (U : UniquenessPackage P) : Prop :=
  U.energyEstimates ∧ U.stabilityEstimate ∧ U.weakStrongUniqueness ∧ U.admissibleWeakSolutions

theorem uniqueness_closed_from_evidence {E : CompressibleEulerPackage} {P : ExistencePackage E} (U : UniquenessPackage P) (Ev : UniquenessEvidence U) : UniquenessClosed U := by
  exact And.intro Ev.energyEstimatesClosed (And.intro Ev.stabilityEstimateClosed (And.intro Ev.weakStrongUniquenessClosed Ev.admissibleWeakSolutionsClosed))

end ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean
end HautevilleHouse