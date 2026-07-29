import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalLogicCanonicalLaneLean

structure CategoryPackage (Obj : Type u) (Hom : Obj → Obj → Type v) where
  id : ∀ (X : Obj), Hom X X
  comp : ∀ {X Y Z : Obj}, Hom X Y → Hom Y Z → Hom X Z
  idLeft : ∀ {X Y : Obj} (f : Hom X Y), comp (id X) f = f
  idRight : ∀ {X Y : Obj} (f : Hom X Y), comp f (id Y) = f
  assoc : ∀ {W X Y Z : Obj} (f : Hom W X) (g : Hom X Y) (h : Hom Y Z), comp (comp f g) h = comp f (comp g h)

structure CategoryEvidence {Obj : Type u} {Hom : Obj → Obj → Type v} (C : CategoryPackage Obj Hom) where
  idLeftClosed : ∀ {X Y : Obj} (f : Hom X Y), C.comp (C.id X) f = f
  idRightClosed : ∀ {X Y : Obj} (f : Hom X Y), C.comp f (C.id Y) = f
  assocClosed : ∀ {W X Y Z : Obj} (f : Hom W X) (g : Hom X Y) (h : Hom Y Z), C.comp (C.comp f g) h = C.comp f (C.comp g h)

def CategoryClosed {Obj : Type u} {Hom : Obj → Obj → Type v} (C : CategoryPackage Obj Hom) : Prop :=
  (∀ {X Y : Obj} (f : Hom X Y), C.comp (C.id X) f = f) ∧
  (∀ {X Y : Obj} (f : Hom X Y), C.comp f (C.id Y) = f) ∧
  (∀ {W X Y Z : Obj} (f : Hom W X) (g : Hom X Y) (h : Hom Y Z), C.comp (C.comp f g) h = C.comp f (C.comp g h))

theorem category_closed_from_evidence {Obj : Type u} {Hom : Obj → Obj → Type v} (C : CategoryPackage Obj Hom) (E : CategoryEvidence C) : CategoryClosed C :=
  And.intro E.idLeftClosed (And.intro E.idRightClosed E.assocClosed)

end CategoryTheoryCategoricalLogicCanonicalLaneLean
end HautevilleHouse