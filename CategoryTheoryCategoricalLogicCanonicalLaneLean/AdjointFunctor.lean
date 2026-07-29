import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalLogicCanonicalLaneLean

structure AdjointFunctorPackage where
  sourceCategory : CategoryObject
  targetCategory : CategoryObject
  leftAdjoint : FunctorAdapter targetCategory sourceCategory
  rightAdjoint : FunctorAdapter sourceCategory targetCategory
  unit : Prop
  counit : Prop
  triangleIdentities : Prop

structure AdjointFunctorEvidence (A : AdjointFunctorPackage) where
  unitClosed : A.unit
  counitClosed : A.counit
  triangleIdentitiesClosed : A.triangleIdentities

def AdjointFunctorClosed (A : AdjointFunctorPackage) : Prop :=
  A.unit ∧ A.counit ∧ A.triangleIdentities

theorem adjoint_functor_closed_from_evidence (A : AdjointFunctorPackage) (E : AdjointFunctorEvidence A) :
    AdjointFunctorClosed A := by
  exact And.intro E.unitClosed (And.intro E.counitClosed E.triangleIdentitiesClosed)

end CategoryTheoryCategoricalLogicCanonicalLaneLean
end HautevilleHouse