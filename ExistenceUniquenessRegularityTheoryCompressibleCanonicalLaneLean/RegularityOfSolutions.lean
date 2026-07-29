import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean.StrongSolutionUniqueness

namespace HautevilleHouse
namespace ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean

structure RegularityPackage {G : AdmissibleClass} {S : CompressibleNavierStokesSystem G} {W : WeakSolutionExistencePackage S} (U : StrongSolutionUniquenessPackage W) where
  interiorRegularity : Prop
  boundaryRegularity : Prop
  hölderContinuity : Prop
  higherDerivatives : Prop
  maximalRegularity : Prop

structure RegularityEvidence {G : AdmissibleClass} {S : CompressibleNavierStokesSystem G} {W : WeakSolutionExistencePackage S} {U : StrongSolutionUniquenessPackage W} (R : RegularityPackage U) where
  interiorRegularityClosed : R.interiorRegularity
  boundaryRegularityClosed : R.boundaryRegularity
  hölderContinuityClosed : R.hölderContinuity
  higherDerivativesClosed : R.higherDerivatives
  maximalRegularityClosed : R.maximalRegularity

def RegularityClosed {G : AdmissibleClass} {S : CompressibleNavierStokesSystem G} {W : WeakSolutionExistencePackage S} {U : StrongSolutionUniquenessPackage W} (R : RegularityPackage U) : Prop :=
  R.interiorRegularity ∧ R.boundaryRegularity ∧ R.hölderContinuity ∧ R.higherDerivatives ∧ R.maximalRegularity

theorem regularity_closed_from_evidence {G : AdmissibleClass} {S : CompressibleNavierStokesSystem G} {W : WeakSolutionExistencePackage S} {U : StrongSolutionUniquenessPackage W} (R : RegularityPackage U) (E : RegularityEvidence R) : RegularityClosed R := by
  exact And.intro E.interiorRegularityClosed (And.intro E.boundaryRegularityClosed (And.intro E.hölderContinuityClosed (And.intro E.higherDerivativesClosed E.maximalRegularityClosed)))

end ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean
end HautevilleHouse