class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :university
      t.string :course
      t.string :phone
      t.references :user, foreign_key: true
      t.integer :gender, default: 0

      t.timestamps
    end
  end
end
