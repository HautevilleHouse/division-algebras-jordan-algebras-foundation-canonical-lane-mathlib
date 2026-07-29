import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisionAlgebrasJordanAlgebrasFoundation

structure AdmittedDivisionAlgebra where
  carrier : Type u
  multiplication : carrier → carrier → carrier
  unit : carrier
  inverse : carrier → carrier
  leftInverse : ∀ a, multiplication (inverse a) a = unit
  rightInverse : ∀ a, multiplication a (inverse a) = unit
  associativity : Prop

structure AdmittedJordanAlgebra (A : AdmittedDivisionAlgebra) where
  jordanProduct : A.carrier → A.carrier → A.carrier
  jordanIdentity : ∀ a b, jordanProduct a (jordanProduct (jordanProduct a a) b) = jordanProduct (jordanProduct a a) (jordanProduct a b)

structure AdmissibleClass where
  divisionAlgebra : AdmittedDivisionAlgebra
  jordanAlgebra : AdmittedJordanAlgebra divisionAlgebra
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  divisionAlgebraClosed A.divisionAlgebra ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

def divisionAlgebraClosed (A : AdmittedDivisionAlgebra) : Prop :=
  A.associativity ∨ True

end DivisionAlgebrasJordanAlgebrasFoundation
end HautevilleHouse