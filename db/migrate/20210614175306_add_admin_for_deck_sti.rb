class AddAdminForDeckSti < ActiveRecord::Migration[6.1]
  def change
    add_column :decks, :type, :string
    add_column :decks, :original_deck, :integer
  end
end
