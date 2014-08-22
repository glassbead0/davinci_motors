class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.date :date_of_birth
      t.string :eye_color
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :hair_color
      t.string :height
      t.string :sex
      t.string :weight

      t.timestamps
    end
  end
end
