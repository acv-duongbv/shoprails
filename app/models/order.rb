class Order < ApplicationRecord
  has_many :line_items, :dependent => :destroy
  validates :name, :email, :address, :pay_type, :phone_number, presence: true
  PAYMENT_TYPES = ["Paypal", "Google checkout"]
  validates :pay_type, :inclusion => PAYMENT_TYPES

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
