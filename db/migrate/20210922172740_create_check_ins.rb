class CreateCheckIns < ActiveRecord::Migration[6.1]
  def change
    create_table :check_ins do |t|
      t.string :name
      t.integer :role_happiness
      t.integer :company_happiness
      t.text :comment
      t.timestamps
    end
  end
end
