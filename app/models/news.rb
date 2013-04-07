class News < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :title
end
