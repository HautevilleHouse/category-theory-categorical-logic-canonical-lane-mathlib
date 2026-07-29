import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalLogicCanonicalLaneLean

structure CategoricalLogicPackage where
  category : Type u
  subobjectClassifier : Prop
  cartesianClosure : Prop
  toposProperties : Prop
  logicalFramework : Prop
  soundnessTheorem : Prop
  completenessTheorem : Prop

structure CategoricalLogicEvidence (C : CategoricalLogicPackage) where
  subobjectClassifierClosed : C.subobjectClassifier
  cartesianClosureClosed : C.cartesianClosure
  toposPropertiesClosed : C.toposProperties
  logicalFrameworkClosed : C.logicalFramework
  soundnessTheoremClosed : C.soundnessTheorem
  completenessTheoremClosed : C.completenessTheorem

def CategoricalLogicClosed (C : CategoricalLogicPackage) : Prop :=
  C.subobjectClassifier ∧ C.cartesianClosure ∧ C.toposProperties ∧ C.logicalFramework ∧ C.soundnessTheorem ∧ C.completenessTheorem

theorem categorical_logic_closed_from_evidence (C : CategoricalLogicPackage)
    (E : CategoricalLogicEvidence C) : CategoricalLogicClosed C := by
  exact And.intro E.subobjectClassifierClosed
    (And.intro E.cartesianClosureClosed
      (And.intro E.toposPropertiesClosed
        (And.intro E.logicalFrameworkClosed
          (And.intro E.soundnessTheoremClosed E.completenessTheoremClosed))))

end CategoryTheoryCategoricalLogicCanonicalLaneLean
end HautevilleHouse