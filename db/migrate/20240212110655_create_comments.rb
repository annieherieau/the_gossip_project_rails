class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.belongs_to :commenting_user, index: true
      t.references :commented_gossip, index: true

      t.timestamps
    end
  end
end
