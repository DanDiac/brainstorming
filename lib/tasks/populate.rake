namespace :db do
  desc "Create 31 users with random names and emails"
  task :populate => :environment do
		require 'populator'
		require 'faker'
	  User.populate 31 do |user|
			user.name = Faker::Name.name
			user.email = Faker::Internet.email
			password = ('a'..'z').to_a.shuffle[0,10].join
			user.encrypted_password = User.new(:password => password).encrypted_password
			user.sign_in_count = 1
		end
  end
end