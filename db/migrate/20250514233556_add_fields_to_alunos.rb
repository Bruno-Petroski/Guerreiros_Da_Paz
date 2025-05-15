class AddFieldsToAlunos < ActiveRecord::Migration[8.0]
  def change
    add_column :alunos, :cpf, :string
    add_column :alunos, :tipo_sanguineo, :string
    add_column :alunos, :modalidade_luta, :string

    # Remover campos que não estamos mais usando
    remove_column :alunos, :email, :string
    remove_column :alunos, :telefone, :string
  end
end
