class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.references :company, foreign_key: true
      t.string :name
      t.string :role
      t.string :contact_number
      t.string :email

      t.timestamps
    end
  end
end
