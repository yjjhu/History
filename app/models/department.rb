class Department < ApplicationRecord
    has_many :events, through: :event_departments
    has_many :event_departments, :dependent => :destroy
end
