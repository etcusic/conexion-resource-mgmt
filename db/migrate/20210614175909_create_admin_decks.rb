class CreateAdminDecks < ActiveRecord::Migration[6.1]
  def change
    create_table :admin_decks do |t|

      t.timestamps
    end
  end
end
