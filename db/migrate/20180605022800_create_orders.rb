class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :name
      t.text :address
      t.string :email
      t.string :phone_number
      t.string :pay_type
      t.text :notification_params
      t.string :status
      t.string :transaction_id
      t.datetime :purchased_at
      t.timestamps
    end
  end
end
