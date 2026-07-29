import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean

structure CompressibleEulerPackage where
  timeDomain : Type u
  spaceDomain : Type v
  density : timeDomain -> spaceDomain -> ℝ
  velocity : timeDomain -> spaceDomain -> ℝ ^{3}
  pressure : timeDomain -> spaceDomain -> ℝ
  energy : timeDomain -> spaceDomain -> ℝ
  equationOfState : Prop
  weakFormulation : Prop
  entropyCondition : Prop
  initialDataSmooth : Prop
  boundaryConditionsImposed : Prop

structure CompressibleEulerEvidence (P : CompressibleEulerPackage) where
  equationOfStateClosed : P.equationOfState
  weakFormulationClosed : P.weakFormulation
  entropyConditionClosed : P.entropyCondition
  initialDataSmoothClosed : P.initialDataSmooth
  boundaryConditionsImposedClosed : P.boundaryConditionsImposed

def CompressibleEulerClosed (P : CompressibleEulerPackage) : Prop :=
  P.equationOfState ∧ P.weakFormulation ∧ P.entropyCondition ∧
  P.initialDataSmooth ∧ P.boundaryConditionsImposed

theorem compressible_euler_closed_from_evidence (P : CompressibleEulerPackage)
    (E : CompressibleEulerEvidence P) : CompressibleEulerClosed P := by
  exact And.intro E.equationOfStateClosed
    (And.intro E.weakFormulationClosed
      (And.intro E.entropyConditionClosed
        (And.intro E.initialDataSmoothClosed E.boundaryConditionsImposedClosed)))

end ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean
end HautevilleHouse