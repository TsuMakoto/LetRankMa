module LetRankMa

using Logging, LoggingExtras

function main()
  Base.eval(Main, :(const UserApp = LetRankMa))

  include(joinpath("..", "genie.jl"))

  Base.eval(Main, :(const Genie = LetRankMa.Genie))
  Base.eval(Main, :(using Genie))
end; main()

end
