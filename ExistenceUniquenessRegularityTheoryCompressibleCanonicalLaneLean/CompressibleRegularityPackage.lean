import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean

structure CompressibleRegularityPackage where
  weakSolutionEnergyEstimate : Prop
  renormalizedContinuity : Prop
  relativeEntropyInequality : Prop
  uniquenessFromStability : Prop

def CompressibleRegularityPackageClosed (R : CompressibleRegularityPackage) : Prop :=
  R.weakSolutionEnergyEstimate ∧ R.renormalizedContinuity ∧
  R.relativeEntropyInequality ∧ R.uniquenessFromStability

end ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean
end HautevilleHouse
