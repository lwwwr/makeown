# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# user = User.create(email: 'errorlwwwr@gmail.com', password: '17501750')
# user.save!
# user.confirm

# 10.times do
#   categories = Category.create(name: Faker::Commerce.department)
# end

# 10.times do
#   users = User.create(email: Faker::Internet.email, password: '17501750')
#   users.save!
#   users.confirm
# end

# 10.times do
#   users = User.limit(5).order("RANDOM()")
#   users.each do |user|
#     2.times do
#       user.user_categories.build(category_id: Category.limit(1).order("RANDOM()").first.id).save
#     end
#   end
# end

User.all.each do |user|
  user.build_user_info(fio: Faker::Ancient.god, about: Faker::Ancient.hero, education: Faker::Educator.university, skills: Faker::Nation.nationality, experience: Faker::Address.country, city: Faker::Address.city).save
end

# 5.times do
#   user = User.limit(1).order("RANDOM()").first
#   orders = Order.create(user_id: user.id, desc: Faker::ChuckNorris.fact,
#                         address: Faker::Address.street_address, end_data: Faker::Date.forward(23)).save
# end

# 5.times do
#   order = Order.limit(1).order("RANDOM()").first
#   5.times do
#     user = User.limit(1).order("RANDOM()").first
#     whosigned = SignedToOrder.create(order_id: order.id, signed_id: user.id, price: Faker::Number.number(4)).save
#   end
# end


# CHECK THIS PEACE OF CODE FOR AVAILABILITY
# Order.all.each do |order|
#   order.build_order_category(category_id: Category.limit(1).order("RANDOM()").first.id).save
# end

2.times do
  order = Order.limit(1).order("RANDOM()").first
  signed = order.signed_to_orders.limit(1).order("RANDOM()").first
  signed.update_attribute(:accepted, true)
  order.update_attribute(:who, signed.signed_id)
  order.build_order_conclusion(positive: true, negative: false, comment: Faker::Fallout.quote,
  rate_price: Faker::Number.between(1, 5), rate_quality: Faker::Number.between(1, 5),
                               rate_civility: Faker::Number.between(1, 5)).save

end
