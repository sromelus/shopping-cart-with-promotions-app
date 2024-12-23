class CreatePromotions < ActiveRecord::Migration[7.2]
  def change
    create_table :promotions do |t|
      t.integer :status, null: false, default: 0
      t.string :type, null: false
      t.date :start_date, null: false
      t.date :end_date
      t.integer :quantity
      t.integer :get_quantity
      t.integer :percent_off
      t.integer :category_id
      t.text :description
      t.references :merchant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
