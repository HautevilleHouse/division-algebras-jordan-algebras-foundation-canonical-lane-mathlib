import DivisionAlgebrasJordanAlgebrasFoundationCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace DivisionAlgebrasJordanAlgebrasFoundationCanonicalLaneLean

def DivisionWitnessClosed (O : AdmittedDivisionObject) : Prop :=
  O.alternativeLaws

theorem division_witness_closed_from_object (O : AdmittedDivisionObject) :
    DivisionWitnessClosed O := by
  exact O.conclusion

end DivisionAlgebrasJordanAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse