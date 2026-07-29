import HautevilleHouse.CategoryTheoryCategoricalLogicCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalLogicCanonicalLaneLean

structure LimitColimitPackage (A : AdmissibleClass) where
  hasLimits : Prop
  hasColimits : Prop
  limitUniversal : Prop
  colimitUniversal : Prop
  completenessClosed : Prop

structure LimitColimitEvidence (A : AdmissibleClass) (L : LimitColimitPackage A) where
  hasLimitsClosed : L.hasLimits
  hasColimitsClosed : L.hasColimits
  limitUniversalClosed : L.limitUniversal
  colimitUniversalClosed : L.colimitUniversal
  completenessClosedClosed : L.completenessClosed

def LimitColimitClosed (A : AdmissibleClass) (L : LimitColimitPackage A) : Prop :=
  L.hasLimits ∧ L.hasColimits ∧ L.limitUniversal ∧ L.colimitUniversal ∧ L.completenessClosed

theorem limit_colimit_closed_from_evidence (A : AdmissibleClass) (L : LimitColimitPackage A)
    (E : LimitColimitEvidence A L) : LimitColimitClosed A L := by
  exact And.intro E.hasLimitsClosed
    (And.intro E.hasColimitsClosed
      (And.intro E.limitUniversalClosed
        (And.intro E.colimitUniversalClosed E.completenessClosedClosed)))

end CategoryTheoryCategoricalLogicCanonicalLaneLean
end HautevilleHouse