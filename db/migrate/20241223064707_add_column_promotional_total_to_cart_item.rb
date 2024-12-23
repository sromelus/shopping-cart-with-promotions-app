class AddColumnPromotionalTotalToCartItem < ActiveRecord::Migration[7.2]
  def change
    change_column_default :cart_items, :total, from: nil, to: 0
    change_column_default :cart_items, :quantity, from: nil, to: 0
    add_column :cart_items, :promotional_total, :decimal
  end
end
