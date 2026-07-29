import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean.CompressibleEulerEquations

namespace HautevilleHouse
namespace ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean

structure LocalExistencePackage {P : CompressibleEulerPackage} where
  shortTimeInterval : Prop
  symmetricHyperbolicity : Prop
  existenceViaSobolev : Prop
  energyEstimates : Prop
  continuationCriterion : Prop

structure LocalExistenceEvidence {P : CompressibleEulerPackage}
    (L : LocalExistencePackage P) where
  shortTimeIntervalClosed : L.shortTimeInterval
  symmetricHyperbolicityClosed : L.symmetricHyperbolicity
  existenceViaSobolevClosed : L.existenceViaSobolev
  energyEstimatesClosed : L.energyEstimates
  continuationCriterionClosed : L.continuationCriterion

def LocalExistenceClosed {P : CompressibleEulerPackage}
    (L : LocalExistencePackage P) : Prop :=
  L.shortTimeInterval ∧ L.symmetricHyperbolicity ∧
  L.existenceViaSobolev ∧ L.energyEstimates ∧ L.continuationCriterion

theorem local_existence_closed_from_evidence {P : CompressibleEulerPackage}
    (L : LocalExistencePackage P) (E : LocalExistenceEvidence L) :
    LocalExistenceClosed L := by
  exact And.intro E.shortTimeIntervalClosed
    (And.intro E.symmetricHyperbolicityClosed
      (And.intro E.existenceViaSobolevClosed
        (And.intro E.energyEstimatesClosed E.continuationCriterionClosed)))

end ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean
end HautevilleHouse