class Event < ApplicationRecord
  belongs_to :category
  has_many :departments, through: :event_departments
  has_many :event_departments, :dependent => :destroy
  by_star_field :date_begin
  def self.search(search)
    if search
      Event.by_year(search)

    else
      self.all
    end
  end
end
