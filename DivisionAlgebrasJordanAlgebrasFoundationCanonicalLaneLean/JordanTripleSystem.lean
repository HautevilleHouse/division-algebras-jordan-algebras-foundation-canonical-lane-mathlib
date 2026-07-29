import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisionAlgebrasJordanAlgebrasFoundationCanonicalLaneLean

structure JordanTripleSystemPackage where
  carrier : Type u
  trip : carrier → carrier → carrier → carrier
  symm : ∀ x y z : carrier, trip x y z = trip z y x
  jordanTripleIdentity : ∀ x y z w v : carrier,
    trip (trip x y z) w v = trip x y (trip z w v) + trip z y (trip x w v) - trip (trip x w z) y v

def JordanTripleSystemEvidence (J : JordanTripleSystemPackage) : Prop :=
  J.symm ∧ J.jordanTripleIdentity

def JordanTripleSystemClosed (J : JordanTripleSystemPackage) : Prop :=
  J.symm ∧ J.jordanTripleIdentity

theorem jordan_triple_system_closed_from_evidence (J : JordanTripleSystemPackage)
    (E : JordanTripleSystemEvidence J) : JordanTripleSystemClosed J := by
  exact E

end DivisionAlgebrasJordanAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse