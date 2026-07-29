import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalLogicCanonicalLaneLean

structure CategoryAdmittedObject where
  carrier : Type u
  morphisms : carrier → carrier → Type v
  identity : ∀ X : carrier, morphisms X X
  composition : ∀ {X Y Z : carrier}, morphisms X Y → morphisms Y Z → morphisms X Z
  associativity : ∀ {W X Y Z : carrier} (f : morphisms W X) (g : morphisms X Y) (h : morphisms Y Z),
    composition (composition f g) h = composition f (composition g h)
  identityLeft : ∀ {X Y : carrier} (f : morphisms X Y), composition (identity X) f = f
  identityRight : ∀ {X Y : carrier} (f : morphisms X Y), composition f (identity Y) = f
  conclusion : Prop

structure AdmissibleClass where
  object : CategoryAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  CategoryWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CategoryTheoryCategoricalLogicCanonicalLaneLean
end HautevilleHouse