class Post < ActiveRecord::Base

  has_many :togethers

  self.per_page = 7
end
