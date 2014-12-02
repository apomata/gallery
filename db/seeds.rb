# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

projecs_list = [
['Ink Drawings', "These are ink drawings that depect several different themes.
	It takes several days to complete each one and they are crafted with the utmost care.
	They are compsed in black ink with a ballpoint pen on thick paper. The extra thickness
	of the paper ensures that the drawings dont bleed",
	'<iframe width="420" height="315" src="//www.youtube.com/embed/siwpn14IE7E" frameborder="0" allowfullscreen></iframe>',
 ],
['Sketches', "These sketches embody some of my best work. I hope you enjoy them.",
	'<iframe width="420" height="315" src="//www.youtube.com/embed/siwpn14IE7E" frameborder="0" allowfullscreen></iframe>',
],
['Gallery Website',"This is a project I have been working on for the last several months.
	The goal is to provide students with a way to compile portfolios. It should aslo help
	record student projects for instructors and provide an easy way to look up old projects for other students.
	It is composed using ruby on rails as a base and bootstrap for user interfaces.
	The user interfaces were designed through rigerous testing, having several paper prototypes
	and being put through several rounds of user testing."],
['Knitting','Here are some fun things I knitted'],
]

profiles_list = [
['Arthur', 'Dent', "I am a student at Brandeis. I graduate in 2014 and hope to be working shortly there after.
 I am a computer science major with a classics minor, but I also love art. All of these have influenced my work
 and I think it forms interresting combinations of ideas.", 'fake@fake.com', Rails.root.join('public', 'system', 'profiles', 'seedpictures', 'arthur_dent.jpg').to_s],
['Remington', 'Steele', "I am a down to earch student who just likes to make stuff for fun. Hope you enjoy my work.", 'fake2@fake.com', Rails.root.join('public', 'system', 'profiles', 'seedpictures', 'remington_steele.jpg').to_s],
['James', 'Bond', "International man of mystery. My work is best not spoken of, but I enjoy a life of excitement and adventure", 'jbond007@fake.com', Rails.root.join('public', 'system', 'profiles', 'seedpictures', 'james_bond.jpg').to_s],
['Ford','Prefect', "I am probably best known for my works on the hitchikers guide to the galaxy.
 	Perhapse you have read my entry on earth, \"mostly harmless\". I have travled the lengths of the galaxy
 	with only my towel, wits, and guide. Here is some of the wonderous things I have found. (note avoid the Vogon poetry)", 'ford@fake.com', Rails.root.join('public', 'system', 'profiles', 'seedpictures','ford_prefect.jpg').to_s]
]

[
	['Athur', 'Dent', "I am a student at Brandeis. I graduate in 2014 and hope to be working shortly there after.
	 I am a computer science major with a classics minor, but I also love art. All of these have influenced my work
	 and I think it forms interresting combinations of ideas.", 'fake@fake.com',
	 Rails.root.join('public', 'system', 'profiles', 'seedpictures', 'arthur_dent.jpg').to_s],
	['Remington', 'Steele', "I am a down to earch student who just likes to make stuff for fun. Hope you enjoy my work.", 'fake2@fake.com',
		Rails.root.join('public', 'system', 'profiles', 'seedpictures', 'remington_steele.jpg').to_s],
	['James', 'Bond', "International man of mystery. My work is best not spoken of, but I enjoy a life of excitement and adventure", 'jbond007@fake.com',
		Rails.root.join('public', 'system', 'profiles', 'seedpictures', 'james_bond.jpg').to_s],
	['Ford','Prefect', "I am probably best known for my works on the hitchikers guide to the galaxy.
	 	Perhapse you have read my entry on earth, \"mostly harmless\". I have travled the lengths of the galaxy
	 	with only my towel, wits, and guide. Here is some of the wonderous things I have found. (note avoid the Vogon poetry)",
	 Rails.root.join('public', 'system', 'profiles', 'seedpictures','ford_prefect.jpg').to_s]
]

pictures = [
	[
		#['C:\Users\login_000\Documents\GitHub\gallery\public\system\projects\seedpictures\ink\_217_morning_bird_by_365_daysofdoodles-d7vxnkn.jpg', 'description of picture and stuff'],
		[ Rails.root.join( 'public', 'system', 'projects', 'seedpictures', 'ink', '_217_morning_bird_by_365_daysofdoodles-d7vxnkn.jpg').to_s, 'description of picture and stuff'],
		#['C:\Users\login_000\Documents\GitHub\gallery\public\system\projects\seedpictures\ink\_239_owl_city_by_365_daysofdoodles-d7zr542.jpg', 'description of picture and stuff',
		[Rails.root.join('public', 'system', 'projects', 'seedpictures', 'ink', '_239_owl_city_by_365_daysofdoodles-d7zr542.jpg').to_s, 'description of picture and stuff',
			"description of picture and stuff i mean like a really long ass description of this picture like so long you probebly wont even
			want to finish looking at it like holy crap long like why would anyone in there right mind make something this long to describe a
			 picture to which i reply i am no longer in my right mind too much time staring at broken code has finally broken me i mearly write
			 this now to regain some of the sanity for which i have spent on this project with no avail time which i will never be able to retrive
			 time lost on the ever forward march to eternal sleep but thats not the conscern that truly chills the heart its the knowledge that
			 tomorow will be no different and that the futer only holds more time lost on fruitless endevors are you seriously still reading this? have you not
			 better to do? well it is hearting to see another lost soul wasting away in front of meaningless text . . . hello? hello? oh the darkness is closing in
			 	eyes no longer working, despare beyond reconing are you still there? please take my hand i dont want to go alone reader promis me one thing
			 	youll see the sun for me wont you? i wish i could have seen it one last ti............................."],
		#['C:\Users\login_000\Documents\GitHub\gallery\public\system\projects\seedpictures\ink\_255_salem_by_365_daysofdoodles-d82czhn.jpg', 'description of picture and stuff'],
		[Rails.root.join('public', 'system', 'projects', 'seedpictures', 'ink', '_255_salem_by_365_daysofdoodles-d82czhn.jpg').to_s, 'description of picture and stuff'],
		#['C:\Users\login_000\Documents\GitHub\gallery\public\system\projects\seedpictures\ink\inktober_day_16___iron_giant_by_dereklaufman-d83iy1x.jpg',],
		[Rails.root.join('public', 'system', 'projects', 'seedpictures', 'ink', 'inktober_day_16___iron_giant_by_dereklaufman-d83iy1x.jpg').to_s	,],
	],

	[
		[Rails.root.join('public', 'system', 'projects', 'seedpictures', 'sketch', '0a68b2e77c3da1c8e4488e73570e5b2e-d5j7td5.jpg').to_s, ],
		[Rails.root.join('public', 'system', 'projects', 'seedpictures', 'sketch', 'druid_by_thiago_almeida-d6fmjuu.jpg').to_s, 'description of picture and stuff'],
	],

	[
		[Rails.root.join('public', 'system', 'projects', 'seedpictures', 'website', 'deadlink.png').to_s, 'description of picture and stuff'],
	],
	[
		[Rails.root.join('public', 'system', 'projects', 'seedpictures', 'knitting', 'owlbears.jpg').to_s,'description of picture and stuff'],
	],
]

temp_profiles = Array.new

profiles_list.each do |firstname, lastname, bio, email, avatarpath|
	puts avatarpath.nil?
	profile = Profile.create(first_name: firstname, last_name: lastname, bio: bio, email: email, avatar: File.new(avatarpath))
	temp_profiles << profile
end

counter = 0
projecs_list.each do |title, description, embedcode|

	project = Project.create(title: title, description: description, embedcode: embedcode)
	project.profiles << temp_profiles[counter]
	project.profiles << temp_profiles[(counter+1)%temp_profiles.length]

	pictures[counter].each do |projpic|
		puts "#{Rails.root}"
		pic_path = projpic[0]
		description = projpic[1]
		projectpicture = Projectpicture.create({
  			:picture => File.new(pic_path),
  			:description => description,
  			:project => project,
		})
	end

	counter += 1

end



