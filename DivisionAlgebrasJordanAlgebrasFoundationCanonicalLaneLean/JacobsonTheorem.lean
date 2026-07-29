import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisionAlgebrasJordanAlgebrasFoundationCanonicalLaneLean

structure JacobsonTheoremPackage where
  jordanAlgebraIsPowerAssoc : Prop
  simpleFiniteJordanClassification : Prop
  exceptionalJordanAlgebras : Prop
  spinFactorClassification : Prop

structure JacobsonEvidence (J : JacobsonTheoremPackage) where
  jordanAlgebraIsPowerAssocClosed : J.jordanAlgebraIsPowerAssoc
  simpleFiniteJordanClassificationClosed : J.simpleFiniteJordanClassification
  exceptionalJordanAlgebrasClosed : J.exceptionalJordanAlgebras
  spinFactorClassificationClosed : J.spinFactorClassification

def JacobsonTheoremClosed (J : JacobsonTheoremPackage) : Prop :=
  J.jordanAlgebraIsPowerAssoc ∧ J.simpleFiniteJordanClassification ∧ J.exceptionalJordanAlgebras ∧ J.spinFactorClassification

theorem jacobson_closed_from_evidence (J : JacobsonTheoremPackage) (E : JacobsonEvidence J) : JacobsonTheoremClosed J := by
  exact And.intro E.jordanAlgebraIsPowerAssocClosed (And.intro E.simpleFiniteJordanClassificationClosed (And.intro E.exceptionalJordanAlgebrasClosed E.spinFactorClassificationClosed))

end DivisionAlgebrasJordanAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse