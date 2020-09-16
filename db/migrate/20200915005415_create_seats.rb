class CreateSeats < ActiveRecord::Migration[6.0]
  def change
    create_table :seats do |t|
      t.string :position
      t.integer :row
      t.integer :column
      t.boolean :available, default: false
      t.boolean :best_seat, default: false
      t.belongs_to :venue

      t.timestamps
    end
  end
end
