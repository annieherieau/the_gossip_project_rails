class CreateGossips < ActiveRecord::Migration[7.1]
  def change
    create_table :gossips do |t|
      t.string :title
      t.text :content
      t.references :author, index: true

      t.timestamps
    end
  end
end
