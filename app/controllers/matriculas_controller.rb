class MatriculasController < ApplicationController
    before_action :authenticate_user!
    before_action :set_turma
  
    def new
      @matricula = Matricula.new
      @alunos = Aluno.all - @turma.alunos
    end
  
    def create
      aluno = Aluno.find(params[:matricula][:aluno_id])
      em_espera = @turma.matriculas.count >= @turma.capacidade
  
      @matricula = Matricula.new(
        aluno: aluno,
        turma: @turma,
        data_matricula: Date.today,
        em_espera: em_espera
      )
  
      if @matricula.save
        msg = em_espera ? 'Aluno adicionado à lista de espera.' : 'Aluno matriculado com sucesso.'
        redirect_to turma_path(@turma), notice: msg
      else
        render :new
      end
    end
  
    def destroy
      @matricula = @turma.matriculas.find(params[:id])
      @matricula.destroy

      proxima_matricula_em_espera = @turma.matriculas.where(em_espera: true).order(:created_at).first

      if proxima_matricula_em_espera
          proxima_matricula_em_espera.update(em_espera: false)
          notice_msg = "Matrícula removida. Aluno da lista de espera promovido."
      else
          notice_msg = "Matrícula removida com sucesso."
      end

      redirect_to turma_path(@turma), notice: notice_msg
    end
  
    private
  
    def set_turma
      @turma = Turma.find(params[:turma_id])
    end
  end
  