class Event < ApplicationRecord
  belongs_to :category
  has_many :departments, through: :event_departments
  has_many :event_departments, :dependent => :destroy

end
