class User < ApplicationRecord
    has_many :orders
    has_many :products

    has_attached_file :image, styles: { medium: "300x300", thumb: "100x100" }, :default_url => ":style/paint.jpg", presence: true
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates :password, :length => {:within => 4..15}, :if => :password

    def cart
        order = Order.find_by(user: self, is_cart: true)
        # when cart doesn't exist
        unless order
            order = Order.create(user: self)
        end
        order
    end
end
