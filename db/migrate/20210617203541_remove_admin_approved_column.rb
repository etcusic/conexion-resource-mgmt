class RemoveAdminApprovedColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :decks, :admin_approved
  end
end
