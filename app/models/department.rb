class Department < ActiveRecord::Base
  default_scope order: :name

  has_many :users, inverse_of: :department
  belongs_to :chief, class_name: "User", foreign_key: :user_id, inverse_of: :department

  validates :name, presence: true
  validates :chief, presence: true
end
