class Activity < ApplicationRecord

  has_many :comments
  validates :title, presence: true,
            length: { minimum: 2, maximum: 30 }

  validates :duration, presence: true,
            length: { minimum: 1, maximum: 4 }

end
