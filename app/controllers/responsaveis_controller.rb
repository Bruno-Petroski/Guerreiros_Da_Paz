class ResponsaveisController < ApplicationController
  before_action :authenticate_user!
  before_action :set_responsavel, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].present?
      @responsaveis = Responsavel.where('nome ILIKE ? OR telefone ILIKE ?', "%#{params[:search]}%", "%#{params[:search]}%")
    else
      @responsaveis = Responsavel.all
    end
  end

  def show
  end

  def new
    @responsavel = Responsavel.new
  end

  def create
    @responsavel = Responsavel.new(responsavel_params)
    if @responsavel.save
      redirect_to responsaveis_path, notice: 'Responsável criado com sucesso.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @responsavel.update(responsavel_params)
      redirect_to responsaveis_path, notice: 'Atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @responsavel.destroy
    redirect_to responsaveis_path, notice: 'Removido com sucesso.'
  end

  private

  def set_responsavel
    @responsavel = Responsavel.find(params[:id])
  end

  def responsavel_params
    params.require(:responsavel).permit(:nome, :telefone, :endereco)
  end
end
