class CreateAlunos < ActiveRecord::Migration[8.0]
  def change
    create_table :alunos do |t|
      t.string :nome
      t.date :data_nascimento
      t.string :email
      t.string :telefone
      t.references :responsaveis, null: false, foreign_key: true

      t.timestamps
    end
  end
end
