class Facility < ActiveRecord::Base
  belongs_to :plant
  validates :name, presence: true
end
