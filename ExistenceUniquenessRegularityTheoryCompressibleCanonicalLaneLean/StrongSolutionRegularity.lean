import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceUniquenessRegularityTheoryCompressible

structure StrongSolutionRegularityPackage where
  maximalRegularity : Prop
  higherRegularity : Prop
  continuationCriterion : Prop
  uniqueness : Prop

structure StrongSolutionRegularityEvidence (R : StrongSolutionRegularityPackage) where
  maximalRegularityClosed : R.maximalRegularity
  higherRegularityClosed : R.higherRegularity
  continuationCriterionClosed : R.continuationCriterion
  uniquenessClosed : R.uniqueness

def StrongSolutionRegularityClosed (R : StrongSolutionRegularityPackage) : Prop :=
  R.maximalRegularity ∧ R.higherRegularity ∧
  R.continuationCriterion ∧ R.uniqueness

theorem strong_solution_regularity_closed_from_evidence
    (R : StrongSolutionRegularityPackage) (E : StrongSolutionRegularityEvidence R) :
    StrongSolutionRegularityClosed R := by
  exact And.intro E.maximalRegularityClosed
    (And.intro E.higherRegularityClosed
      (And.intro E.continuationCriterionClosed E.uniquenessClosed))

end ExistenceUniquenessRegularityTheoryCompressible
end HautevilleHouse
