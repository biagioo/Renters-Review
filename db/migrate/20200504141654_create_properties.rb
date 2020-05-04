class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :name
      t.text :description
      t.string :street
      t.string :city
      t.string :state
      t.integer :zipcode
      t.belongs_to :landlord
      
      t.timestamps
    end
  end
end
