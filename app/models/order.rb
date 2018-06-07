class Order < ApplicationRecord
  has_many :line_items, :dependent => :destroy
  validates :name, :email, :address, :pay_type, :phone_number, presence: true
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  PAYMENT_TYPES = ["Paypal", "Google checkout"]
  validates :pay_type, :inclusion => PAYMENT_TYPES

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end

  def paypal_url(return_path)
    puts "??????????????????????????"
    puts return_path
    values = {
      business: "bvduong76-facilitator@gmail.com",
      cmd: "_xclick",
      upload: 1,
      return: "#{Rails.application.secrets.app_host}#{return_path}",
      invoice: id,
      amount: self.total_price,
      item_name: self.name,
      item_number: self.id,
      quantity: "1",
      notify_url: "#{Rails.application.secrets.app_host}/order/hook",
    }
    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end
end
