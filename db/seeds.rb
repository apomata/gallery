# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

projecs_list = [
['Ink Drawings', 'These are ink drawings that depect several different themes.
	It takes several days to complete each one and they are crafted with the utmost care.
	They are compesed in black ink with a ballpoint pen on thick paper. The extra thickness
	of the paper ensures that the drawings dont bleed', ],
['Sketches',' These sketches embody some of my best work. I hope you enjoy them.'],
['Gallery Website','This is a project I have been working on for the last several months.
	The goal is to provide students with a way to compile portfolios. It should aslo help
	record student projects for instructors and provide an easy way to look up old projects for other students.
	It is composed using ruby on rails as a base and bootstrap for user interfaces.
	The user interfaces were designed through rigerous testing, having several paper prototypes
	and being put through several rounds of user testing.'],
['Knitting','Here are some fun things I knitted'],
]

profiles_list = [
['Athur', 'Dent', 'I am a student at Brandeis. I graduate in 2014 and hope to be working shortly there after.
 I am a computer science major with a classics minor, but I also love art. All of these have influenced my work
 and I think it forms interresting combinations of ideas.', 'fake@fake.com'],
['Remington', 'Steele', 'I am a down to earch student who just likes to make stuff for fun. Hope you enjoy my work.', 'fake2@fake.com'],
['James', 'Bond', 'International man of mystery. My work is best not spoken of, but I enjoy a life of excitement and adventure', 'jbond007@fake.com'],
['Ford','Prefect', 'I am probably best known for my works on the hitchikers guide to the galaxy.
 	Perhapse you have read my entry on earth, "mostly harmless". I have travled the lengths of the galaxy
 	with only my towel, wits, and guide. Here is some of the wonderous things I have found. (note avoid the Vogon poetry)',]
]

pictures = [
['C:\Users\login_000\Documents\GitHub\gallery\public\system\projects\seedpictures\ink\_217_morning_bird_by_365_daysofdoodles-d7vxnkn.jpg',
	'C:\Users\login_000\Documents\GitHub\gallery\public\system\projects\seedpictures\ink\_239_owl_city_by_365_daysofdoodles-d7zr542.jpg',
	'C:\Users\login_000\Documents\GitHub\gallery\public\system\projects\seedpictures\ink\_255_salem_by_365_daysofdoodles-d82czhn.jpg',
	'C:\Users\login_000\Documents\GitHub\gallery\public\system\projects\seedpictures\ink\inktober_day_16___iron_giant_by_dereklaufman-d83iy1x.jpg' ],
['C:\Users\login_000\Documents\GitHub\gallery\public\system\projects\seedpictures\sketch\0a68b2e77c3da1c8e4488e73570e5b2e-d5j7td5.jpg',
	'C:\Users\login_000\Documents\GitHub\gallery\public\system\projects\seedpictures\sketch\druid_by_thiago_almeida-d6fmjuu.jpg'],
['C:\Users\login_000\Documents\GitHub\gallery\public\system\projects\seedpictures\website\deadlink.png'],
['C:\Users\login_000\Documents\GitHub\gallery\public\system\projects\seedpictures\knitting\owlbears.jpg']
]

temp_profiles = []

profiles_list.each do |firstname, lastname, bio, email|
	profile = Profile.create(first_name: firstname, last_name: lastname, bio: bio, email: email)
	profiles << profile
end

counter = 0
projecs_list.each do |title, description|

	project = Project.create(title: title, description: description)
	project.profiles << temp_profiles[counter]
	project.profiles << temp_profiles[(counter+1)%temp_profiles.length]

	pictures[counter].each |pic_path|
		projectpicture = Projectpicture.new
		file = File.open(pic_path)
		projectpicture.attachment = file
		file.close
		projectpicture.save!
		project.projectpictures << projectpicture
	end

	counter += 1

end


