class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.text :body
      t.datetime :date

      t.timestamps null: false
    end
  end
end
