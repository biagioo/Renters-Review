class CreateTenants < ActiveRecord::Migration[6.0]
  def change
    create_table :tenants do |t|
      t.string :name
      t.integer :age
      t.text :about
      
      t.timestamps
    end
  end
end
