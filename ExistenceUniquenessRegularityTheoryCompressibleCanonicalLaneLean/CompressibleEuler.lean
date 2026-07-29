import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean

structure CompressibleEulerPackage where
  density : Type u
  velocity : Type v
  pressure : Type w
  equationOfState : Prop
  conservationOfMass : Prop
  conservationOfMomentum : Prop
  weakSolutionDefined : Prop

structure CompressibleEulerEvidence (E : CompressibleEulerPackage) where
  equationOfStateClosed : E.equationOfState
  conservationOfMassClosed : E.conservationOfMass
  conservationOfMomentumClosed : E.conservationOfMomentum
  weakSolutionDefinedClosed : E.weakSolutionDefined

def CompressibleEulerClosed (E : CompressibleEulerPackage) : Prop :=
  E.equationOfState ∧ E.conservationOfMass ∧ E.conservationOfMomentum ∧ E.weakSolutionDefined

theorem compressible_euler_closed_from_evidence (E : CompressibleEulerPackage) (Ev : CompressibleEulerEvidence E) : CompressibleEulerClosed E := by
  exact And.intro Ev.equationOfStateClosed (And.intro Ev.conservationOfMassClosed (And.intro Ev.conservationOfMomentumClosed Ev.weakSolutionDefinedClosed))

end ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean
end HautevilleHouse