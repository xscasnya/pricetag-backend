class AddUniqueIndexToProductInShops < ActiveRecord::Migration[5.2]
  def change
    add_index :product_in_shops, [:product_id, :shop_id], unique: true
  end
end
