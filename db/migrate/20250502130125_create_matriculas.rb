class CreateMatriculas < ActiveRecord::Migration[8.0]
  def change
    create_table :matriculas do |t|
      t.references :aluno, null: false, foreign_key: true
      t.references :turma, null: false, foreign_key: true
      t.date :data_matricula

      t.timestamps
    end
  end
end
