class Plant < ActiveRecord::Base
  has_many :facilities
  belongs_to :country
  validates :name, presence: true
end
