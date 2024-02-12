class AddReferenceToUser < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :team, foreign_key: true
    add_column :users, :is_admin, :boolean
  end
end
