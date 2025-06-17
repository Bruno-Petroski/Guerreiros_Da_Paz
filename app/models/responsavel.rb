class Responsavel < ApplicationRecord
  self.table_name = 'responsaveis'
  
  has_many :alunos, dependent: :destroy

  validates :nome, presence: true
  validates :cpf, presence: true, length: { is: 11 }, numericality: { only_integer: true }
  validates :telefone, presence: true, length: { in: 10..11 }, numericality: { only_integer: true }

  before_validation :clean_cpf_and_telefone

  private

  def clean_cpf_and_telefone
    self.cpf = cpf.to_s.gsub(/\D/, '') if cpf.present?
    self.telefone = telefone.to_s.gsub(/\D/, '') if telefone.present?
  end
end
  