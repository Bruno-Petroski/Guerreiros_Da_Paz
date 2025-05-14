class AlunosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_aluno, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].present?
      @alunos = Aluno.joins(:responsavel)
                    .where('alunos.nome ILIKE :search OR responsaveis.nome ILIKE :search', 
                           search: "%#{params[:search]}%")
    else
      @alunos = Aluno.all
    end
  end

  def show
  end

  def new
    @aluno = Aluno.new
  end

  def create
    @aluno = Aluno.new(aluno_params)
    if @aluno.save
      redirect_to alunos_path, notice: 'Aluno criado com sucesso.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @aluno.update(aluno_params)
      redirect_to alunos_path, notice: 'Aluno atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @aluno.destroy
    redirect_to alunos_path, notice: 'Aluno removido com sucesso.'
  end

  private

  def set_aluno
    @aluno = Aluno.find(params[:id])
  end

  def aluno_params
    params.require(:aluno).permit(:nome, :data_nascimento, :responsavel_id)
  end
end
