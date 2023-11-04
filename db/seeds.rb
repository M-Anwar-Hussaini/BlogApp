names = %w[Ali Claudia Karim]
photos = %w[https://avatars.githubusercontent.com/u/126192888?v=4 https://avatars.githubusercontent.com/u/97201255?v=4 https://avatars.githubusercontent.com/u/77242944?v=4]
bios = [
  'Frontend Web Developer | JavaScript | React | Redux | Looking for new opportunities',
  "I'm a Full-Stack Software Developer. Passionate about creating innovative solutions and always open to new job opportunities",
  "I’m a Full-Stack Software developer | Active learner | Adventurous. Stack: JavaScript, Ruby, Rails, React, Redux. Looking for job offers..."
]


names.length.times do |i|
  post = Post.new(
    title: "Title of user #{i + 1}",
    text: "Some long text for user #{ i + 1}"
  )

  user = User.new(
    name: names[i],
    photo: photos[i],
    bio: bios[i]
  )
  user.posts << post
  user.save
end

