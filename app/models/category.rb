class Category < ActiveRecord::Base
	attr_accessible :name, :color
	has_many :categorizations
	has_many :posts, :through => :categorizations
end
