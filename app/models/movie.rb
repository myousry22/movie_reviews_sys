class Movie < ApplicationRecord
    has_many :reviews, dependent: :delete_all
  
    validates :name, :description, presence: true
  
    def calc_average_rating
      reviews.present? ? reviews.average(:stars) : 0.0
    end
end