class AlocacoesController < ApplicationController
  def index
    @turmas = Turma.left_joins(:alunos)
                   .group('turmas.id')
                   .having('COUNT(alunos.id) < turmas.capacidade')
                   .where.not(capacidade: nil)
                   .where.not(capacidade: 0)
                   .order(:modalidade, :horario_inicio)

    @turma_selecionada = Turma.find_by(id: params[:turma_id]) || @turmas.first

    if @turma_selecionada
      # Alunos da modalidade da turma selecionada e que não estão em nenhuma turma
      alunos_nao_alocados = Aluno.where(modalidade_luta: @turma_selecionada.modalidade)
                                 .left_joins(:matriculas)
                                 .where(matriculas: { id: nil })
      @alunos_disponiveis = alunos_nao_alocados
      @alunos_alocados = @turma_selecionada.alunos
    else
      @alunos_disponiveis = []
      @alunos_alocados = []
    end
  end

  def alocar
    turma = Turma.find(params[:turma_id])
    alunos_ids = params[:alunos_disponiveis] || []
    alunos = Aluno.where(id: alunos_ids)
    vagas = turma.capacidade - turma.alunos.count
    alunos_a_alocar = alunos.limit(vagas)
    alunos_a_alocar.each do |aluno|
      Matricula.create!(aluno: aluno, turma: turma)
    end
    redirect_to alocacoes_path(turma_id: turma.id), notice: "Alunos alocados com sucesso!"
  end

  def remover
    turma = Turma.find(params[:turma_id])
    alunos_ids = params[:alunos_alocados] || []
    Matricula.where(turma: turma, aluno_id: alunos_ids).destroy_all
    redirect_to alocacoes_path(turma_id: turma.id), notice: "Alunos removidos da turma!"
  end
end 