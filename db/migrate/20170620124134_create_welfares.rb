class CreateWelfares < ActiveRecord::Migration[5.1]
  def change
    create_table :welfares do |t|
      t.references :job, foreign_key: true
      t.boolean :training
      t.text :training_detail
      t.boolean :accomodation
      t.boolean :free_food
      t.text :free_food_detail
      t.text :other_benefits
      t.decimal :allowance, precision: 8, scale: 2

      t.timestamps
    end
  end
end
