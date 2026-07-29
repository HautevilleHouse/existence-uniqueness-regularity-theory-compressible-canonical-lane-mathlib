import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean

structure LocalExistencePackage where
  existenceTime : Prop
  uniqueness : Prop
  continuousDependence : Prop
  maximalExtension : Prop

structure LocalExistenceEvidence (L : LocalExistencePackage) where
  existenceTimeClosed : L.existenceTime
  uniquenessClosed : L.uniqueness
  continuousDependenceClosed : L.continuousDependence
  maximalExtensionClosed : L.maximalExtension

def LocalExistenceClosed (L : LocalExistencePackage) : Prop :=
  L.existenceTime ∧ L.uniqueness ∧
  L.continuousDependence ∧ L.maximalExtension

theorem local_existence_closed_from_evidence
    (L : LocalExistencePackage) (E : LocalExistenceEvidence L) :
    LocalExistenceClosed L := by
  exact And.intro E.existenceTimeClosed
    (And.intro E.uniquenessClosed
      (And.intro E.continuousDependenceClosed E.maximalExtensionClosed))

end ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean
end HautevilleHouse