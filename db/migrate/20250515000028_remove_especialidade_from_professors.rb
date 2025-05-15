class RemoveEspecialidadeFromProfessors < ActiveRecord::Migration[8.0]
  def change
    remove_column :professors, :especialidade, :string
  end
end
