class Country < ActiveRecord::Base

  default_scope order: :name

end