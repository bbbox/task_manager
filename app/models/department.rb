class Department < ActiveRecord::Base
  default_scope order: :name

  has_many :users
  belongs_to :chief, class_name: "User", foreign_key: :user_id

  validates :name, presence: true
  validates :chief, presence: true
end
