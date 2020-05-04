class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :description
      t.belongs_to :tenant
      t.belongs_to :property
      t.timestamps
    end
  end
end
