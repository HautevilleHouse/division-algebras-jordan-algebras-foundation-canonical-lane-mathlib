import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisionAlgebrasJordanAlgebrasFoundationCanonicalLaneLean

structure JordanAlgebraPackage where
  carrier : Type u
  zero : carrier
  one : carrier
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  neg : carrier → carrier
  addAssoc : ∀ a b c : carrier, add (add a b) c = add a (add b c)
  addComm : ∀ a b c : carrier, add a b = add b a
  addZero : ∀ a : carrier, add a zero = a
  addNeg : ∀ a : carrier, add a (neg a) = zero
  mulComm : ∀ a b : carrier, mul a b = mul b a
  jordanIdentity : ∀ a b : carrier, mul (mul (mul a a) b) a = mul (mul a a) (mul b a)
  mulOne : ∀ a : carrier, mul a one = a
  leftDistrib : ∀ a b c : carrier, mul a (add b c) = add (mul a b) (mul a c)
  rightDistrib : ∀ a b c : carrier, mul (add a b) c = add (mul a c) (mul b c)
  zeroNeOne : zero ≠ one

structure JordanAlgebraEvidence (J : JordanAlgebraPackage) where
  addAssocClosed : J.addAssoc
  addCommClosed : J.addComm
  addZeroClosed : J.addZero
  addNegClosed : J.addNeg
  mulCommClosed : J.mulComm
  jordanIdentityClosed : J.jordanIdentity
  mulOneClosed : J.mulOne
  leftDistribClosed : J.leftDistrib
  rightDistribClosed : J.rightDistrib
  zeroNeOneClosed : J.zeroNeOne

def JordanAlgebraClosed (J : JordanAlgebraPackage) : Prop :=
  J.addAssoc ∧ J.addComm ∧ J.addZero ∧ J.addNeg ∧ J.mulComm ∧
  J.jordanIdentity ∧ J.mulOne ∧ J.leftDistrib ∧ J.rightDistrib ∧ J.zeroNeOne

theorem jordan_algebra_closed_from_evidence (J : JordanAlgebraPackage)
    (E : JordanAlgebraEvidence J) : JordanAlgebraClosed J := by
  exact And.intro E.addAssocClosed
    (And.intro E.addCommClosed
      (And.intro E.addZeroClosed
        (And.intro E.addNegClosed
          (And.intro E.mulCommClosed
            (And.intro E.jordanIdentityClosed
              (And.intro E.mulOneClosed
                (And.intro E.leftDistribClosed
                  (And.intro E.rightDistribClosed E.zeroNeOneClosed))))))))

end DivisionAlgebrasJordanAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse