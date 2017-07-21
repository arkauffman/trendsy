class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.float :price
      t.integer :quantity
      t.string :description
      t.attachment :image

      t.timestamps
    end
  end
end
