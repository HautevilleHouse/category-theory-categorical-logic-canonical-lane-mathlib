import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalLogicCanonicalLaneLean

structure KanExtensionPackage where
  sourceCategory : Type u
  targetCategory : Type v
  functorF : Type u -> Type v
  functorG : Type u -> Type v
  leftKanExtension : Type w
  rightKanExtension : Type x
  leftKanUniversalProperty : Prop
  rightKanUniversalProperty : Prop
  leftKanExtensionTerm : leftKanExtension
  rightKanExtensionTerm : rightKanExtension
  leftKanUniversalPropertyTerm : leftKanUniversalProperty
  rightKanUniversalPropertyTerm : rightKanUniversalProperty

structure KanExtensionEvidence (K : KanExtensionPackage) where
  leftKanUniversalPropertyClosed : K.leftKanUniversalProperty
  rightKanUniversalPropertyClosed : K.rightKanUniversalProperty

def KanExtensionClosed (K : KanExtensionPackage) : Prop :=
  K.leftKanUniversalProperty ∧ K.rightKanUniversalProperty

theorem kan_extension_closed_from_evidence (K : KanExtensionPackage) (E : KanExtensionEvidence K) : KanExtensionClosed K := by
  exact And.intro E.leftKanUniversalPropertyClosed E.rightKanUniversalPropertyClosed

end CategoryTheoryCategoricalLogicCanonicalLaneLean
end HautevilleHouse
