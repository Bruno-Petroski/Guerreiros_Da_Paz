class AddCpfToProfessors < ActiveRecord::Migration[8.0]
  def change
    add_column :professors, :cpf, :string
  end
end
