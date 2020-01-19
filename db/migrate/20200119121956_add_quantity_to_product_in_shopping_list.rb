class AddQuantityToProductInShoppingList < ActiveRecord::Migration[5.2]
  def change
    add_column :product_in_shopping_lists, :quantity, :integer
  end
end
