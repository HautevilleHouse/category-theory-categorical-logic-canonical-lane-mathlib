import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryCategoricalLogicCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalLogicCanonicalLaneLean

structure CartesianClosedPackage (C : Category) where
  terminalObject : C.Obj
  terminalUniversal : ∀ (X : C.Obj), ∃! (f : C.Hom X terminalObject), True
  product : C.Obj → C.Obj → C.Obj
  productUniversal : ∀ (X Y Z : C.Obj) (f : C.Hom Z X) (g : C.Hom Z Y), ∃! (h : C.Hom Z (product X Y)), 
    C.comp h (π1 X Y) = f ∧ C.comp h (π2 X Y) = g
  exponential : C.Obj → C.Obj → C.Obj
  eval : ∀ (X Y : C.Obj), C.Hom (product (exponential X Y) X) Y
  curry : ∀ (X Y Z : C.Obj) (f : C.Hom (product Z X) Y), C.Hom Z (exponential X Y)
  curryEval : ∀ (X Y Z : C.Obj) (f : C.Hom (product Z X) Y), 
    C.comp (product.map (curry X Y Z f) (C.id X)) (eval X Y) = f
  uncurry : ∀ (X Y Z : C.Obj) (g : C.Hom Z (exponential X Y)), C.Hom (product Z X) Y
  uncurryEval : ∀ (X Y Z : C.Obj) (g : C.Hom Z (exponential X Y)), 
    C.comp (product.map g (C.id X)) (eval X Y) = uncurry X Y Z g
  cartesianClosed : Prop

def CartesianClosedCategoryClosed {C : Category} (CC : CartesianClosedPackage C) : Prop :=
  CC.cartesianClosed

theorem cartesian_closed_category_closed {C : Category} (CC : CartesianClosedPackage C) : CartesianClosedCategoryClosed CC :=
  CC.cartesianClosed

end CategoryTheoryCategoricalLogicCanonicalLaneLean
end HautevilleHouse