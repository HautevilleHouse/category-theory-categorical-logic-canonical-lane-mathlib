import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalLogicCanonicalLaneLean

structure LimitPackage where
  diagram : Type u → Type u
  cone : ∀ (D : Type u), (∀ (i : Type u), D i → Type u) → Type u
  universalProperty : ∀ (D : Type u) (F : (∀ (i : Type u), D i → Type u) → Type u),
    cone D F → (∀ (c : cone D F), ∃! (m : Type u), cone D F → cone D F)

structure ColimitPackage where
  diagram : Type u → Type u
  cocone : ∀ (D : Type u), (∀ (i : Type u), D i → Type u) → Type u
  universalProperty : ∀ (D : Type u) (F : (∀ (i : Type u), D i → Type u) → Type u),
    cocone D F → (∀ (c : cocone D F), ∃! (m : Type u), cocone D F → cocone D F)

structure LimitsColimitsPackage where
  limit : LimitPackage
  colimit : ColimitPackage
  limitClosed : limit.universalProperty = (λ D F c => (λ c' => (c, c')))
  colimitClosed : colimit.universalProperty = (λ D F c => (λ c' => (c, c')))

def LimitsColimitsClosed (P : LimitsColimitsPackage) : Prop :=
  P.limitClosed ∧ P.colimitClosed

theorem limits_colimits_closed_from_evidence (P : LimitsColimitsPackage)
    (hlimit : P.limitClosed) (hcolimit : P.colimitClosed) : LimitsColimitsClosed P := by
  exact And.intro hlimit hcolimit

end CategoryTheoryCategoricalLogicCanonicalLaneLean
end HautevilleHouse