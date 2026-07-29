import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean

structure EnergyEstimatesPackage where
  energyFunctional : Type u
  dissipationTerm : Prop
  initialEnergyBound : Prop
  energyInequality : Prop
  higherRegularityEstimate : Prop

structure EnergyEstimatesEvidence (E : EnergyEstimatesPackage) where
  dissipationTermClosed : E.dissipationTerm
  initialEnergyBoundClosed : E.initialEnergyBound
  energyInequalityClosed : E.energyInequality
  higherRegularityEstimateClosed : E.higherRegularityEstimate

def EnergyEstimatesClosed (E : EnergyEstimatesPackage) : Prop :=
  E.dissipationTerm ∧ E.initialEnergyBound ∧
  E.energyInequality ∧ E.higherRegularityEstimate

theorem energy_estimates_closed_from_evidence
    (E : EnergyEstimatesPackage) (Ev : EnergyEstimatesEvidence E) :
    EnergyEstimatesClosed E := by
  exact And.intro Ev.dissipationTermClosed
    (And.intro Ev.initialEnergyBoundClosed
      (And.intro Ev.energyInequalityClosed Ev.higherRegularityEstimateClosed))

end ExistenceUniquenessRegularityTheoryCompressibleCanonicalLaneLean
end HautevilleHouse