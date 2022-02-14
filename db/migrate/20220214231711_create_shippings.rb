class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
      t.belongs_to :order, index:true
      t.string :status, default: ''
      t.timestamps null: false
    end
  end
end
