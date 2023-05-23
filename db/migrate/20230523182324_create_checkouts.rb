class CreateCheckouts < ActiveRecord::Migration[7.0]
  def change
    create_table :checkouts do |t|
      t.string :full_name
      t.string :email
      t.string :phone_number
      t.string :province
      t.string :city
      t.string :address
      t.string :payment_method

      t.timestamps
    end
  end
end
