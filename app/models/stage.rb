class Stage < ActiveRecord::Base

  default_scope order: :name

  has_many :tasks

  validates :name, presence: true
end
