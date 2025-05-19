class AddDiaSemanaAndHorarioInicioFimToTurmas < ActiveRecord::Migration[8.0]
  def change
    add_column :turmas, :dia_semana, :string
    add_column :turmas, :horario_inicio, :time
    add_column :turmas, :horario_fim, :time
  end
end