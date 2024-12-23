class CreateItems < ActiveRecord::Migration[7.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :sold_by
      t.integer :unit_weight
      t.decimal :price, null: false
      t.references :merchant, foreign_key: true
      t.references :brand, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
