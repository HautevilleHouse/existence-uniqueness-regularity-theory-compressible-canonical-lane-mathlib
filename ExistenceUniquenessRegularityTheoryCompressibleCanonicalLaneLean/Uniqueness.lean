import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean.LocalExistence

namespace HautevilleHouse
namespace ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean

structure UniquenessPackage {P : CompressibleEulerPackage}
    {L : LocalExistencePackage P} where
  stabilityEstimates : Prop
  weakStrongUniqueness : Prop
  bvBound : Prop
  entropyAdmissibilityForUniqueness : Prop

structure UniquenessEvidence {P : CompressibleEulerPackage}
    {L : LocalExistencePackage P} (U : UniquenessPackage L) where
  stabilityEstimatesClosed : U.stabilityEstimates
  weakStrongUniquenessClosed : U.weakStrongUniqueness
  bvBoundClosed : U.bvBound
  entropyAdmissibilityForUniquenessClosed : U.entropyAdmissibilityForUniqueness

def UniquenessClosed {P : CompressibleEulerPackage}
    {L : LocalExistencePackage P} (U : UniquenessPackage L) : Prop :=
  U.stabilityEstimates ∧ U.weakStrongUniqueness ∧
  U.bvBound ∧ U.entropyAdmissibilityForUniqueness

theorem uniqueness_closed_from_evidence {P : CompressibleEulerPackage}
    {L : LocalExistencePackage P} (U : UniquenessPackage L)
    (E : UniquenessEvidence U) : UniquenessClosed U := by
  exact And.intro E.stabilityEstimatesClosed
    (And.intro E.weakStrongUniquenessClosed
      (And.intro E.bvBoundClosed E.entropyAdmissibilityForUniquenessClosed))

end ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean
end HautevilleHouse