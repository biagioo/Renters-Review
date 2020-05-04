class CreateTenants < ActiveRecord::Migration[6.0]
  def change
    create_table :tenants do |t|
      t.string :name
      t.text :description
      t.integer :years_renting 
      
      t.timestamps
    end
  end
end
