class CreateProductInShoppingLists < ActiveRecord::Migration[5.2]
  def change
    create_table :product_in_shopping_lists do |t|
      t.references :shopping_list, :foreign_key => true
      t.references :product, :foreign_key => true
    end
  end
end
