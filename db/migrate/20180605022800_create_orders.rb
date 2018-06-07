class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :name
      t.text :address
      t.string :email
      t.string :phone_number
      t.text :notification_params
      t.string :status, default: "Waiting"
      t.string :transaction_id
      t.datetime :purchased_at
      t.timestamps
    end
  end
end
