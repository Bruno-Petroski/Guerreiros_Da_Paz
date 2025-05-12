class CreateAulas < ActiveRecord::Migration[8.0]
  def change
    create_table :aulas do |t|
      t.references :turma, null: false, foreign_key: true
      t.date :data
      t.time :horario_inicio
      t.time :horario_fim
      t.text :conteudo

      t.timestamps
    end
  end
end
