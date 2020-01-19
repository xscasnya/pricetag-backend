# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(email: "firstuser@test.com",
                    password: "test1234",
                    password_confirmation: "test1234")

shop1 = Shop.create!(name: "LIDL",
                    address: "Rue de France n. 26",
                    user_id: user.id)

shop2 = Shop.create!(name: "CONAD",
                    address: "Rue d' Italie n. 2",
                    user_id: user.id)

shop3 = Shop.create!(name: "Carrefour City",
                    address: "Rue de France n. 33",
                    user_id: user.id)

shop4 = Shop.create!(name: "Carrefour Market",
                    address: "Rue d' Italie n. 23",
                    user_id: user.id)

shop5 = Shop.create!(name: "Monoprix",
                    address: "Rue de Champs n. 45",
                    user_id: user.id)

product1 = Product.create!(name: "eggs packet of 4",
                    user_id: user.id)

product2 = Product.create!(name: "spaghetti 400 g",
                    user_id: user.id)

product3 = Product.create!(name: "milk 1l",
                    user_id: user.id)

product4 = Product.create!(name: "pork 400 g",
                    user_id: user.id)

product5 = Product.create!(name: "flour 500 g",
                    user_id: user.id)

5.times do |p|
    5.times do |s|
        if p+1 == 1
            ProductInShop.create!(price: 1.22 + rand(200)/100.0,
                    shop_id: s+1,
                    product_id: p+1)
        elsif p+1 == 2
            ProductInShop.create!(price: 0.66 + rand(200)/100.0,
                    shop_id: s+1,
                    product_id: p+1)
        elsif p+1 == 3
            ProductInShop.create!(price: 2.06 + rand(200)/100.0,
                    shop_id: s+1,
                    product_id: p+1)
        elsif p+1 == 4
            ProductInShop.create!(price: 3.37 + rand(200)/100.0,
                    shop_id: s+1,
                    product_id: p+1)
        elsif p+1 == 5
            ProductInShop.create!(price: 1.57 + rand(200)/100.0,
                    shop_id: s+1,
                    product_id: p+1)
        end
    end
end
