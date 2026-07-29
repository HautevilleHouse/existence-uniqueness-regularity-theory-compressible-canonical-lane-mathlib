import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean

structure CompressibleNavierStokesSystem (G : AdmissibleClass) where
  densityField : Type u
  velocityField : Type u
  pressureField : Type u
  viscosityCoefficient : ℝ
  heatConductivityCoefficient : ℝ
  equationOfState : Prop
  initialDensity : densityField
  initialVelocity : velocityField
  initialEnergy : Prop
  boundaryConditions : Prop
  initialDensitySmooth : Prop
  initialVelocitySmooth : Prop
  initialEnergySmooth : Prop
  boundaryConditionsRegular : Prop

structure CompressibleNavierStokesEvidence {G : AdmissibleClass} (S : CompressibleNavierStokesSystem G) where
  equationOfStateClosed : S.equationOfState
  initialDensitySmoothClosed : S.initialDensitySmooth
  initialVelocitySmoothClosed : S.initialVelocitySmooth
  initialEnergySmoothClosed : S.initialEnergySmooth
  boundaryConditionsRegularClosed : S.boundaryConditionsRegular

def CompressibleNavierStokesClosed {G : AdmissibleClass} (S : CompressibleNavierStokesSystem G) : Prop :=
  S.equationOfState ∧ S.initialDensitySmooth ∧ S.initialVelocitySmooth ∧ S.initialEnergySmooth ∧ S.boundaryConditionsRegular

theorem compressible_navier_stokes_closed_from_evidence {G : AdmissibleClass} (S : CompressibleNavierStokesSystem G) (E : CompressibleNavierStokesEvidence S) : CompressibleNavierStokesClosed S := by
  exact And.intro E.equationOfStateClosed (And.intro E.initialDensitySmoothClosed (And.intro E.initialVelocitySmoothClosed (And.intro E.initialEnergySmoothClosed E.boundaryConditionsRegularClosed)))

end ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean
end HautevilleHouse