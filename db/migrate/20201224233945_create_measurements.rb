class CreateMeasurements < ActiveRecord::Migration[6.0]
  def change
    create_table :measurements do |t|
      t.float :height
      t.float :weight
      t.float :bmi
      t.references :program, null: false, foreign_key: true

      t.timestamps
    end
  end
end
