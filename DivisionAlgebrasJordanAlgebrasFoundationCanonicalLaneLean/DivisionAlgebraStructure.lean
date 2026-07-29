import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisionAlgebrasJordanAlgebrasFoundationCanonicalLaneLean

structure DivisionAlgebraPackage (k : Type u) [Field k] where
  carrier : Type v
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  smul : k → carrier → carrier
  inv : carrier → carrier
  zero : carrier
  one : carrier
  associativity : ∀ a b c : carrier, mul (mul a b) c = mul a (mul b c)
  distributivity : ∀ a b c : carrier, mul a (add b c) = add (mul a b) (mul a c)
  inverseProperty : ∀ a : carrier, a ≠ zero → mul a (inv a) = one ∧ mul (inv a) a = one

structure DivisionAlgebraEvidence (k : Type u) [Field k] (D : DivisionAlgebraPackage k) where
  associativityClosed : D.associativity
  distributivityClosed : D.distributivity
  inversePropertyClosed : D.inverseProperty

def DivisionAlgebraClosed (k : Type u) [Field k] (D : DivisionAlgebraPackage k) : Prop :=
  D.associativity ∧ D.distributivity ∧ D.inverseProperty

theorem division_algebra_closed_from_evidence (k : Type u) [Field k] (D : DivisionAlgebraPackage k) (E : DivisionAlgebraEvidence k D) :
    DivisionAlgebraClosed k D := by
  exact And.intro E.associativityClosed (And.intro E.distributivityClosed E.inversePropertyClosed)

end DivisionAlgebrasJordanAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse