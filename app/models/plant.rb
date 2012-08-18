class Plant < ActiveRecord::Base
  default_scope order: :name

  has_many :facilities
  belongs_to :country
  validates :name, presence: true
end
