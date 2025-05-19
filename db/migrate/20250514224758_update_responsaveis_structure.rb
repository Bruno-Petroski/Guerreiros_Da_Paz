class UpdateResponsaveisStructure < ActiveRecord::Migration[8.0]
  def change
    # Remover coluna desnecessária
    remove_column :responsaveis, :endereco, :string
  end
end
