class Group < ApplicationRecord
  # has_many :users, through: :members
  has_many :users, through: :members
  has_many :members, dependent: :destroy
  has_many :messages


  # name属性に値がない場合にエラー
  validates :name, presence: true
end
