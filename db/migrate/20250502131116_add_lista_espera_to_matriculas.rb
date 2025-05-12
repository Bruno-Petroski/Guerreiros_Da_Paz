class AddListaEsperaToMatriculas < ActiveRecord::Migration[8.0]
  def change
    add_column :matriculas, :em_espera, :boolean
  end
end
