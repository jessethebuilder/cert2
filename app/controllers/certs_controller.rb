class CertsController < ApplicationController
  before_action :set_cert, only: [:show, :edit, :update, :destroy]

  def facebook_js

  end

  # GET /certs
  def index
    @certs = Cert.all
  end

  # GET /certs/1
  def show
  end

  # GET /certs/new
  def new
    @cert = Cert.new
  end

  # GET /certs/1/edit
  def edit
  end

  # POST /certs
  def create
    @cert = Cert.new(cert_params)

    if @cert.save
      redirect_to @cert, notice: 'Cert was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /certs/1
  def update
    if @cert.update(cert_params)
      redirect_to @cert, notice: 'Cert was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /certs/1
  def destroy
    @cert.destroy
    redirect_to certs_url, notice: 'Cert was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cert
      @cert = Cert.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cert_params
      params.require(:cert).permit(:user_id, :amount, :giver_id, :note, :giver_identifier)
    end
end
