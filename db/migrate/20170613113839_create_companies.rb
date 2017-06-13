class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.text :description
      t.integer :size
      t.text :website
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
