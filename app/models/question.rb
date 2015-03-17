class Question < ActiveRecord::Base
  belongs_to :keyword
  belongs_to :user
  has_many :answers

end
