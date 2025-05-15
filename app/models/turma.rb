class Turma < ApplicationRecord
  belongs_to :professor
  has_many :matriculas, dependent: :destroy
  has_many :alunos, through: :matriculas
  has_many :aulas, dependent: :destroy

  def horario_formatado
    return horario if horario.blank?
    
    # Se o horário já estiver no formato "HH:MM", retorna como está
    return horario if horario.match?(/^\d{2}:\d{2}$/)
    
    # Se o horário estiver em outro formato, tenta converter
    begin
      Time.parse(horario).strftime("%H:%M")
    rescue
      horario
    end
  end
end
