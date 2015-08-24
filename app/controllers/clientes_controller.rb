class ClientesController < ApplicationController
  authorize_resource
  before_action :set_cliente, only: [:show, :edit, :update, :destroy]

  # GET /clientes
  # GET /clientes.json
  def index
    @clientes = Cliente.all
  end

  # GET /clientes/1
  # GET /clientes/1.json
  def show
  end

  # GET /clientes/new
  def new
    @cliente = Cliente.new
    @caso = Caso.new
    @relato = Relato.new
  end

  # GET /clientes/1/edit
  def edit
  end

  # POST /clientes
  # POST /clientes.json
  def create
    @cliente = Cliente.new(cliente_params)
    respond_to do |format|
      if @cliente.save

        @caso = Caso.new(caso_params)
        @relato = Relato.new(relato_params)
        @relato.save
        @caso.relatos << @relato
        @caso.cliente_id = @cliente.id
        @caso.save

        format.html { redirect_to @cliente, notice: 'Cliente was successfully created.' }
        format.json { render :show, status: :created, location: @cliente }
      else
        format.html { render :new }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clientes/1
  # PATCH/PUT /clientes/1.json
  def update
    respond_to do |format|
      if @cliente.update(cliente_params)
        format.html { redirect_to @cliente, notice: 'Cliente was successfully updated.' }
        format.json { render :show, status: :ok, location: @cliente }
      else
        format.html { render :edit }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clientes/1
  # DELETE /clientes/1.json
  def destroy
    @cliente.destroy
    respond_to do |format|
      format.html { redirect_to clientes_url, notice: 'Cliente was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @cliente = Cliente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cliente_params
      params.require(:cliente).permit(:filhos_quantidade, :profissao_nome, :familia_quantidade, 
                                      :familia_renda, :contribuintes_quantidade, :estado_civil_id,
                                      :moradia_type_id, :profissao_type_id, :nome, :cpf, 
                                      :nome_da_mae, :rg, :cor, :identidade_de_genero)
    end

    def caso_params
      params.require(:cliente).permit(:caso).permit(:status)
    end

    def relato_params
      params.require(:cliente).permit(:relato).permit(:description)
    end
end