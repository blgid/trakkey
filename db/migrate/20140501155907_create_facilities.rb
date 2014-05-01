class CreateFacilities < ActiveRecord::Migration
  def change
    create_table :facilities do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
