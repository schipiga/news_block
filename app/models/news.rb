class News < ActiveRecord::Base
  belongs_to :user

  attr_accessible :content, :title

  has_reputation :votes, source: :user, aggregated_by: :sum

  scope :by_date, order('created_at DESC')
end
