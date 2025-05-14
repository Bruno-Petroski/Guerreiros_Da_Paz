class Responsavel < ApplicationRecord
  self.table_name = 'responsaveis'
  
  has_many :alunos, dependent: :destroy
end
  