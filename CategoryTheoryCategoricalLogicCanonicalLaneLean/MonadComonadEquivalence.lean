import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalLogicCanonicalLaneLean

structure MonadComonadPackage where
  monadEndofunctor : Type u -> Type u
  comonadEndofunctor : Type u -> Type u
  monadMultiplication : Prop
  monadUnit : Prop
  comonadComultiplication : Prop
  comonadCounit : Prop
  monadLaws : Prop
  comonadLaws : Prop
  equivalenceCondition : Prop
  monadMultiplicationTerm : monadMultiplication
  monadUnitTerm : monadUnit
  comonadComultiplicationTerm : comonadComultiplication
  comonadCounitTerm : comonadCounit
  monadLawsTerm : monadLaws
  comonadLawsTerm : comonadLaws
  equivalenceConditionTerm : equivalenceCondition

structure MonadComonadEvidence (M : MonadComonadPackage) where
  monadLawsClosed : M.monadLaws
  comonadLawsClosed : M.comonadLaws
  equivalenceConditionClosed : M.equivalenceCondition

def MonadComonadClosed (M : MonadComonadPackage) : Prop :=
  M.monadLaws ∧ M.comonadLaws ∧ M.equivalenceCondition

theorem monad_comonad_closed_from_evidence (M : MonadComonadPackage) (E : MonadComonadEvidence M) : MonadComonadClosed M := by
  exact And.intro E.monadLawsClosed (And.intro E.comonadLawsClosed E.equivalenceConditionClosed)

end CategoryTheoryCategoricalLogicCanonicalLaneLean
end HautevilleHouse
