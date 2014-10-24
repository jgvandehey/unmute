class Comment < ActiveRecord::Base
	attr_accessible :content
	belongs_to :commentable, polymorphic: true
	validates :content, presence: true
end
