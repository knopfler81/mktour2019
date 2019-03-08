class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :concert

	validates :content, presence: true
end
