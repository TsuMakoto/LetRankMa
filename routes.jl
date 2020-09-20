using Genie.Router
import Api: IndexRentalParty

route("/api/rentalparties",
      IndexRentalParty.call,
      method=GET,
      named=:index_categories)
