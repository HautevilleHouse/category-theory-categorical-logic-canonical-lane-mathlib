import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalLogicCanonicalLaneLean

structure LimitColimitPackage where
  diagramCategory : Type u
  coneObject : Type v
  universalProperty : Prop
  colimitCoconeObject : Type w
  colimitUniversalProperty : Prop
  limitsAndColimitsExist : Prop

structure LimitColimitEvidence (L : LimitColimitPackage) where
  universalPropertyClosed : L.universalProperty
  colimitUniversalPropertyClosed : L.colimitUniversalProperty
  limitsAndColimitsExistClosed : L.limitsAndColimitsExist

def LimitColimitClosed (L : LimitColimitPackage) : Prop :=
  L.universalProperty ∧ L.colimitUniversalProperty ∧ L.limitsAndColimitsExist

theorem limit_colimit_closed_from_evidence (L : LimitColimitPackage) (E : LimitColimitEvidence L) : LimitColimitClosed L := by
  exact And.intro E.universalPropertyClosed (And.intro E.colimitUniversalPropertyClosed E.limitsAndColimitsExistClosed)

end CategoryTheoryCategoricalLogicCanonicalLaneLean
end HautevilleHouse