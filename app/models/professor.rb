class Professor < ApplicationRecord
    has_many :turmas, dependent: :nullify
  end
  