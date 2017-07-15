# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all
Category.destroy_all


c1 = Category.create(name: "Tecnologia")
c2 = Category.create(name: "Alimentos")
c3 = Category.create(name: "Muebles")

Product.create(name: "Mouse", price: "100" ,category: c1)
Product.create(name: "Sofa", price: "200",category: c3)

c2.products.build(name: "Arroz", price: "10").save
c1.products.build(name: "Cable", price: "20").save

Product.create(name: "Sillon",price: "500",category: c3)
c2.products.build(name: "Sal", price: "3").save

a = Product.last
a.premium = true
a.save

c = Category.all

c.each do |x|
	x.name.upcase!
	x.save!
end