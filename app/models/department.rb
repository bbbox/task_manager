class Department < ActiveRecord::Base
  default_scope order: :name

  has_many :users, inverse_of: :department

  validates :name, presence: true
  validates :department_head, presence: true
end
