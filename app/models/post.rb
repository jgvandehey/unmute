class Post < ActiveRecord::Base
	attr_accessible :body, :title, :user_id, :publish

	validates :title, presence: true
	belongs_to :user
	validates :user_id, presence: true
end
