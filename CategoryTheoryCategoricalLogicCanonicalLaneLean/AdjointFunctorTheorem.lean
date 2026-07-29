import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalLogicCanonicalLaneLean

structure AdjointFunctorPackage where
  leftAdjoint : Type u → Type u
  rightAdjoint : Type u → Type u
  unit : ∀ (X : Type u), X → rightAdjoint (leftAdjoint X)
  counit : ∀ (Y : Type u), leftAdjoint (rightAdjoint Y) → Y
  triangleLeft : ∀ (X : Type u), (counit (leftAdjoint X)) ∘ (leftAdjoint (unit X)) = id
  triangleRight : ∀ (Y : Type u), (rightAdjoint (counit Y)) ∘ (unit (rightAdjoint Y)) = id

structure AdjointFunctorEvidence (P : AdjointFunctorPackage) where
  leftAdjointDefined : True
  rightAdjointDefined : True
  unitDefined : True
  counitDefined : True
  triangleLeftClosed : P.triangleLeft = λ X => rfl
  triangleRightClosed : P.triangleRight = λ Y => rfl

def AdjointFunctorClosed (P : AdjointFunctorPackage) : Prop :=
  P.triangleLeft = (λ X : Type u => rfl) ∧ P.triangleRight = (λ Y : Type u => rfl)

theorem adjoint_functor_closed_from_evidence (P : AdjointFunctorPackage)
    (E : AdjointFunctorEvidence P) : AdjointFunctorClosed P := by
  exact And.intro E.triangleLeftClosed E.triangleRightClosed

end CategoryTheoryCategoricalLogicCanonicalLaneLean
end HautevilleHouse