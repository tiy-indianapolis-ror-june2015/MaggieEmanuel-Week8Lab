# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
4.times do
  customer = Customer.create(email: Faker::Internet.email,
              password: "password",
              password_confirmation: "password")
end

Product.create(photo:"http://dealsinseconds.com/wp-content/uploads/2014/06/111.jpg", name: "Converse Shoes", description: "New pair of girl's converse shoes. Size 7.", price: 80)
Product.create(photo:"http://www.d4products.com/wp-content/uploads/2013/11/sample_item3.png", name: "Nikon Camera", description: "Nikon Digital Camera.  100 Shutter Speed", price: 100)
Product.create(photo:"http://www.georges.com.au/media/catalog/product/p/x/pxc_450_productimage.jpg", name: "Headphones", description: "Bluetooth headphones", price: 200)
Product.create(photo:"http://assets.red.org/product_images/873/iphone6plus-pb-svr_iphone6pluscase_silcn_red-print560.png", name: "Iphone 6 Case", description: "New pink iphone 6 case", price: 20)
Product.create(photo:"http://www.highsnobiety.com/uploads/pics/colette-x-gap-product-2.jpg", name: "Winter Coat", description: "Silver winter coat. Never be cold again.", price: 150)

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Cancelled"
