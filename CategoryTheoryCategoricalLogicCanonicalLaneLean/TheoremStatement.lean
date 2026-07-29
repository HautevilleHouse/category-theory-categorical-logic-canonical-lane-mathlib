import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalLogicCanonicalLaneLean

structure TheoremStatement where
  statement : String
  closure : Prop
  bridgeWitness : closure

def category_theory_statement : TheoremStatement :=
  { statement := "Category theory: limits, colimits, adjoints, Yoneda lemma",
    closure := ∀ (A : AdmissibleClass), ConstrainedCategoryTheoryClosure A,
    bridgeWitness := λ A => constrained_category_theory_endgame A
  }

end CategoryTheoryCategoricalLogicCanonicalLaneLean
end HautevilleHouse