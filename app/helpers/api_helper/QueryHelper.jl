module QueryHelper

include("./ResponseHelper.jl")

using Genie
using SearchLight
import SearchLight: AbstractModel
import ResponseHelper:response
import ResponseHelper:Success
import ResponseHelper:Failure

abstract type DoQuery end

struct Saver <: DoQuery
  repository::AbstractModel
  exec::Function
  exec!::Function
  render::Function
  function save(repository::AbstractModel, ormapper=SearchLight)::Dict{Symbol,Any}
    if ormapper.save(repository)
      return repository |> Success |> response
    end

    "500 Internal Error" |> Failure |> response
  end

  function save!(repository::AbstractModel, ormapper=SearchLight)::Dict{Symbol,Any}
    ormapper.save!(repository)
    repository |> Success |> response
  end

  Saver(repository::AbstractModel,
        renderer=Genie.Renderer.Json.json;
        ormapper=SearchLight) =
  new(repository,
      () -> save(repository, ormapper),
      () -> save!(repository, ormapper),
      (data::Dict{Symbol,Any}) -> render(data, renderer))
end

struct Getter <: DoQuery
  exec::Function
  render::Function
  function get(ormapper, methodname::Symbol, args...)
    ormapper.:($methodname)(args...) |> Success |> response
  end

  Getter(methodname::Symbol,
         args...;
         renderer=Genie.Renderer.Json.json,
         ormapper=SearchLight) =
  new(() -> get(ormapper, methodname, args...),
      (data::Dict{Symbol,Any}) -> render(data, renderer))
end

function render(response::Dict{Symbol,Any}, renderer=Genie.Renderer.Json.json)::Genie.Renderer.HTTP.Response
  renderer(response[:data], status=response[:status])
end


end
