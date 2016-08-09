class CreateClarifaiPhotos < ActiveRecord::Migration
  def change
    create_table :clarifai_photos do |t|

      t.timestamps null: false
    end
  end
end
