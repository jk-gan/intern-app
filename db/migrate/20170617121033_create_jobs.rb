class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.references :company, foreign_key: true
      t.string :name
      t.text :description
      t.float :working_hours
      t.string :dress_code

      t.timestamps
    end
  end
end
