import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean

structure CompressibleExistencePackage where
  initialConditionRegular : Prop
  spatialDomainBounded : Prop
  barotropicLaw : Prop
  viscosityCoefficientPositive : Prop
  heatConductivityNonnegative : Prop

def CompressibleExistencePackageClosed (P : CompressibleExistencePackage) : Prop :=
  P.initialConditionRegular ∧ P.spatialDomainBounded ∧ P.barotropicLaw ∧
  P.viscosityCoefficientPositive ∧ P.heatConductivityNonnegative

end ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean
end HautevilleHouse
