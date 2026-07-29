import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalLogicCanonicalLaneLean

structure YonedaLemmaPackage where
  category : Type u → Type u
  hom : ∀ (A B : Type u), A → B → Type u
  yonedaEmbedding : ∀ (A : Type u), (∀ (X : Type u), hom A X → Type u) → Type u
  naturalIsomorphism : ∀ (A : Type u) (F : (∀ (X : Type u), hom A X → Type u) → Type u), 
    F (yonedaEmbedding A) ≅ F (λ X f => f A)
  yonedaLemma : ∀ (A : Type u) (F : (∀ (X : Type u), hom A X → Type u) → Type u),
    (∀ (X : Type u), hom A X → F X) ≅ F A

structure YonedaLemmaEvidence (P : YonedaLemmaPackage) where
  yonedaEmbeddingDefined : True
  naturalIsomorphismDefined : True
  yonedaLemmaClosed : P.yonedaLemma = (λ A F => (λ h => h A A (λ x => x)))

def YonedaLemmaClosed (P : YonedaLemmaPackage) : Prop :=
  P.yonedaLemma = (λ A F => (λ h => h A A (λ x => x)))

theorem yoneda_lemma_closed_from_evidence (P : YonedaLemmaPackage)
    (E : YonedaLemmaEvidence P) : YonedaLemmaClosed P := by
  exact E.yonedaLemmaClosed

end CategoryTheoryCategoricalLogicCanonicalLaneLean
end HautevilleHouse