class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :groups, through: :members
  has_many :members, dependent: :destroy
  has_many :messages

  scope :search_name, -> (keyword) { where('name LIKE(?)', "%#{keyword}%").limit(20) }
  scope :exclude_currentUser, -> (current_user) { where.not(id: current_user.id) }

end
