class Department < ActiveRecord::Base
  has_many :users
  belongs_to :chief, class_name: "User", foreign_key: :user_id

  validates :name, presence: true
end
