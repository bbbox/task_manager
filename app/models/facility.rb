class Facility < ActiveRecord::Base
  default_scope order: :name

  belongs_to :plant

  validates :name, presence: true
  validates :plant, presence: true
end
