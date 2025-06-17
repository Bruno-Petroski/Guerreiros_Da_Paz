class Turma < ApplicationRecord
  belongs_to :professor
  has_many :matriculas, dependent: :destroy
  has_many :alunos, through: :matriculas
  has_many :aulas, dependent: :destroy

  validates :capacidade, presence: true, numericality: { only_integer: true, greater_than: 0 }

  def horario_formatado
    return horario if horario.blank?
    return horario if horario.match?(/^\d{2}:\d{2}$/)
    
    begin
      Time.parse(horario).strftime("%H:%M")
    rescue
      horario
    end
  end
end
