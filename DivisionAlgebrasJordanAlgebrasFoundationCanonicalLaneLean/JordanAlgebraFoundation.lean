import DivisionAlgebrasJordanAlgebrasFoundationCanonicalLaneLean.DivisionAlgebraStructure

namespace HautevilleHouse
namespace DivisionAlgebrasJordanAlgebrasFoundationCanonicalLaneLean

structure JordanAlgebraFoundationPackage {A : DivisionAlgebraAdmittedObject}
    (D : DivisionAlgebraStructurePackage A) where
  jordanIdentity : Prop
  powerAssociativity : Prop
  formallyReal : Prop
  jordanIdentityClosed : jordanIdentity
  powerAssociativityClosed : powerAssociativity
  formallyRealClosed : formallyReal

structure JordanAlgebraFoundationEvidence {A : DivisionAlgebraAdmittedObject}
    {D : DivisionAlgebraStructurePackage A} (J : JordanAlgebraFoundationPackage D) where
  jordanIdentityClosed : J.jordanIdentity
  powerAssociativityClosed : J.powerAssociativity
  formallyRealClosed : J.formallyReal

def JordanAlgebraFoundationClosed {A : DivisionAlgebraAdmittedObject}
    {D : DivisionAlgebraStructurePackage A} (J : JordanAlgebraFoundationPackage D) : Prop :=
  J.jordanIdentity ∧ J.powerAssociativity ∧ J.formallyReal

theorem jordan_algebra_foundation_closed_from_evidence
    {A : DivisionAlgebraAdmittedObject} {D : DivisionAlgebraStructurePackage A}
    (J : JordanAlgebraFoundationPackage D) (E : JordanAlgebraFoundationEvidence J) :
    JordanAlgebraFoundationClosed J := by
  exact And.intro E.jordanIdentityClosed (And.intro E.powerAssociativityClosed E.formallyRealClosed)

end DivisionAlgebrasJordanAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse