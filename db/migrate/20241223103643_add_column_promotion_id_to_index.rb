class AddColumnPromotionIdToIndex < ActiveRecord::Migration[7.2]
  def change
    add_reference :items, :promotion, foreign_key: true
  end
end
