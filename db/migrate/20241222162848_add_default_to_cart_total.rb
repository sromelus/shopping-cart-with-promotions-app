class AddDefaultToCartTotal < ActiveRecord::Migration[7.2]
  def change
    change_column_default :carts, :total, from: nil, to: 0
  end
end
