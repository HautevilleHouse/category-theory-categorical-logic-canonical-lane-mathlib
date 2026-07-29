import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalLogicCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure CategoryObject where
  obj : Type
  hom : obj → obj → Type
  identity : ∀ (X : obj), hom X X
  compose : ∀ {X Y Z : obj}, hom Y Z → hom X Y → hom X Z
  identityLeft : ∀ {X Y : obj} (f : hom X Y), compose (identity Y) f = f
  identityRight : ∀ {X Y : obj} (f : hom X Y), compose f (identity X) = f
  associativity : ∀ {X Y Z W : obj} (f : hom Z W) (g : hom Y Z) (h : hom X Y), compose (compose f g) h = compose f (compose g h)

structure FunctorAdapter (C D : CategoryObject) where
  mapObj : C.obj → D.obj
  mapHom : ∀ {X Y : C.obj}, C.hom X Y → D.hom (mapObj X) (mapObj Y)
  preservesIdentity : ∀ (X : C.obj), mapHom (C.identity X) = D.identity (mapObj X)
  preservesCompose : ∀ {X Y Z : C.obj} (f : C.hom Y Z) (g : C.hom X Y), mapHom (C.compose f g) = D.compose (mapHom f) (mapHom g)

structure AdmissibleCategoryObject where
  cat : CategoryObject
  admittedProp : Prop
  conclusion : admittedProp

structure CategoryEndgameState where
  object : AdmissibleCategoryObject

def CategoryWitnessClosed (O : AdmissibleCategoryObject) : Prop :=
  O.admittedProp

end CategoryTheoryCategoricalLogicCanonicalLaneLean
end HautevilleHouse