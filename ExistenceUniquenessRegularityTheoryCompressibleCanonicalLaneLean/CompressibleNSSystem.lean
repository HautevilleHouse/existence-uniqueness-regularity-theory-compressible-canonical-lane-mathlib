import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceUniquenessRegularityTheoryCompressible

structure CompressibleNSSystem where
  dimension : Nat
  densitySpace : Type u
  velocitySpace : Type v
  pressureLaw : Prop
  viscosityCoefficient : Prop
  heatConductivity : Prop
  initialCondition : Prop
  boundaryCondition : Prop

structure CompressibleNSEvidence (S : CompressibleNSSystem) where
  dimensionOK : S.dimension = 2 ∨ S.dimension = 3
  pressureLawDefined : S.pressureLaw
  viscosityPositive : S.viscosityCoefficient > 0
  heatConductivityPositive : S.heatConductivity > 0
  initialBoundaryOK : S.initialCondition ∧ S.boundaryCondition

def CompressibleNSClosed (S : CompressibleNSSystem) : Prop :=
  S.dimension = 2 ∨ S.dimension = 3 ∧
  S.pressureLaw ∧
  S.viscosityCoefficient > 0 ∧
  S.heatConductivity > 0 ∧
  S.initialCondition ∧
  S.boundaryCondition

theorem compressible_ns_closed_from_evidence
    (S : CompressibleNSSystem) (E : CompressibleNSEvidence S) :
    CompressibleNSClosed S := by
  exact And.intro (And.intro E.dimensionOK E.pressureLawDefined)
    (And.intro E.viscosityPositive
      (And.intro E.heatConductivityPositive E.initialBoundaryOK))

end ExistenceUniquenessRegularityTheoryCompressible
end HautevilleHouse
