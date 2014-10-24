class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.references :user, index: true
      t.text :description
      t.text :tried
      t.boolean :resolved, default: false

      t.timestamps
    end
  end
end
