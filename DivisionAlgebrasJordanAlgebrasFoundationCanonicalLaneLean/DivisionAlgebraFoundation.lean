import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisionAlgebrasJordanAlgebrasFoundationCanonicalLaneLean

structure DivisionAlgebra (k : Type) [Field k] where
  carrier : Type
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  inv : carrier → carrier
  associative : Prop
  alternative : Prop
  divisionProp : ∀ a ≠ 0, ∃ b, mul a b = 1

def DivisionAlgebraClosed (D : DivisionAlgebra k) : Prop :=
  D.associative ∧ D.alternative ∧ D.divisionProp

end DivisionAlgebrasJordanAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse