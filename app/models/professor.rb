class Professor < ApplicationRecord
    has_many :turmas, dependent: :nullify

    validates :nome, presence: true
    validates :cpf, presence: true, uniqueness: true, length: { is: 11 }, numericality: { only_integer: true }
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :telefone, presence: true, length: { in: 10..11 }, numericality: { only_integer: true }

    before_validation :clean_cpf_and_telefone

    private

    def clean_cpf_and_telefone
        self.cpf = cpf.to_s.gsub(/\D/, '') if cpf.present?
        self.telefone = telefone.to_s.gsub(/\D/, '') if telefone.present?
    end
end
  