class AddProductCategoryIdToProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :ProductCategory., :product_category_id, null: false, foreign_key: true , type: :uuid
  end
end
