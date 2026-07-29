import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalLogicCanonicalLaneLean

structure AdjunctionPackage (A : AdmissibleClass) where
  leftAdjoint : Type u
  rightAdjoint : Type v
  unit : Prop
  counit : Prop
  triangularIdentities : Prop
  adjunctionIso : Prop
  leftAdjointClosed : Prop
  rightAdjointClosed : Prop
  unitClosed : Prop
  counitClosed : Prop
  triangularIdentitiesClosed : Prop
  adjunctionIsoClosed : Prop

structure AdjunctionEvidence (A : AdmissibleClass) (Adj : AdjunctionPackage A) where
  leftAdjointClosed : Adj.leftAdjointClosed
  rightAdjointClosed : Adj.rightAdjointClosed
  unitClosed : Adj.unitClosed
  counitClosed : Adj.counitClosed
  triangularIdentitiesClosed : Adj.triangularIdentitiesClosed
  adjunctionIsoClosed : Adj.adjunctionIsoClosed

def AdjunctionClosed (A : AdmissibleClass) (Adj : AdjunctionPackage A) : Prop :=
  Adj.leftAdjointClosed ∧ Adj.rightAdjointClosed ∧ Adj.unitClosed ∧
  Adj.counitClosed ∧ Adj.triangularIdentitiesClosed ∧ Adj.adjunctionIsoClosed

theorem adjunction_closed_from_evidence (A : AdmissibleClass)
    (Adj : AdjunctionPackage A) (E : AdjunctionEvidence A Adj) :
    AdjunctionClosed A Adj := by
  exact And.intro E.leftAdjointClosed
    (And.intro E.rightAdjointClosed
      (And.intro E.unitClosed
        (And.intro E.counitClosed
          (And.intro E.triangularIdentitiesClosed E.adjunctionIsoClosed))))

theorem adjunction_bridge (A : AdmissibleClass) (Adj : AdjunctionPackage A) :
    AdjunctionClosed A Adj → bridgeClosed A := by
  intro h
  exact bridge_from_admissible_class A

end CategoryTheoryCategoricalLogicCanonicalLaneLean
end HautevilleHouse