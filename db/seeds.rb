users = User.new(username: 'user1', email: 'user1@test.com', password: 'g$hz8vib')
# users.skip_confirmation!
users.save!

5.times do |number|
  user = User.new(username: "user#{number + 2}", email: "user#{number + 2}@test.com", password: 'g$hz8vib')
  # user.skip_confirmation!
  user.save!
end