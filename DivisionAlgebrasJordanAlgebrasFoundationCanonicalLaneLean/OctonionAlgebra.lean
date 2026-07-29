import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DivisionAlgebrasJordanAlgebrasFoundationCanonicalLaneLean.DivisionAlgebra

namespace HautevilleHouse
namespace DivisionAlgebrasJordanAlgebrasFoundationCanonicalLaneLean

structure OctonionAlgebraPackage where
  carrier : Type u
  zero : carrier
  one : carrier
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  neg : carrier → carrier
  inv : carrier → carrier
  addAssoc : ∀ a b c : carrier, add (add a b) c = add a (add b c)
  addComm : ∀ a b c : carrier, add a b = add b a
  addZero : ∀ a : carrier, add a zero = a
  addNeg : ∀ a : carrier, add a (neg a) = zero
  mulAssoc : ∀ a b c : carrier, mul (mul a b) c = mul a (mul b c)
  mulOne : ∀ a : carrier, mul a one = a
  mulZero : ∀ a : carrier, mul a zero = zero
  leftDistrib : ∀ a b c : carrier, mul a (add b c) = add (mul a b) (mul a c)
  rightDistrib : ∀ a b c : carrier, mul (add a b) c = add (mul a c) (mul b c)
  invMul : ∀ a : carrier, a ≠ zero → mul (inv a) a = one
  mulInv : ∀ a : carrier, a ≠ zero → mul a (inv a) = one
  zeroNeOne : zero ≠ one
  notAssociative : ∃ a b c : carrier, mul (mul a b) c ≠ mul a (mul b c)
  alternative : ∀ a b : carrier, mul (mul a a) b = mul a (mul a b) ∧ mul (mul a b) b = mul a (mul b b)
  composition : ∀ a b : carrier, normSq (mul a b) = normSq a * normSq b
  where normSq : carrier → ℝ

structure OctonionAlgebraEvidence (O : OctonionAlgebraPackage) where
  divisionAlgebraEvidence : DivisionAlgebraEvidence
    { carrier := O.carrier, zero := O.zero, one := O.one, add := O.add, mul := O.mul,
      neg := O.neg, inv := O.inv, zeroNeOne := O.zeroNeOne, addAssoc := O.addAssoc,
      addComm := O.addComm, addZero := O.addZero, addNeg := O.addNeg, mulAssoc := O.mulAssoc,
      mulOne := O.mulOne, mulZero := O.mulZero, leftDistrib := O.leftDistrib,
      rightDistrib := O.rightDistrib, invMul := O.invMul, mulInv := O.mulInv }
  notAssociativeClosed : O.notAssociative
  alternativeClosed : O.alternative
  compositionClosed : O.composition

def OctonionAlgebraClosed (O : OctonionAlgebraPackage) : Prop :=
  DivisionAlgebraClosed
    { carrier := O.carrier, zero := O.zero, one := O.one, add := O.add, mul := O.mul,
      neg := O.neg, inv := O.inv, zeroNeOne := O.zeroNeOne, addAssoc := O.addAssoc,
      addComm := O.addComm, addZero := O.addZero, addNeg := O.addNeg, mulAssoc := O.mulAssoc,
      mulOne := O.mulOne, mulZero := O.mulZero, leftDistrib := O.leftDistrib,
      rightDistrib := O.rightDistrib, invMul := O.invMul, mulInv := O.mulInv } ∧
  O.notAssociative ∧ O.alternative ∧ O.composition

theorem octonion_algebra_closed_from_evidence (O : OctonionAlgebraPackage)
    (E : OctonionAlgebraEvidence O) : OctonionAlgebraClosed O := by
  refine And.intro (division_algebra_closed_from_evidence _ E.divisionAlgebraEvidence)
    (And.intro E.notAssociativeClosed (And.intro E.alternativeClosed E.compositionClosed))

end DivisionAlgebrasJordanAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse