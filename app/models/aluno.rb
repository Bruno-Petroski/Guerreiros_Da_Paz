class Aluno < ApplicationRecord
  belongs_to :responsavel
  has_many :matriculas, dependent: :destroy
  has_many :turmas, through: :matriculas
end
