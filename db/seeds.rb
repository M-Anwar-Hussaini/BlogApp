users = ['Reza Merzaie', 'Ali Baba Hussaini']
photos = ['https://avatars.githubusercontent.com/u/76435157?v=4', 'https://avatars.githubusercontent.com/u/126192888?v=4']
bio = [
  "A software developer is an architect of the digital world, crafting intricate codes that bring ideas to life within the realm of technology. They are the creative minds behind the applications, systems, and platforms that power our modern lives. With a combination of technical prowess, problem-solving skills, and boundless imagination, these developers meticulously design, code, and test software to ensure it functions seamlessly. Their world revolves around deciphering complex problems and translating them into elegant, efficient solutions, often working in teams to create innovative, user-friendly products that push the boundaries of what's possible in the digital landscape.",
  "A graphic designer is a visual storyteller, weaving narratives through the language of design and imagery. They're the magicians who turn ideas and concepts into captivating visual representations. With a blend of artistic flair, technical skill, and an innate understanding of aesthetics, they craft everything from logos and advertisements to entire brand identities. Armed with software proficiency and a keen eye for detail, graphic designers shape the way we perceive information, influencing our emotions and actions through their creations. Their canvas is vast, encompassing a multitude of mediums, and their work is often the bridge between ideas and their vivid, compelling manifestation in the world."
]

2.times do |index|
  User.create(name: users[index], photo: photos[index], bio: bio[index])
end