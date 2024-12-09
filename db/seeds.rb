5.times do
  user = User.create(email: Faker::Internet.email, password: "password")
  post = user.posts.create(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph)

  3.times do
    post.comments.create(content: Faker::Lorem.sentence, user: [ user, nil ].sample)
    post.reactions.create(user: user, reaction_type: [ :like, :dislike ].sample)
  end
end
