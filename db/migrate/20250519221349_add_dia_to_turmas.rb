class AddDiaToTurmas < ActiveRecord::Migration[8.0]
  def change
    add_column :turmas, :dia, :date
  end
end
