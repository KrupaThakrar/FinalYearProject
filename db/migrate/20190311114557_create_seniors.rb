class CreateSeniors < ActiveRecord::Migration
  def change
    create_table :seniors do |t|
      t.string :name
      t.string :email

      t.timestamps null: false
    end
  end
end
