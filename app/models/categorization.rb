class Categorization < ActiveRecord::Base
  attr_accessible :category_id, :created_at, :position, :post_id
  belongs_to :post
  belongs_to :category
end
