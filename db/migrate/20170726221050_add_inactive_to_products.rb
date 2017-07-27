class AddInactiveToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :inactive, :boolean, default: false
  end
end
