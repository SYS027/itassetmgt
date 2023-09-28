class AddProductCategoryIdToProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :product_category, null: false, foreign_key: true , type: :uuid
  end
end
