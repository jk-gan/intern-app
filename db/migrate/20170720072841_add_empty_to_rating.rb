class AddEmptyToRating < ActiveRecord::Migration[5.1]
  def change
    add_column :ratings, :empty, :boolean, default: true
  end
end
