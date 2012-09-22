class Post < ActiveRecord::Base
  attr_accessible :body, :title, :user_id
  has_many :comments
  belongs_to :user
end
