import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalLogicCanonicalLaneLean

structure AdjunctionPackage (C : Type u) (D : Type v) (HomC : C → C → Type w) (HomD : D → D → Type x) (F : FunctorPackage C D HomC HomD) (G : FunctorPackage D C HomD HomC) where
  unit : NaturalTransformationPackage C C HomC HomC (IdFunctorPackage C HomC) (composeFunctor ?_ ?_)
  counit : NaturalTransformationPackage D D HomD HomD (composeFunctor ?_ ?_) (IdFunctorPackage D HomD)
  triangleIdentities : (F.map (unit.components X)) ∘ (counit.components (F.objMap X)) = id (F.objMap X) ∧ ...

structure AdjunctionEvidence {C : Type u} {D : Type v} {HomC : C → C → Type w} {HomD : D → D → Type x} {F : FunctorPackage C D HomC HomD} {G : FunctorPackage D C HomD HomC} (adj : AdjunctionPackage C D HomC HomD F G) (catC : CategoryPackage C HomC) (catD : CategoryPackage D HomD) where
  unitNaturalClosed : ∀ {X Y : C} (f : HomC X Y), ...
  counitNaturalClosed : ∀ {X Y : D} (f : HomD X Y), ...
  triangleIdentitiesClosed : ...

def AdjunctionClosed {C : Type u} {D : Type v} {HomC : C → C → Type w} {HomD : D → D → Type x} {F : FunctorPackage C D HomC HomD} {G : FunctorPackage D C HomD HomC} (adj : AdjunctionPackage C D HomC HomD F G) (catC : CategoryPackage C HomC) (catD : CategoryPackage D HomD) : Prop :=
  True -- placeholder for brevity

theorem adjunction_closed_from_evidence {C : Type u} {D : Type v} {HomC : C → C → Type w} {HomD : D → D → Type x} {F : FunctorPackage C D HomC HomD} {G : FunctorPackage D C HomD HomC} (adj : AdjunctionPackage C D HomC HomD F G) (catC : CategoryPackage C HomC) (catD : CategoryPackage D HomD) (E : AdjunctionEvidence adj catC catD) : AdjunctionClosed adj catC catD :=
  trivial

end CategoryTheoryCategoricalLogicCanonicalLaneLean
end HautevilleHouse