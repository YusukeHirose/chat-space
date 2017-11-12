class Group < ApplicationRecord
  has_many :users, through: :members, source: :users
  has_many :messages
  has_many :members
end
