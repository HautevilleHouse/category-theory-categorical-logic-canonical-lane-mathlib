import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalLogicCanonicalLaneLean

structure MonadPackage where
  endofunctor : Type -> Type
  unitNaturalTransformation : Prop
  multiplicationNaturalTransformation : Prop
  associativityLaw : Prop
  unitLaw : Prop
  emAlgebrasCategory : Type
  freeForgetfulAdjunction : Prop

structure MonadEvidence (M : MonadPackage) where
  unitNaturalTransformationClosed : M.unitNaturalTransformation
  multiplicationNaturalTransformationClosed : M.multiplicationNaturalTransformation
  associativityLawClosed : M.associativityLaw
  unitLawClosed : M.unitLaw
  freeForgetfulAdjunctionClosed : M.freeForgetfulAdjunction

def MonadClosed (M : MonadPackage) : Prop :=
  M.unitNaturalTransformation ∧ M.multiplicationNaturalTransformation ∧ M.associativityLaw ∧ M.unitLaw ∧ M.freeForgetfulAdjunction

theorem monad_closed_from_evidence (M : MonadPackage) (E : MonadEvidence M) : MonadClosed M := by
  exact And.intro E.unitNaturalTransformationClosed (And.intro E.multiplicationNaturalTransformationClosed (And.intro E.associativityLawClosed (And.intro E.unitLawClosed E.freeForgetfulAdjunctionClosed)))

end CategoryTheoryCategoricalLogicCanonicalLaneLean
end HautevilleHouse