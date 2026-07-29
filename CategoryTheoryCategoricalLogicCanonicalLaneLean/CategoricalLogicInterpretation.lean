import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalLogicCanonicalLaneLean

structure CategoricalLogicPackage where
  syntacticCategory : Type u
  theory : Type v
  interpretationFunctor : Type u -> Type v
  soundnessTheorem : Prop
  completenessTheorem : Prop

structure CategoricalLogicEvidence (C : CategoricalLogicPackage) where
  soundnessTheoremClosed : C.soundnessTheorem
  completenessTheoremClosed : C.completenessTheorem

def CategoricalLogicClosed (C : CategoricalLogicPackage) : Prop :=
  C.soundnessTheorem ∧ C.completenessTheorem

theorem categorical_logic_closed_from_evidence (C : CategoricalLogicPackage) (E : CategoricalLogicEvidence C) : CategoricalLogicClosed C := by
  exact And.intro E.soundnessTheoremClosed E.completenessTheoremClosed

end CategoryTheoryCategoricalLogicCanonicalLaneLean
end HautevilleHouse