class CreateYachts < ActiveRecord::Migration
  def change
    create_table :yachts do |t|
      t.string :name
      t.string :length_m
      t.string :length_f
      t.string :manufacture_year
      t.string :country
      t.string :builder
      t.text :description
      t.string :picture

      t.timestamps
    end
  end
end
