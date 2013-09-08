namespace :db do
	desc "Fill database with test data"
	task populate: :environment do

		10.times do |n|
			username = "user-#{n+1}"
			email = "fake-#{n+1}@example.com"
			password = 'password'
			User.create!(username: username,
									 email: email,
									 password: password,
									 password_confirmation: password)
		end

		UserGroup.create!(name: 'nfl testers')
	end
end
