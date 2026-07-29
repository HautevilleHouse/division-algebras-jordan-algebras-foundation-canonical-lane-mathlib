import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisionAlgebrasJordanAlgebrasFoundationCanonicalLaneLean

structure DivisionAlgebraAdmittedObject where
  algebra : Type u
  addition : algebra → algebra → algebra
  multiplication : algebra → algebra → algebra
  zero : algebra
  one : algebra
  additiveGroup : AddGroup algebra
  multiplicativeGroup : Group (units algebra)
  divisionAlgebra : DivisionRing algebra

structure AdmissibleClass where
  object : DivisionAlgebraAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  DivisionAlgebraAdmittedObject.conclusion A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DivisionAlgebrasJordanAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse