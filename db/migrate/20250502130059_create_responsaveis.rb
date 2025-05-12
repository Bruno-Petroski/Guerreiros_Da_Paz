class CreateResponsaveis < ActiveRecord::Migration[8.0]
  def change
    create_table :responsaveis do |t|
      t.string :nome
      t.string :telefone
      t.string :endereco

      t.timestamps
    end
  end
end
