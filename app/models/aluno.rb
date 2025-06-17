class Aluno < ApplicationRecord
  belongs_to :responsavel
  has_many :matriculas, dependent: :destroy
  has_many :turmas, through: :matriculas

  validates :nome, presence: true
  validates :cpf, presence: true, length: { is: 11 }, numericality: { only_integer: true }
  validates :data_nascimento, presence: true
  validates :tipo_sanguineo, presence: true
  validates :modalidade_luta, presence: true

  before_validation :clean_cpf

  private

  def clean_cpf
    self.cpf = cpf.to_s.gsub(/\D/, '') if cpf.present?
  end
end
