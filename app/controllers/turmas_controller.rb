class TurmasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_turma, only: [:show, :edit, :update, :destroy]

  def index
    @turmas = Turma.includes(:professor).all
  end

  def show
    @alunos = @turma.alunos
    @matriculas_em_espera = @turma.matriculas.where(em_espera: true)
  end

  def new
    @turma = Turma.new
  end

  def create
    @turma = Turma.new(turma_params)
    if @turma.save
      redirect_to turmas_path, notice: 'Turma criada com sucesso.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @turma.update(turma_params)
      redirect_to turmas_path, notice: 'Atualizada com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @turma.destroy
    redirect_to turmas_path, notice: 'Removida com sucesso.'
  end

  private

  def set_turma
    @turma = Turma.find(params[:id])
  end

  def turma_params
    params.require(:turma).permit(:nome, :descricao, :modalidade, :local, :horario, :capacidade, :professor_id, :dia, :horario_inicio, :horario_fim)
  end
end
