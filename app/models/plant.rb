class Plant < ActiveRecord::Base
  default_scope order: :short_name

  has_many :facilities
  belongs_to :country

  validates :short_name, presence: true
end
