class CreateBoxFormats < ActiveRecord::Migration
  def change
    create_table :box_formats do |t|
      t.name
      t.timestamps null: false
    end
  end
end
