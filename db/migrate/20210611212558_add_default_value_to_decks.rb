class AddDefaultValueToDecks < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:decks, :admin_approved, false)
  end
end
