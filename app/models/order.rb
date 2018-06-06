class Order < ApplicationRecord
  has_many :line_items, :dependent => :destroy
  validates :name, :email, :address, :pay_type, :phone_number, presence: true
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  PAYMENT_TYPES = ["Paypal", "Google checkout"]
  validates :pay_type, :inclusion => PAYMENT_TYPES
end
