import HautevilleHouse.CategoryTheoryCategoricalLogicCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalLogicCanonicalLaneLean

structure YonedaPackage (A : AdmissibleClass) where
  yonedaFunctor : A.object.category → (A.object.category → Type v)
  fullFaithful : Prop
  naturality : Prop
  embeddingClosed : Prop

structure YonedaEvidence (A : AdmissibleClass) (Y : YonedaPackage A) where
  fullFaithfulClosed : Y.fullFaithful
  naturalityClosed : Y.naturality
  embeddingClosedClosed : Y.embeddingClosed

def YonedaClosed (A : AdmissibleClass) (Y : YonedaPackage A) : Prop :=
  Y.fullFaithful ∧ Y.naturality ∧ Y.embeddingClosed

theorem yoneda_closed_from_evidence (A : AdmissibleClass) (Y : YonedaPackage A)
    (E : YonedaEvidence A Y) : YonedaClosed A Y := by
  exact And.intro E.fullFaithfulClosed (And.intro E.naturalityClosed E.embeddingClosedClosed)

end CategoryTheoryCategoricalLogicCanonicalLaneLean
end HautevilleHouse