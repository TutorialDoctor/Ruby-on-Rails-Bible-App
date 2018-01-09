class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :body
      t.time :time

      t.timestamps
    end
  end
end
