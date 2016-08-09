class AddCarbColumn < ActiveRecord::Migration
  def change
    add_column :clarifai_photos, :carb, :integer, null: true
  end
end
