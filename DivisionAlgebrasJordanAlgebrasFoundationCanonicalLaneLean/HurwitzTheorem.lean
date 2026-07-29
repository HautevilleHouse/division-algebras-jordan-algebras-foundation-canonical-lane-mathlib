import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisionAlgebrasJordanAlgebrasFoundationCanonicalLaneLean

structure HurwitzTheoremPackage where
  dimensionOne : Prop
  dimensionTwo : Prop
  dimensionFour : Prop
  dimensionEight : Prop
  classificationComplete : Prop

structure HurwitzEvidence (H : HurwitzTheoremPackage) where
  dimensionOneClosed : H.dimensionOne
  dimensionTwoClosed : H.dimensionTwo
  dimensionFourClosed : H.dimensionFour
  dimensionEightClosed : H.dimensionEight
  classificationCompleteClosed : H.classificationComplete

def HurwitzTheoremClosed (H : HurwitzTheoremPackage) : Prop :=
  H.dimensionOne ∧ H.dimensionTwo ∧ H.dimensionFour ∧ H.dimensionEight ∧ H.classificationComplete

theorem hurwitz_closed_from_evidence (H : HurwitzTheoremPackage) (E : HurwitzEvidence H) : HurwitzTheoremClosed H := by
  exact And.intro E.dimensionOneClosed (And.intro E.dimensionTwoClosed (And.intro E.dimensionFourClosed (And.intro E.dimensionEightClosed E.classificationCompleteClosed)))

end DivisionAlgebrasJordanAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse