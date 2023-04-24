#Destroying all
User.destroy_all

#Creating 4 users

user_admin = User.new(username:"admin", name:"Admin", password:"supersecret", email:"admin@mail.com", role: 1)
user_admin.avatar.attach(io: File.open("app/assets/images/avatar.jpg"), filename: "avatar_admin.jpg")
unless user_admin.save
  puts user_admin.errors.full_messages
end

user1 = User.new(username:"tanus", name:"The Great Tanus", password:"123456", email:"user1@mail.com")
user1.avatar.attach(io: File.open("app/assets/images/avatar.jpg"), filename: "avatar1.jpg")
unless user1.save
  puts user1.errors.full_messages
end


user2 = User.new(username:"goku2020", name:"Son Goku", password:"123456", email:"user2@mail.com")
user2.avatar.attach(io: File.open("app/assets/images/avatar(1).jpg"), filename: "avatar2.jpg")
unless user2.save
  puts user2.errors.full_messages
end

user3 = User.new(username:"dogfire", name:"House on Fire", password:"123456", email:"user3@mail.com")
user3.avatar.attach(io: File.open("app/assets/images/avatar(2).jpg"), filename: "avatar3.jpg")
unless user3.save
  puts user3.errors.full_messages
end

user4 = User.new(username:"drRealNeil", name:"The Real Neil", password:"123456", email:"user4@mail.com")
user4.avatar.attach(io: File.open("app/assets/images/avatar(3).jpg"), filename: "avatar4.jpg")
unless user4.save
  puts user4.errors.full_messages
end
#Creating tweets

tweet1 = user1.tweets.create(body:"This universe is finite, its resources, finite… if life is left unchecked, life will cease to exist.")

tweet2 = user2.tweets.create(body: "Even a low class warrior can surpass an elite. With enough hard work.")

tweet3 = user3.tweets.create(body: "This is fine, everything is fine.")

tweet4 = user4.tweets.create(body: "For me, I am driven by two main philosophies: know more today about the world than I knew yesterday and lessen the suffering of others.")

reply1 = tweet1.replies.new(body: "I would rather be a brainless monkey than a heartless monster.")
reply1.user = user2
unless reply1.save
  puts reply1.errors.full_messages
end

reply2 = tweet1.replies.new(body: "When you want to respond and don't know how.")
reply2.user = user3
unless reply2.save
  puts reply2.errors.full_messages
end

reply3 = tweet1.replies.new(body: "Let’s sit and talk about it.")
reply3.user = user4
unless reply3.save
  puts reply3.errors.full_messages
end

#Creating likes

tweet1.likes.create(user_id: user2.id)
tweet1.likes.create(user_id: user3.id)
tweet1.likes.create(user_id: user4.id)

tweet2.likes.create(user_id: user3.id)
tweet2.likes.create(user_id: user4.id)

tweet3.likes.create(user_id: user1.id)

