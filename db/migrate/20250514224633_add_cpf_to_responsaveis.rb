class AddCpfToResponsaveis < ActiveRecord::Migration[8.0]
  def change
    add_column :responsaveis, :cpf, :string
  end
end
