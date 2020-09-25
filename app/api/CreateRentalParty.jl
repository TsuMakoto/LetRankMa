module CreateRentalParty

include("../helpers/APIHelper.jl")

using Genie
import RentalParties:RentalParty
using SearchLight
using APIHelper.QueryHelper

function call()
  getter = QueryHelper.Getter(:all, RentalParty)
  response = getter.exec()
  response |> getter.render
end

end
