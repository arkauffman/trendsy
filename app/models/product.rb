class Product < ApplicationRecord
  belongs_to :user
  has_many :line_items
  has_many :orders, through: :line_items

  has_attached_file :image, styles: { medium: "300x300", thumb: "100x100" }, :default_url => ":style/paint.jpg", presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :title, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :description, presence: true
end
