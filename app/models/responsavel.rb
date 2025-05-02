class Responsavel < ApplicationRecord
    has_many :alunos, dependent: :destroy
  end
  