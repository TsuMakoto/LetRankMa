module ParamsHelper

using Genie
import SearchLight: AbstractModel

struct Params
  require::Function
  function require(modeltype::Type{T},
                   params,
                   columns::Array{Symbol})::T where {T<:AbstractModel}
    vals = map(columns) do column::Symbol
      params(column)
    end

    modeltype(vals...)
  end
  Params(modeltype::Type{T} where {T<:AbstractModel},
         params,
         columns::Array{Symbol}) =
  new(() -> require(params, modeltype, columns))
end

end
