class CreateNumericInputs < ActiveRecord::Migration[6.0]
  def change
    create_table :numeric_inputs do |t|
      t.integer :number_set, null: false
      t.float :min, null: true
      t.float :max, null: true
      t.float :excluded_values, array: true, default: '{}'
      t.timestamps
    end
  end
end
