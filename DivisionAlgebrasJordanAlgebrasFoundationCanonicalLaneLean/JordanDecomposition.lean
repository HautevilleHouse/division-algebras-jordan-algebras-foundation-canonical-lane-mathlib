import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DivisionAlgebrasJordanAlgebrasFoundationCanonicalLaneLean.JordanAlgebraStructure

namespace HautevilleHouse
namespace DivisionAlgebrasJordanAlgebrasFoundationCanonicalLaneLean

structure JordanDecompositionPackage (k : Type u) [CommRing k] (J : JordanAlgebraPackage k) where
  idempotents : Set (J.carrier)
  decomposition : ∀ a : J.carrier, ∃ (e : J.carrier), e ∈ idempotents ∧ ∃ (b : J.carrier), J.mul e b = b
  orthogonalIdempotents : ∀ e f : J.carrier, e ∈ idempotents → f ∈ idempotents → J.mul e f = J.zero → e = f

structure JordanDecompositionEvidence (k : Type u) [CommRing k] (J : JordanAlgebraPackage k) (JD : JordanDecompositionPackage k J) where
  decompositionClosed : JD.decomposition
  orthogonalIdempotentsClosed : JD.orthogonalIdempotents

def JordanDecompositionClosed (k : Type u) [CommRing k] (J : JordanAlgebraPackage k) (JD : JordanDecompositionPackage k J) : Prop :=
  JD.decomposition ∧ JD.orthogonalIdempotents

theorem jordan_decomposition_closed_from_evidence (k : Type u) [CommRing k] (J : JordanAlgebraPackage k) (JD : JordanDecompositionPackage k J) (E : JordanDecompositionEvidence k J JD) :
    JordanDecompositionClosed k J JD := by
  exact And.intro E.decompositionClosed E.orthogonalIdempotentsClosed

end DivisionAlgebrasJordanAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse