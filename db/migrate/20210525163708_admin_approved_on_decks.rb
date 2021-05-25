class AdminApprovedOnDecks < ActiveRecord::Migration[6.1]
  def change
    add_column :decks, :admin_approved, :boolean
  end
end
