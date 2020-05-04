class CreateLandlords < ActiveRecord::Migration[6.0]
  def change
    create_table :landlords do |t|
      t.string :name
      t.text :description
      t.integer :years_leasing
      
      t.timestamps
    end
  end
end
