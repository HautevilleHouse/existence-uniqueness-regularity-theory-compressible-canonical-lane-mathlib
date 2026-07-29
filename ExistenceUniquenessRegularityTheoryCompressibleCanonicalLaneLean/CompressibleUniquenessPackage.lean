import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean

structure CompressibleUniquenessPackage where
  weakSolutionEnergyEstimate : Prop
  renormalizedContinuity : Prop
  relativeEntropyInequality : Prop
  uniquenessFromStability : Prop

def CompressibleUniquenessPackageClosed (U : CompressibleUniquenessPackage) : Prop :=
  U.weakSolutionEnergyEstimate ∧ U.renormalizedContinuity ∧
  U.relativeEntropyInequality ∧ U.uniquenessFromStability

end ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean
end HautevilleHouse
