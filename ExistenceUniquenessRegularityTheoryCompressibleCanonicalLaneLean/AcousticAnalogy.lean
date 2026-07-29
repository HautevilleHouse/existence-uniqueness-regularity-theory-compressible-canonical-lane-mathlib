import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceUniquenessRegularityTheoryCompressible

structure AcousticAnalogyPackage where
  linearizedAcoustic : Prop
  waveOperator : Prop
  LighthillTensor : Prop
  vortexSound : Prop

structure AcousticAnalogyEvidence (A : AcousticAnalogyPackage) where
  linearizedAcousticClosed : A.linearizedAcoustic
  waveOperatorClosed : A.waveOperator
  LighthillTensorClosed : A.LighthillTensor
  vortexSoundClosed : A.vortexSound

def AcousticAnalogyClosed (A : AcousticAnalogyPackage) : Prop :=
  A.linearizedAcoustic ∧ A.waveOperator ∧
  A.LighthillTensor ∧ A.vortexSound

theorem acoustic_analogy_closed_from_evidence
    (A : AcousticAnalogyPackage) (E : AcousticAnalogyEvidence A) :
    AcousticAnalogyClosed A := by
  exact And.intro E.linearizedAcousticClosed
    (And.intro E.waveOperatorClosed
      (And.intro E.LighthillTensorClosed E.vortexSoundClosed))

end ExistenceUniquenessRegularityTheoryCompressible
end HautevilleHouse
