module CreateTableRentalparties

import SearchLight.Migrations: create_table, column, primary_key, add_index, drop_table

function up()
  create_table(:rentalparties) do
    [
      primary_key()
      column(:name, :string)
      column(:image, :string)
      column(:generation, :integer)
      column(:season, :integer)
      column(:rule, :string)
      column(:rank, :integer)
      column(:note, :string)
    ]
  end
end

function down()
  drop_table(:rentalparties)
end

end
