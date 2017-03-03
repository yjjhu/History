class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.date :date_begin
      t.date :date_end
      t.text :content
      t.boolean :great
      t.boolean :privacy
      t.integer :category_id

      t.timestamps
    end
  end
end
