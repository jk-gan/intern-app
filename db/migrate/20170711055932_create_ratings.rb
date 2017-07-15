class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.references :user, foreign_key: true
      t.references :company, foreign_key: true
      t.float :culture_score, default: 0
      t.float :environment_score, default: 0
      t.float :cleanliness_score, default: 0
      t.float :location_score, default: 0
      t.float :learning_score, default: 0
      t.float :management_score, default: 0
      t.boolean :new_culture_score, default: true
      t.boolean :new_environment_score, default: true
      t.boolean :new_cleanliness_score, default: true
      t.boolean :new_location_score, default: true
      t.boolean :new_learning_score, default: true
      t.boolean :new_management_score, default: true

      t.timestamps
    end
  end
end
