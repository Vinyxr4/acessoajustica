class CasosController < ApplicationController
  load_and_authorize_resource
  before_action :set_caso, only: [:show, :edit, :update, :destroy]

  # GET /casos
  # GET /casos.json
  def index
    @casos = Caso.where("created_at >= ?", Time.zone.now.beginning_of_day).select do |caso|
      caso.status == true and caso.estagiario == nil
    end
#    authorize! :manage, @casos
  end 

  # GET /casos/my-cases
  def my_cases
    authorize! :read, Caso
    @casos = Caso.all_of_user(current_user)
  end

  # GET /casos/select-cases
  def select_case
    authorize! :update, Caso
    @caso = Caso.find(params[:id])
    @membro = Membro.find(current_user.membro_id)
    @caso.update(estagiario_id: @membro.actable_id)
    #@caso.update(estagiario_id: current_user.id)
    redirect_to casos_url
  end


  # GET /casos/1
  # GET /casos/1.json
  def show

  end

  # GET /casos/new
  def new
    @caso = Caso.new
  end

  # GET /casos/1/edit
  def edit
    @relato = Relato.new
  end

  # POST /casos
  # POST /casos.json
  def create
    @caso = Caso.new(caso_params)

    respond_to do |format|
      if @caso.save
        format.html { redirect_to @caso, notice: 'Caso was successfully created.' }
        format.json { render :show, status: :created, location: @caso }
      else
        format.html { render :new }
        format.json { render json: @caso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /casos/1
  # PATCH/PUT /casos/1.json
  def update
    respond_to do |format|
      @caso.relatos.build(:description => caso_params[:new_relato])
      if @caso.update(caso_params.except(:new_relato))
        format.html { redirect_to @caso, notice: 'Caso was successfully updated.' }
        format.json { render :show, status: :ok, location: @caso }
      else
        format.html { render :edit }
        format.json { render json: @caso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /casos/1
  # DELETE /casos/1.json
  def destroy
    @caso.destroy
    respond_to do |format|
      format.html { redirect_to casos_url, notice: 'Caso was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caso
      @caso = Caso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def caso_params
      params.require(:caso).permit(:status, :cliente_id, :caso_type_id, :new_relato)
    end
end
