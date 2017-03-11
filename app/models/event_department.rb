class EventDepartment < ApplicationRecord
    belongs_to :event
    belongs_to :department
    by_star_field :date_begin
    def self.search(search)
      if search
        Event.by_year(search)

      else
        self.all
      end
    end
end
