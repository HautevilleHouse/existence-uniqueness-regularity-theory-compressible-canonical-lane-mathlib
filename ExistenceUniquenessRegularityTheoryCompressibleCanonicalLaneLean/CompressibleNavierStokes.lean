import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean

structure CompressibleNavierStokesPackage where
  density : Type u
  velocity : Type v
  pressure : Type w
  viscosityCoefficient : Prop
  heatConductivityCoefficient : Prop
  equationOfState : Prop
  initialDensity : Prop
  initialVelocity : Prop
  boundaryConditions : Prop
  timeInterval : Prop

structure CompressibleNavierStokesEvidence (C : CompressibleNavierStokesPackage) where
  viscosityCoefficientClosed : C.viscosityCoefficient
  heatConductivityCoefficientClosed : C.heatConductivityCoefficient
  equationOfStateClosed : C.equationOfState
  initialDensityClosed : C.initialDensity
  initialVelocityClosed : C.initialVelocity
  boundaryConditionsClosed : C.boundaryConditions
  timeIntervalClosed : C.timeInterval

def CompressibleNavierStokesClosed (C : CompressibleNavierStokesPackage) : Prop :=
  C.viscosityCoefficient ∧ C.heatConductivityCoefficient ∧
  C.equationOfState ∧ C.initialDensity ∧
  C.initialVelocity ∧ C.boundaryConditions ∧
  C.timeInterval

theorem compressible_navier_stokes_closed_from_evidence
    (C : CompressibleNavierStokesPackage) (E : CompressibleNavierStokesEvidence C) :
    CompressibleNavierStokesClosed C := by
  exact And.intro E.viscosityCoefficientClosed
    (And.intro E.heatConductivityCoefficientClosed
      (And.intro E.equationOfStateClosed
        (And.intro E.initialDensityClosed
          (And.intro E.initialVelocityClosed
            (And.intro E.boundaryConditionsClosed E.timeIntervalClosed)))))

end ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean
end HautevilleHouse