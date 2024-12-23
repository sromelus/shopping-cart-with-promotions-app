class CreateCarts < ActiveRecord::Migration[7.2]
  def change
    create_table :carts do |t|
      t.decimal :total
      t.references :user, index: { unique: true }, null: false, foreign_key: true

      t.timestamps
    end
  end
end
