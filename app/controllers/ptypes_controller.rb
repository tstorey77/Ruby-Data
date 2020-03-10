# frozen_string_literal: true

class PtypesController < ApplicationController
  before_action :set_ptype, only: %i[show edit update destroy]

  # GET /types
  # GET /types.json
  def index
    @ptypes = Ptype.all
  end

  # GET /types/1
  # GET /types/1.json
  def show
    @ptypes = Ptype.find(params[:id])
  end

  # GET /types/new
  def new
    @ptype = Ptype.new
  end

  # GET /types/1/edit
  def edit; end

  # POST /types
  # POST /types.json
  def create
    @ptype = Ptype.new(ptype_params)

    respond_to do |format|
      if @ptype.save
        format.html { redirect_to @ptype, notice: 'Ptype was successfully created.' }
        format.json { render :show, status: :created, location: @ptype }
      else
        format.html { render :new }
        format.json { render json: @ptype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /types/1
  # PATCH/PUT /types/1.json
  def update
    respond_to do |format|
      if @ptype.update(ptype_params)
        format.html { redirect_to @ptype, notice: 'Ptype was successfully updated.' }
        format.json { render :show, status: :ok, location: @ptype }
      else
        format.html { render :edit }
        format.json { render json: @ptype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /types/1
  # DELETE /types/1.json
  def destroy
    @ptype.destroy
    respond_to do |format|
      format.html { redirect_to ptypes_url, notice: 'Ptype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ptype
    @ptype = Ptype.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def ptype_params
    params.require(:ptype).permit(:poke_type, :chinese, :japanese)
  end
end
