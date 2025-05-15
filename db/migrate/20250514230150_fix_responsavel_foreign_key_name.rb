class FixResponsavelForeignKeyName < ActiveRecord::Migration[8.0]
  def change
    rename_column :alunos, :responsaveis_id, :responsavel_id
  end
end
