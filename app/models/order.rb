class Order < ApplicationRecord
  belongs_to :user
  has_many :line_items
  has_many :products, through: :line_items

  def add_product(product_id)
    product = Product.find(product_id)
    if product.quantity <= 0 then return nil end
    product.quantity = product.quantity - 1
    product.save

    item = LineItem.find_by(order: self, product: product)
    if item
      item.quantity = item.quantity + 1
      item.save
    else
      item = LineItem.create(order: self, product: product, quantity: 1)
    end
    item
  end

  def add(item_id)
    item = LineItem.find(item_id)
    product = Product.find(item.product.id)

    if product.quantity <= 0 then return nil end
    product.quantity = product.quantity - 1
    product.save

    item.quantity = item.quantity + 1
    item.save
  end

  def remove_product(item_id)
    item = LineItem.find(item_id)
    product = Product.find(item.product.id)

    product.quantity = product.quantity + 1
    product.save

    if item.quantity == 1
      item.destroy
    else
      item.quantity = item.quantity - 1
      item.save
    end
  end 
end