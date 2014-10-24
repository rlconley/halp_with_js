class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.references :user, index: true
      t.references :problem, index: true
      t.text :text

      t.timestamps
    end
  end
end
