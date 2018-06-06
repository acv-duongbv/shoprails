class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :name
      t.text :address
      t.string :email
      t.string :phone_number
      t.string :pay_type
      t.timestamps
      t.references :cart, index: true
    end
  end
end
