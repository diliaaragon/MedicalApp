class CreateDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :last_name
      t.string :identification
      t.string :professional_card
      t.date :birthdate
      t.string :specialty

      t.timestamps
    end
  end
end
