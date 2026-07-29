import DivisionAlgebrasJordanAlgebrasFoundationCanonicalLaneLean.NormedDivisionAlgebra

namespace HautevilleHouse
namespace DivisionAlgebrasJordanAlgebrasFoundationCanonicalLaneLean

structure FrobeniusClassificationPackage {A : DivisionAlgebraAdmittedObject}
    {D : DivisionAlgebraStructurePackage A} {J : JordanAlgebraFoundationPackage D}
    (N : NormedDivisionAlgebraPackage J) where
  realsOnly : Prop
  complexesOnly : Prop
  quaternionsOnly : Prop
  octonionsOnly : Prop
  classificationComplete : Prop
  realsOnlyClosed : realsOnly
  complexesOnlyClosed : complexesOnly
  quaternionsOnlyClosed : quaternionsOnly
  octonionsOnlyClosed : octonionsOnly
  classificationCompleteClosed : classificationComplete

structure FrobeniusClassificationEvidence {A : DivisionAlgebraAdmittedObject}
    {D : DivisionAlgebraStructurePackage A} {J : JordanAlgebraFoundationPackage D}
    {N : NormedDivisionAlgebraPackage J} (F : FrobeniusClassificationPackage N) where
  realsOnlyClosed : F.realsOnly
  complexesOnlyClosed : F.complexesOnly
  quaternionsOnlyClosed : F.quaternionsOnly
  octonionsOnlyClosed : F.octonionsOnly
  classificationCompleteClosed : F.classificationComplete

def FrobeniusClassificationClosed {A : DivisionAlgebraAdmittedObject}
    {D : DivisionAlgebraStructurePackage A} {J : JordanAlgebraFoundationPackage D}
    {N : NormedDivisionAlgebraPackage J} (F : FrobeniusClassificationPackage N) : Prop :=
  F.realsOnly ∧ F.complexesOnly ∧ F.quaternionsOnly ∧ F.octonionsOnly ∧ F.classificationComplete

theorem frobenius_classification_closed_from_evidence
    {A : DivisionAlgebraAdmittedObject} {D : DivisionAlgebraStructurePackage A}
    {J : JordanAlgebraFoundationPackage D} {N : NormedDivisionAlgebraPackage J}
    (F : FrobeniusClassificationPackage N) (E : FrobeniusClassificationEvidence F) :
    FrobeniusClassificationClosed F := by
  exact And.intro E.realsOnlyClosed (And.intro E.complexesOnlyClosed
    (And.intro E.quaternionsOnlyClosed (And.intro E.octonionsOnlyClosed E.classificationCompleteClosed)))

end DivisionAlgebrasJordanAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse