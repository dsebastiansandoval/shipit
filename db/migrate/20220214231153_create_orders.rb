class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.text :payment
      t.text :products
      t.text :origin
      t.text :sizes
      t.string :kind
      t.string :reference
      t.text :destiny
      t.string :items
      t.string :courier

      t.timestamps null: false
    end
  end
end
