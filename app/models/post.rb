class Post < ActiveRecord::Base
	attr_accessible :body, :title, :user_id, :publish, :category, :image

	validates :title, presence: true
	belongs_to :user
	validates :user_id, presence: true
	has_attached_file :image, :styles => { :medium => "300x300#", :thumb => "100x100#" }, :default_url => "https://s3-us-west-2.amazonaws.com/unmute/icon_400.png"  
end