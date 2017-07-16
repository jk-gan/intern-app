class CreateScopings < ActiveRecord::Migration[5.1]
  def change
    create_table :scopings do |t|
      t.references :job, foreign_key: true
      t.references :scope, foreign_key: true

      t.timestamps
    end
  end
end
