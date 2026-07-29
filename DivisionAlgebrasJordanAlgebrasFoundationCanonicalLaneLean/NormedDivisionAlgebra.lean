import DivisionAlgebrasJordanAlgebrasFoundationCanonicalLaneLean.JordanAlgebraFoundation

namespace HautevilleHouse
namespace DivisionAlgebrasJordanAlgebrasFoundationCanonicalLaneLean

structure NormedDivisionAlgebraPackage {A : DivisionAlgebraAdmittedObject}
    {D : DivisionAlgebraStructurePackage A} (J : JordanAlgebraFoundationPackage D) where
  norm : A.algebra → ℝ
  normAxioms : Prop
  completeness : Prop
  normAxiomsClosed : normAxioms
  completenessClosed : completeness

structure NormedDivisionAlgebraEvidence {A : DivisionAlgebraAdmittedObject}
    {D : DivisionAlgebraStructurePackage A} {J : JordanAlgebraFoundationPackage D}
    (N : NormedDivisionAlgebraPackage J) where
  normAxiomsClosed : N.normAxioms
  completenessClosed : N.completeness

def NormedDivisionAlgebraClosed {A : DivisionAlgebraAdmittedObject}
    {D : DivisionAlgebraStructurePackage A} {J : JordanAlgebraFoundationPackage D}
    (N : NormedDivisionAlgebraPackage J) : Prop :=
  N.normAxioms ∧ N.completeness

theorem normed_division_algebra_closed_from_evidence
    {A : DivisionAlgebraAdmittedObject} {D : DivisionAlgebraStructurePackage A}
    {J : JordanAlgebraFoundationPackage D} (N : NormedDivisionAlgebraPackage J)
    (E : NormedDivisionAlgebraEvidence N) : NormedDivisionAlgebraClosed N := by
  exact And.intro E.normAxiomsClosed E.completenessClosed

end DivisionAlgebrasJordanAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse