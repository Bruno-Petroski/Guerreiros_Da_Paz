class CreateProfessors < ActiveRecord::Migration[8.0]
  def change
    create_table :professors do |t|
      t.string :nome
      t.string :email
      t.string :telefone
      t.string :especialidade

      t.timestamps
    end
  end
end
