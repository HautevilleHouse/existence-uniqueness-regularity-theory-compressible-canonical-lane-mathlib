import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean

structure ExistencePackage (E : CompressibleEulerPackage) where
  initialDataRegular : Prop
  localInTimeExistence : Prop
  maximalTimeInterval : Prop
  continuationCriterion : Prop

structure ExistenceEvidence {E : CompressibleEulerPackage} (P : ExistencePackage E) where
  initialDataRegularClosed : P.initialDataRegular
  localInTimeExistenceClosed : P.localInTimeExistence
  maximalTimeIntervalClosed : P.maximalTimeInterval
  continuationCriterionClosed : P.continuationCriterion

def ExistenceClosed {E : CompressibleEulerPackage} (P : ExistencePackage E) : Prop :=
  P.initialDataRegular ∧ P.localInTimeExistence ∧ P.maximalTimeInterval ∧ P.continuationCriterion

theorem existence_closed_from_evidence {E : CompressibleEulerPackage} (P : ExistencePackage E) (Ev : ExistenceEvidence P) : ExistenceClosed P := by
  exact And.intro Ev.initialDataRegularClosed (And.intro Ev.localInTimeExistenceClosed (And.intro Ev.maximalTimeIntervalClosed Ev.continuationCriterionClosed))

end ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean
end HautevilleHouse