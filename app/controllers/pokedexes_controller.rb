# frozen_string_literal: true

class PokedexesController < ApplicationController
  before_action :set_pokedex, only: %i[show edit update destroy]

  # GET /pokedexes
  # GET /pokedexes.json
  def index
    # @pokedexes = Pokedex.all
    @pokedexes = Pokedex.order(:id).page(params[:page])
  end

  def search
    @pokedexes = Pokedex.where('name LIKE ?', "%#{params[:keyword]}%")
  end

  # GET /pokedexes/1
  # GET /pokedexes/1.json
  def show
    @pokedex = Pokedex.find(params[:id])
  end

  # GET /pokedexes/new
  def new
    @pokedex = Pokedex.new
  end

  # GET /pokedexes/1/edit
  def edit; end

  # POST /pokedexes
  # POST /pokedexes.json
  def create
    @pokedex = Pokedex.new(pokedex_params)

    respond_to do |format|
      if @pokedex.save
        format.html { redirect_to @pokedex, notice: 'Pokedex was successfully created.' }
        format.json { render :show, status: :created, location: @pokedex }
      else
        format.html { render :new }
        format.json { render json: @pokedex.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pokedexes/1
  # PATCH/PUT /pokedexes/1.json
  def update
    respond_to do |format|
      if @pokedex.update(pokedex_params)
        format.html { redirect_to @pokedex, notice: 'Pokedex was successfully updated.' }
        format.json { render :show, status: :ok, location: @pokedex }
      else
        format.html { render :edit }
        format.json { render json: @pokedex.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pokedexes/1
  # DELETE /pokedexes/1.json
  def destroy
    @pokedex.destroy
    respond_to do |format|
      format.html { redirect_to pokedexes_url, notice: 'Pokedex was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pokedex
    @pokedex = Pokedex.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def pokedex_params
    params.require(:pokedex).permit(:name, :type, :hp, :def, :image)
  end
end
