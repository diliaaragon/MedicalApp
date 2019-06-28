class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :identification
      t.string :gender
      t.date :birthdate
      t.string :blood_type_rh

      t.timestamps
    end
  end
end
