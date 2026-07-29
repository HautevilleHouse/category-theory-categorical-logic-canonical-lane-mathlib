import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalLogicCanonicalLaneLean

structure NaturalTransformationPackage (C : Type u) (D : Type v) (HomC : C → C → Type w) (HomD : D → D → Type x) (F G : FunctorPackage C D HomC HomD) where
  components : ∀ (X : C), HomD (F.objMap X) (G.objMap X)
  naturality : ∀ {X Y : C} (f : HomC X Y),
    CategoryPackage.comp (Hom := HomD) (components X) (G.homMap f) = CategoryPackage.comp (Hom := HomD) (F.homMap f) (components Y)

structure NaturalTransformationEvidence {C : Type u} {D : Type v} {HomC : C → C → Type w} {HomD : D → D → Type x} {F G : FunctorPackage C D HomC HomD} (τ : NaturalTransformationPackage C D HomC HomD F G) (catC : CategoryPackage C HomC) (catD : CategoryPackage D HomD) where
  naturalityClosed : ∀ {X Y : C} (f : HomC X Y),
    catD.comp (τ.components X) (G.homMap f) = catD.comp (F.homMap f) (τ.components Y)

def NaturalTransformationClosed {C : Type u} {D : Type v} {HomC : C → C → Type w} {HomD : D → D → Type x} {F G : FunctorPackage C D HomC HomD} (τ : NaturalTransformationPackage C D HomC HomD F G) (catD : CategoryPackage D HomD) : Prop :=
  ∀ {X Y : C} (f : HomC X Y),
    catD.comp (τ.components X) (G.homMap f) = catD.comp (F.homMap f) (τ.components Y)

theorem natural_transformation_closed_from_evidence {C : Type u} {D : Type v} {HomC : C → C → Type w} {HomD : D → D → Type x} {F G : FunctorPackage C D HomC HomD} (τ : NaturalTransformationPackage C D HomC HomD F G) (catD : CategoryPackage D HomD) (E : NaturalTransformationEvidence τ (catC := ?_) catD) : NaturalTransformationClosed τ catD :=
  E.naturalityClosed

end CategoryTheoryCategoricalLogicCanonicalLaneLean
end HautevilleHouse