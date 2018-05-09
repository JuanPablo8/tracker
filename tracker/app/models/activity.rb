class Activity < ApplicationRecord

  has_many :comments

  #length validation for title and duration of a new activity
  validates :title, presence: true,
            length: { minimum: 2, maximum: 30 }

  validates :duration, presence: true,
            length: { minimum: 1, maximum: 4 }

end
