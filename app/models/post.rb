class Post < ActiveRecord::Base
	attr_accessible :body, :title, :user_id, :publish, :category, :image, :feature, :category_ids

	validates :title, presence: true
	belongs_to :user
	validates :user_id, presence: true
	has_attached_file :image, :styles => { :medium => "300x300#", :thumb => "100x100#" }, :default_url => "https://s3.amazonaws.com/unmute/icon_400.png"  
	has_many :categorizations
	has_many :categories, :through => :categorizations
	has_many :evaluations, class_name: "RSEvaluation", as: :source
	has_reputation :votes, source: :user, aggregated_by: :sum
	has_many :comments, as: :commentable
end
