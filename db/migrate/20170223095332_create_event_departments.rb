class CreateEventDepartments < ActiveRecord::Migration[5.0]
  def change
    create_table :event_departments do |t|
      t.integer :event_id
      t.integer :department_id

      t.timestamps
    end
  end
end
