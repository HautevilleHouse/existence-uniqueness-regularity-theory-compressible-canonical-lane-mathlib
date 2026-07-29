import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean.Uniqueness

namespace HautevilleHouse
namespace ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean

structure RegularityPackage {P : CompressibleEulerPackage}
    {L : LocalExistencePackage P} {U : UniquenessPackage L} where
  sobolevRegularity : Prop
  bvRegularity : Prop
  smoothnessPropagation : Prop
  blowupCriteria : Prop
  higherRegularity : Prop

structure RegularityEvidence {P : CompressibleEulerPackage}
    {L : LocalExistencePackage P} {U : UniquenessPackage L}
    (R : RegularityPackage U) where
  sobolevRegularityClosed : R.sobolevRegularity
  bvRegularityClosed : R.bvRegularity
  smoothnessPropagationClosed : R.smoothnessPropagation
  blowupCriteriaClosed : R.blowupCriteria
  higherRegularityClosed : R.higherRegularity

def RegularityClosed {P : CompressibleEulerPackage}
    {L : LocalExistencePackage P} {U : UniquenessPackage L}
    (R : RegularityPackage U) : Prop :=
  R.sobolevRegularity ∧ R.bvRegularity ∧
  R.smoothnessPropagation ∧ R.blowupCriteria ∧ R.higherRegularity

theorem regularity_closed_from_evidence {P : CompressibleEulerPackage}
    {L : LocalExistencePackage P} {U : UniquenessPackage L}
    (R : RegularityPackage U) (E : RegularityEvidence R) :
    RegularityClosed R := by
  exact And.intro E.sobolevRegularityClosed
    (And.intro E.bvRegularityClosed
      (And.intro E.smoothnessPropagationClosed
        (And.intro E.blowupCriteriaClosed E.higherRegularityClosed)))

end ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean
end HautevilleHouse