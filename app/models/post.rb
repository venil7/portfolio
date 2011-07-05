class Post < ActiveRecord::Base
  validates :title, :presence => true
  validates :author, :presence => true
  validates :category, :presence => true
  validates :text, :presence => true
end
