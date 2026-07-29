import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalLogicCanonicalLaneLean

structure AdjointFunctorPackage where
  leftAdjoint : Type -> Type
  rightAdjoint : Type -> Type
  unitNaturalTransformation : Prop
  counitNaturalTransformation : Prop
  triangleIdentities : Prop
  adjointFunctorTheoremStatements : Prop

structure AdjointFunctorEvidence (A : AdjointFunctorPackage) where
  unitNaturalTransformationClosed : A.unitNaturalTransformation
  counitNaturalTransformationClosed : A.counitNaturalTransformation
  triangleIdentitiesClosed : A.triangleIdentities
  adjointFunctorTheoremStatementsClosed : A.adjointFunctorTheoremStatements

def AdjointFunctorClosed (A : AdjointFunctorPackage) : Prop :=
  A.unitNaturalTransformation ∧ A.counitNaturalTransformation ∧ A.triangleIdentities ∧ A.adjointFunctorTheoremStatements

theorem adjoint_functor_closed_from_evidence (A : AdjointFunctorPackage) (E : AdjointFunctorEvidence A) : AdjointFunctorClosed A := by
  exact And.intro E.unitNaturalTransformationClosed (And.intro E.counitNaturalTransformationClosed (And.intro E.triangleIdentitiesClosed E.adjointFunctorTheoremStatementsClosed))

end CategoryTheoryCategoricalLogicCanonicalLaneLean
end HautevilleHouse