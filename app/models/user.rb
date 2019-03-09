class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	has_and_belongs_to_many :concerts
	has_many :replies
	has_many :comments, through: :concerts

	mount_uploader :avatar, AvatarUploader

	def full_name
	  "#{self.first_name.capitalize } #{self.last_name.capitalize }"
	end
end
