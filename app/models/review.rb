class Review < ApplicationRecord

  belongs_to :user

  belongs_to :product

  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user

  validates :rating, presence: true 
  # validates_inclusion_of :rating, :in => 1..5
  # validates :rating, :inclusion => 1..5

  validates :rating, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}

end
