import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalLogicCanonicalLaneLean

structure ConePackage (C : Type u) (HomC : C → C → Type v) (F : FunctorPackage J C HomJ HomC) (Limit : C) where
  projection : ∀ (j : J), HomC Limit (F.objMap j)
  coneCondition : ∀ {j k : J} (f : HomJ j k),
    CategoryPackage.comp (projection j) (F.homMap f) = projection k

structure ConeEvidence {C : Type u} {J : Type w} {HomC : C → C → Type v} {HomJ : J → J → Type x} {F : FunctorPackage J C HomJ HomC} {L : C} (cone : ConePackage C HomC HomJ F L) (catC : CategoryPackage C HomC) (catJ : CategoryPackage J HomJ) where
  coneConditionClosed : ∀ {j k : J} (f : HomJ j k),
    catC.comp (cone.projection j) (F.homMap f) = cone.projection k

def ConeClosed {C : Type u} {J : Type w} {HomC : C → C → Type v} {HomJ : J → J → Type x} {F : FunctorPackage J C HomJ HomC} {L : C} (cone : ConePackage C HomC HomJ F L) (catC : CategoryPackage C HomC) : Prop :=
  ∀ {j k : J} (f : HomJ j k),
    catC.comp (cone.projection j) (F.homMap f) = cone.projection k

theorem cone_closed_from_evidence {C : Type u} {J : Type w} {HomC : C → C → Type v} {HomJ : J → J → Type x} {F : FunctorPackage J C HomJ HomC} {L : C} (cone : ConePackage C HomC HomJ F L) (catC : CategoryPackage C HomC) (E : ConeEvidence cone catC (catJ := ?_)) : ConeClosed cone catC :=
  E.coneConditionClosed

structure LimitPackage (C : Type u) (HomC : C → C → Type v) (F : FunctorPackage J C HomJ HomC) where
  limitObject : C
  limitCone : ConePackage C HomC HomJ F limitObject
  universalProperty : ∀ (L' : C) (cone' : ConePackage C HomC HomJ F L'), ∃! (m : HomC L' limitObject), ∀ (j : J), cone'.projection j = catC.comp m (limitCone.projection j)

structure LimitEvidence {C : Type u} {J : Type w} {HomC : C → C → Type v} {HomJ : J → J → Type x} {F : FunctorPackage J C HomJ HomC} (L : LimitPackage C HomC HomJ F) (catC : CategoryPackage C HomC) where
  universalPropertyClosed : ∀ (L' : C) (cone' : ConePackage C HomC HomJ F L'), ∃! (m : HomC L' L.limitObject), ∀ (j : J), cone'.projection j = catC.comp m (L.limitCone.projection j)

def LimitClosed {C : Type u} {J : Type w} {HomC : C → C → Type v} {HomJ : J → J → Type x} {F : FunctorPackage J C HomJ HomC} (L : LimitPackage C HomC HomJ F) (catC : CategoryPackage C HomC) : Prop :=
  ∀ (L' : C) (cone' : ConePackage C HomC HomJ F L'), ∃! (m : HomC L' L.limitObject), ∀ (j : J), cone'.projection j = catC.comp m (L.limitCone.projection j)

theorem limit_closed_from_evidence {C : Type u} {J : Type w} {HomC : C → C → Type v} {HomJ : J → J → Type x} {F : FunctorPackage J C HomJ HomC} (L : LimitPackage C HomC HomJ F) (catC : CategoryPackage C HomC) (E : LimitEvidence L catC) : LimitClosed L catC :=
  E.universalPropertyClosed

end CategoryTheoryCategoricalLogicCanonicalLaneLean
end HautevilleHouse