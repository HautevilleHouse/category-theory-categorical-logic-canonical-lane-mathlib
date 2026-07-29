import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalLogicCanonicalLaneLean

structure LimitPackage (A : AdmissibleClass) where
  diagram : Type u
  cone : Type v
  limitObject : Type w
  universalProperty : Prop
  coneClosed : Prop
  limitObjectClosed : Prop
  universalPropertyClosed : Prop

structure LimitEvidence (A : AdmissibleClass) (L : LimitPackage A) where
  coneClosed : L.coneClosed
  limitObjectClosed : L.limitObjectClosed
  universalPropertyClosed : L.universalPropertyClosed

def LimitClosed (A : AdmissibleClass) (L : LimitPackage A) : Prop :=
  L.coneClosed ∧ L.limitObjectClosed ∧ L.universalPropertyClosed

theorem limit_closed_from_evidence (A : AdmissibleClass) (L : LimitPackage A)
    (E : LimitEvidence A L) : LimitClosed A L := by
  exact And.intro E.coneClosed (And.intro E.limitObjectClosed E.universalPropertyClosed)

theorem limit_bridge (A : AdmissibleClass) (L : LimitPackage A) :
    LimitClosed A L → bridgeClosed A := by
  intro h
  exact bridge_from_admissible_class A

end CategoryTheoryCategoricalLogicCanonicalLaneLean
end HautevilleHouse