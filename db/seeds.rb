users = [
	{user_name: 'eAgro', user_email: 'admin@eagro.com.br'},
	{user_name: 'Rodrigo Toledo', user_email: 'rodrigo@rtoledo.inf.br'}
]
users.each do |user|
	user = User.new(name: user[:user_name], email: user[:user_email], password: 'asdqwe123', password_confirmation: 'asdqwe123')
	user.save!

	rand_projects = rand(10..15)
	rand_projects.times do |i|
		project = user.projects.build(title: Faker::Robin.quote)
		project.save!
		todo_lists = rand(5..15)
		todo_lists.times do |j|
			todo_list = project.todo_lists.build(description: Faker::Lorem.paragraph, scheduled_to: Time.now+j.days)
			todo_list.save!
		end
	end
end
