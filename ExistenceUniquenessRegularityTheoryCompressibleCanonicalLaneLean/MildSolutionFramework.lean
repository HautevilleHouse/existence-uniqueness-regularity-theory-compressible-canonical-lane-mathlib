import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean

structure MildSolutionFramework where
  functionSpace : Type u
  integralOperator : Type v
  fixedPointArgument : Prop
  contractivityCondition : Prop
  smallnessCondition : Prop

structure MildSolutionEvidence (M : MildSolutionFramework) where
  fixedPointArgumentClosed : M.fixedPointArgument
  contractivityConditionClosed : M.contractivityCondition
  smallnessConditionClosed : M.smallnessCondition

def MildSolutionClosed (M : MildSolutionFramework) : Prop :=
  M.fixedPointArgument ∧ M.contractivityCondition ∧ M.smallnessCondition

theorem mild_solution_closed_from_evidence
    (M : MildSolutionFramework) (E : MildSolutionEvidence M) :
    MildSolutionClosed M := by
  exact And.intro E.fixedPointArgumentClosed
    (And.intro E.contractivityConditionClosed E.smallnessConditionClosed)

end ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean
end HautevilleHouse