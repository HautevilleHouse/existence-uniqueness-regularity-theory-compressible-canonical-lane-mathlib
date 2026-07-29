import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean

structure RegularityPackage {E : CompressibleEulerPackage} {P : ExistencePackage E} (U : UniquenessPackage P) where
  vacuumRegularity : Prop
  interfaceRegularity : Prop
  higherRegularityPropagation : Prop
  BesovRegularity : Prop

structure RegularityEvidence {E : CompressibleEulerPackage} {P : ExistencePackage E} {U : UniquenessPackage P} (R : RegularityPackage U) where
  vacuumRegularityClosed : R.vacuumRegularity
  interfaceRegularityClosed : R.interfaceRegularity
  higherRegularityPropagationClosed : R.higherRegularityPropagation
  BesovRegularityClosed : R.BesovRegularity

def RegularityClosed {E : CompressibleEulerPackage} {P : ExistencePackage E} {U : UniquenessPackage P} (R : RegularityPackage U) : Prop :=
  R.vacuumRegularity ∧ R.interfaceRegularity ∧ R.higherRegularityPropagation ∧ R.BesovRegularity

theorem regularity_closed_from_evidence {E : CompressibleEulerPackage} {P : ExistencePackage E} {U : UniquenessPackage P} (R : RegularityPackage U) (Ev : RegularityEvidence R) : RegularityClosed R := by
  exact And.intro Ev.vacuumRegularityClosed (And.intro Ev.interfaceRegularityClosed (And.intro Ev.higherRegularityPropagationClosed Ev.BesovRegularityClosed))

end ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean
end HautevilleHouse