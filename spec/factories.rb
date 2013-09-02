FactoryGirl.define do
	factory :user do
		username    "username"
		email       "foo@bar.com"
		password    "password"
		passowrd_confirmation "password"
	end
end