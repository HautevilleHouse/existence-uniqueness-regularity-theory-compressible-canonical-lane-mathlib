import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean

structure WeakSolutionCompactnessPackage where
  weakSolutionSequence : Type u
  uniformBounds : Prop
  weakLimit : Prop
  stabilityUnderLimit : Prop

structure WeakSolutionCompactnessEvidence (W : WeakSolutionCompactnessPackage) where
  uniformBoundsClosed : W.uniformBounds
  weakLimitClosed : W.weakLimit
  stabilityUnderLimitClosed : W.stabilityUnderLimit

def WeakSolutionCompactnessClosed (W : WeakSolutionCompactnessPackage) : Prop :=
  W.uniformBounds ∧ W.weakLimit ∧ W.stabilityUnderLimit

theorem weak_solution_compactness_closed_from_evidence
    (W : WeakSolutionCompactnessPackage) (E : WeakSolutionCompactnessEvidence W) :
    WeakSolutionCompactnessClosed W := by
  exact And.intro E.uniformBoundsClosed
    (And.intro E.weakLimitClosed E.stabilityUnderLimitClosed)

end ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean
end HautevilleHouse