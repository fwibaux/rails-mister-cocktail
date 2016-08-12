class DosesController < ApplicationController
  before_action :set_dose, only: [:show, :edit, :update, :destroy]
  before_action :set_cocktail, only: [:new, :show, :create]

  # def index
  #   @doses = Dose.all
  # end

  # def show
  #   @dose = Dose.find(params[:id])
  # end

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredients = Ingredient.all
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end

  # def edit
  #   @dose = Dose.find(params[:id])
  # end

  # def update
  #   @dose = Dose.find(params[:id])
  #   @dose.update(dose_params)
  #   redirect_to dose_path(@dose)
  # end

  def destroy
    @dose = Dose.find(params[:id])
    cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(cocktail)
  end

  private
  def set_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end


end
