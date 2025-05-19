class CreateTurmas < ActiveRecord::Migration[8.0]
  def change
    create_table :turmas do |t|
      t.string :nome
      t.text :descricao
      t.string :modalidade
      t.string :local
      t.string :dia_semana
      t.time :horario_inicio
      t.time :horario_fim
      t.integer :capacidade
      t.references :professor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
