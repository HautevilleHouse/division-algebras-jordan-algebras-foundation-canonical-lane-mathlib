import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisionAlgebrasJordanAlgebrasFoundation

open HautevilleHouse.CanonicalLaneMathlibCore

structure DivisionJordanEndgameState where
  object : AdmissibleClass

def divisionJordanProjection : Projection DivisionJordanEndgameState := {
  toFun := fun x => x
  idempotent := by intro x; rfl
}

theorem division_jordan_projection_idempotent (x : DivisionJordanEndgameState) :
    divisionJordanProjection.toFun (divisionJordanProjection.toFun x) = divisionJordanProjection.toFun x := by
  exact divisionJordanProjection.idempotent x

end DivisionAlgebrasJordanAlgebrasFoundation
end HautevilleHouse