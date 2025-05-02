class ProfessoresController < ApplicationController
  before_action :authenticate_user!
  before_action :set_professor, only: [:edit, :update, :destroy]

  def index
    @professores = Professor.all
  end

  def new
    @professor = Professor.new
  end

  def create
    @professor = Professor.new(professor_params)
    if @professor.save
      redirect_to professores_path, notice: 'Professor criado com sucesso.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @professor.update(professor_params)
      redirect_to professores_path, notice: 'Atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @professor.destroy
    redirect_to professores_path, notice: 'Removido com sucesso.'
  end

  private

  def set_professor
    @professor = Professor.find(params[:id])
  end

  def professor_params
    params.require(:professor).permit(:nome, :email, :telefone, :especialidade)
  end
end
