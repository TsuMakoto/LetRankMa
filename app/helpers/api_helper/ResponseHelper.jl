module ResponseHelper

import SearchLight: AbstractModel

abstract type ResponseType end

function response(messagetype::ResponseType)::Dict{Symbol,Any}
  Dict(:data => messagetype.data,
       :status  => messagetype.status)
end

struct Success <: ResponseType
  data
  status::Integer
  Success(data) = new(data,  200)
end

struct Failure <: ResponseType
  data
  status::Integer
  Failure(data::String) = new(data,  500)
end

end
