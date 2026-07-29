import DivisionAlgebrasJordanAlgebrasFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DivisionAlgebrasJordanAlgebrasFoundationCanonicalLaneLean

structure AdmittedObject where
  algebraType : Type u
  multiplication : algebraType → algebraType → algebraType
  unit : algebraType
  jordanIdentity : ∀ a b : algebraType, (a * b) * (a * a) = a * (b * (a * a))
  closureProperty : Prop
  closureWitness : closureProperty

def bridgeClosed (A : AdmissibleClass) : Prop :=
  AdmittedObject.closureProperty A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.closureWitness

end DivisionAlgebrasJordanAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse
