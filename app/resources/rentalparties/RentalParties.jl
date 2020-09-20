module RentalParties

import SearchLight: AbstractModel, DbId
import Base: @kwdef

export RentalParty

@kwdef mutable struct RentalParty <: AbstractModel
  id::DbId          = DbId()
  name::String      = ""
  image::String     = ""
  generation::Int32 = 1
  season::Int32     = 1
  rule::String      = ""
  rank::Int32       = 1
  note::String      = ""
end

end
