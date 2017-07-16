class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.references :company, foreign_key: true
      t.text :street_address
      t.string :city
      t.string :state
      t.string :country
      t.string :postcode

      t.timestamps
    end
  end
end
