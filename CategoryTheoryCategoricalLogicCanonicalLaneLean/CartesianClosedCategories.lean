import HautevilleHouse.CategoryTheoryCategoricalLogicCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalLogicCanonicalLaneLean

structure CartesianClosedCategoryPackage where
  category : Type u
  finiteProducts : Prop
  exponentialsExist : Prop
  evalNaturalTransformation : Type v
  curryAdjunction : Prop

structure CartesianClosedCategoryEvidence (C : CartesianClosedCategoryPackage) where
  finiteProductsClosed : C.finiteProducts
  exponentialsExistClosed : C.exponentialsExist
  curryAdjunctionClosed : C.curryAdjunction

def CartesianClosedCategoryClosed (C : CartesianClosedCategoryPackage) : Prop :=
  C.finiteProducts ∧ C.exponentialsExist ∧ C.curryAdjunction

theorem cartesian_closed_category_closed_from_evidence (C : CartesianClosedCategoryPackage) (E : CartesianClosedCategoryEvidence C) : CartesianClosedCategoryClosed C := by
  exact And.intro E.finiteProductsClosed (And.intro E.exponentialsExistClosed E.curryAdjunctionClosed)

end CategoryTheoryCategoricalLogicCanonicalLaneLean
end HautevilleHouse