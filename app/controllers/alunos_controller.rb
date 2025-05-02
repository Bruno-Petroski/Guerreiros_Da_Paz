class AlunosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_aluno, only: [:edit, :update, :destroy]

  def index
    @alunos = Aluno.includes(:responsavel).all
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

  def edit; end

  def update
    if @aluno.update(aluno_params)
      redirect_to alunos_path, notice: 'Atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @aluno.destroy
    redirect_to alunos_path, notice: 'Removido com sucesso.'
  end

  private

  def set_aluno
    @aluno = Aluno.find(params[:id])
  end

  def aluno_params
    params.require(:aluno).permit(:nome, :data_nascimento, :email, :telefone, :responsavel_id)
  end
end
