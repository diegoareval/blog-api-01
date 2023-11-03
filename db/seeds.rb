BlogPost.destroy_all
User.destroy_all
Categorization.destroy_all
Category.destroy_all

categories = ['Technology', 'Travel', 'Food', 'Fashion', 'Lifestyle']

categories.each do |category|
  Category.create(name: category)
end

puts "Created #{Category.count} categories"

user1 = User.create!(email: "diego2000avelar@gmail.com", password: "123456", password_confirmation: "123456")
user2 = User.create!(email: "user2@user.com", password: "password", password_confirmation: "password")

categories = Category.all
BlogPost.create(
    title: 'Sample post',
    summary: 'This is a sample seed post',
    body: 'Lorem ipsum dolor amet sit...',
    tags: ['sample', 'post'],
    user: user1,
    categories: categories.sample(rand(1..3))
)

puts "Created User: #{user1.email}"
puts "Created User: #{user2.email}"
puts "Created #{BlogPost.count} blog posts with categories"

