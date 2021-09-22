class AddEmotionToCheckIns < ActiveRecord::Migration[6.1]
  def change
    add_column :check_ins, :emotion, :string
  end
end
