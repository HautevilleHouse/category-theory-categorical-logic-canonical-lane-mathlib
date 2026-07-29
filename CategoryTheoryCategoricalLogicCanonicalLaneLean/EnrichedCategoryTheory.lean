import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalLogicCanonicalLaneLean

structure EnrichedCategoryPackage where
  baseMonoidalCategory : Type u
  enrichedCategory : Type v
  enrichedHomObject : Type w
  compositionMorphism : Prop
  identityMorphism : Prop
  associativityCondition : Prop
  identityCondition : Prop
  enrichmentConsistency : Prop
  compositionMorphismTerm : compositionMorphism
  identityMorphismTerm : identityMorphism
  associativityConditionTerm : associativityCondition
  identityConditionTerm : identityCondition
  enrichmentConsistencyTerm : enrichmentConsistency

structure EnrichedCategoryEvidence (E : EnrichedCategoryPackage) where
  associativityConditionClosed : E.associativityCondition
  identityConditionClosed : E.identityCondition
  enrichmentConsistencyClosed : E.enrichmentConsistency

def EnrichedCategoryClosed (E : EnrichedCategoryPackage) : Prop :=
  E.associativityCondition ∧ E.identityCondition ∧ E.enrichmentConsistency

theorem enriched_category_closed_from_evidence (E : EnrichedCategoryPackage) (Ev : EnrichedCategoryEvidence E) : EnrichedCategoryClosed E := by
  exact And.intro Ev.associativityConditionClosed (And.intro Ev.identityConditionClosed Ev.enrichmentConsistencyClosed)

end CategoryTheoryCategoricalLogicCanonicalLaneLean
end HautevilleHouse
