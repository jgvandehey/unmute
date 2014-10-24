class User < ActiveRecord::Base
	attr_accessible :name, :provider, :uid, :email
	has_many :posts, :dependent => :destroy
	has_many :evaluations, class_name: "RSEvaluation", as: :source
	
	has_reputation :votes, source: {reputation: :votes, of: :posts}, aggregated_by: :sum

	def voted_for?(post)
		evaluations.exists?(target_type: post.class, target_id: post.id)
	end 

	def self.from_omniauth(auth)
		where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
	end
	
	def self.create_from_omniauth(auth)
		create! do |user|
			user.provider = auth["provider"]
			user.uid = auth["uid"]
			user.name = auth["info"]["nickname"]
			user.followers_twitter = auth["extra"]["raw_info"]["followers_count"]
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
