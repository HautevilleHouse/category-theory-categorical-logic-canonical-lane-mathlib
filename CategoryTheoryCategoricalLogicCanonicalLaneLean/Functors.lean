import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalLogicCanonicalLaneLean

structure FunctorPackage (C : Type u) (D : Type v) (HomC : C → C → Type w) (HomD : D → D → Type x) where
  objMap : C → D
  homMap : ∀ {X Y : C}, HomC X Y → HomD (objMap X) (objMap Y)
  respectsId : ∀ (X : C), homMap (CategoryPackage.id (C := ?_) (Hom := HomC) X) = CategoryPackage.id (objMap X)
  respectsComp : ∀ {X Y Z : C} (f : HomC X Y) (g : HomC Y Z), homMap (CategoryPackage.comp (C := ?_) (Hom := HomC) f g) = CategoryPackage.comp (homMap f) (homMap g)

structure FunctorEvidence {C : Type u} {D : Type v} {HomC : C → C → Type w} {HomD : D → D → Type x} (F : FunctorPackage C D HomC HomD) (catC : CategoryPackage C HomC) (catD : CategoryPackage D HomD) where
  respectsIdClosed : ∀ (X : C), F.homMap (catC.id X) = catD.id (F.objMap X)
  respectsCompClosed : ∀ {X Y Z : C} (f : HomC X Y) (g : HomC Y Z), F.homMap (catC.comp f g) = catD.comp (F.homMap f) (F.homMap g)

def FunctorClosed {C : Type u} {D : Type v} {HomC : C → C → Type w} {HomD : D → D → Type x} (F : FunctorPackage C D HomC HomD) (catC : CategoryPackage C HomC) (catD : CategoryPackage D HomD) : Prop :=
  (∀ (X : C), F.homMap (catC.id X) = catD.id (F.objMap X)) ∧
  (∀ {X Y Z : C} (f : HomC X Y) (g : HomC Y Z), F.homMap (catC.comp f g) = catD.comp (F.homMap f) (F.homMap g))

theorem functor_closed_from_evidence {C : Type u} {D : Type v} {HomC : C → C → Type w} {HomD : D → D → Type x} (F : FunctorPackage C D HomC HomD) (catC : CategoryPackage C HomC) (catD : CategoryPackage D HomD) (E : FunctorEvidence F catC catD) : FunctorClosed F catC catD :=
  And.intro E.respectsIdClosed E.respectsCompClosed

end CategoryTheoryCategoricalLogicCanonicalLaneLean
end HautevilleHouse