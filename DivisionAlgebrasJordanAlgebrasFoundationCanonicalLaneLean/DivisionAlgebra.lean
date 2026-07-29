import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisionAlgebrasJordanAlgebrasFoundationCanonicalLaneLean

structure DivisionAlgebraPackage where
  carrier : Type u
  zero : carrier
  one : carrier
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  neg : carrier → carrier
  inv : carrier → carrier
  zeroNeOne : zero ≠ one
  addAssoc : ∀ a b c : carrier, add (add a b) c = add a (add b c)
  addComm : ∀ a b : carrier, add a b = add b a
  addZero : ∀ a : carrier, add a zero = a
  addNeg : ∀ a : carrier, add a (neg a) = zero
  mulAssoc : ∀ a b c : carrier, mul (mul a b) c = mul a (mul b c)
  mulOne : ∀ a : carrier, mul a one = a
  mulZero : ∀ a : carrier, mul a zero = zero
  leftDistrib : ∀ a b c : carrier, mul a (add b c) = add (mul a b) (mul a c)
  rightDistrib : ∀ a b c : carrier, mul (add a b) c = add (mul a c) (mul b c)
  invMul : ∀ a : carrier, a ≠ zero → mul (inv a) a = one
  mulInv : ∀ a : carrier, a ≠ zero → mul a (inv a) = one

structure DivisionAlgebraEvidence (D : DivisionAlgebraPackage) where
  zeroNeOneClosed : D.zeroNeOne
  addAssocClosed : D.addAssoc
  addCommClosed : D.addComm
  addZeroClosed : D.addZero
  addNegClosed : D.addNeg
  mulAssocClosed : D.mulAssoc
  mulOneClosed : D.mulOne
  mulZeroClosed : D.mulZero
  leftDistribClosed : D.leftDistrib
  rightDistribClosed : D.rightDistrib
  invMulClosed : D.invMul
  mulInvClosed : D.mulInv

def DivisionAlgebraClosed (D : DivisionAlgebraPackage) : Prop :=
  D.zeroNeOne ∧ D.addAssoc ∧ D.addComm ∧ D.addZero ∧ D.addNeg ∧
  D.mulAssoc ∧ D.mulOne ∧ D.mulZero ∧ D.leftDistrib ∧ D.rightDistrib ∧
  D.invMul ∧ D.mulInv

theorem division_algebra_closed_from_evidence (D : DivisionAlgebraPackage)
    (E : DivisionAlgebraEvidence D) : DivisionAlgebraClosed D := by
  exact And.intro E.zeroNeOneClosed
    (And.intro E.addAssocClosed
      (And.intro E.addCommClosed
        (And.intro E.addZeroClosed
          (And.intro E.addNegClosed
            (And.intro E.mulAssocClosed
              (And.intro E.mulOneClosed
                (And.intro E.mulZeroClosed
                  (And.intro E.leftDistribClosed
                    (And.intro E.rightDistribClosed
                      (And.intro E.invMulClosed E.mulInvClosed))))))))))

end DivisionAlgebrasJordanAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse