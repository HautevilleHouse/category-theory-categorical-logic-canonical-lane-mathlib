import HautevilleHouse.CategoryTheoryCategoricalLogicCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalLogicCanonicalLaneLean

structure CartesianClosedPackage (A : AdmissibleClass) where
  terminalObject : A.object.category
  product : A.object.category → A.object.category → A.object.category
  exponential : A.object.category → A.object.category → A.object.category
  adjunctionCurry : ∀ X Y Z, A.object.homType (product X Y) Z ≃ A.object.homType X (exponential Y Z)
  naturalityTerminal : Prop
  naturalityProduct : Prop
  naturalityExponential : Prop
  cartesianClosedClosed : Prop

structure CartesianClosedEvidence (A : AdmissibleClass) (C : CartesianClosedPackage A) where
  naturalityTerminalClosed : C.naturalityTerminal
  naturalityProductClosed : C.naturalityProduct
  naturalityExponentialClosed : C.naturalityExponential
  cartesianClosedClosedClosed : C.cartesianClosedClosed

def CartesianClosedClosed (A : AdmissibleClass) (C : CartesianClosedPackage A) : Prop :=
  C.naturalityTerminal ∧ C.naturalityProduct ∧ C.naturalityExponential ∧ C.cartesianClosedClosed

theorem cartesian_closed_closed_from_evidence (A : AdmissibleClass) (C : CartesianClosedPackage A)
    (E : CartesianClosedEvidence A C) : CartesianClosedClosed A C := by
  exact And.intro E.naturalityTerminalClosed
    (And.intro E.naturalityProductClosed
      (And.intro E.naturalityExponentialClosed E.cartesianClosedClosedClosed))

end CategoryTheoryCategoricalLogicCanonicalLaneLean
end HautevilleHouse