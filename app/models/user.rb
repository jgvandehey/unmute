class User < ActiveRecord::Base
	attr_accessible :name, :provider, :uid, :email
	has_many :posts, :dependent => :destroy

	def self.from_omniauth(auth)
		where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
	end
	
	def self.create_from_omniauth(auth)
		create! do |user|
			user.provider = auth["provider"]
			user.uid = auth["uid"]
			user.name = auth["info"]["nickname"]
			user.email = auth["info"]["email"]
			# user.followers_twitter = auth["info"]["users"]["show"]["followers_count"]
			user.followers_twitter = auth["extra"]["raw_info"]["followers_count"]
			# user.uid = auth["followers_count"]
			# user.followers_twitter = auth.info.followers.followers_count
			# user.followers_twitter = auth['info']['extra']['raw_info']['followers_count']
			# user.followers_twitter = auth['info']['extra']['followers_count']


			# right way to access twitter gem from https://github.com/ahmadassaf/Twitter-Mining/blob/master/app/models/user.rb
			# user.provider = auth["provider"]
			# user.uid = auth["uid"]
			# user.name = auth["info"]["name"]
			# user.screen_name = auth["extra"]["raw_info"]["screen_name"]
			# user.url = auth["info"]["urls"]["Twitter"]
			# user.imageurl = auth["info"]["image"]
			# user.location = auth["info"]["location"]
			# user.followers = auth["extra"]["raw_info"]["followers_count"]
			# user.friends = auth["extra"]["raw_info"]["friends_count"]
			# user.token = auth["credentials"]["token"]
			# user.secret = auth["credentials"]["secret"]
		end
	end
end
