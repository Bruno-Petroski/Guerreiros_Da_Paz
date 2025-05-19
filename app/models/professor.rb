class Professor < ApplicationRecord
    has_many :turmas, dependent: :nullify

    validates :nome, presence: true
    validates :cpf, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :telefone, presence: true
  end
  