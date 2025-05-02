class Turma < ApplicationRecord
  belongs_to :professor
  has_many :matriculas, dependent: :destroy
  has_many :alunos, through: :matriculas
  has_many :aulas, dependent: :destroy
end
