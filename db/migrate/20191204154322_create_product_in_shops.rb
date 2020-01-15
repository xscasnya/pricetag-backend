class CreateProductInShops < ActiveRecord::Migration[5.2]
  def change
    create_table :product_in_shops do |t|
      t.float :price
      t.references :shop, :foreign_key => true
      t.references :product, :foreign_key => true
      t.timestamps
    end
  end
end
