class Concert < ApplicationRecord
 	has_and_belongs_to_many :users
	has_many :comments, dependent: :destroy


	validates :city, presence: true
  validates :venue, presence: true
 	validates :kountry, presence: true

	validates :show_date, presence: true, uniqueness: true
end
