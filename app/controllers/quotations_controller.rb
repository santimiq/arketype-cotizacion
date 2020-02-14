class QuotationsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  before_action :find_quotation, only: [ :edit, :update, :destroy ]
  def index
    @quotations = policy_scope(Quotation).all
  end


  def show
    @quotation = Quotation.find_by slug: params[:slug]
    authorize @quotation
    @skip_navbar = true
    @skip_navbar = false if current_user
  end

  def new
    @quotation = Quotation.new
    @quotation.requirements.build
    @quotation.phases.build
    @quotation.conditions.build
    @quotation.concepts.build
    @quotation.totals.build
    @quotation.days.build
    @quotation.concept_quotations.build
    authorize @quotation
  end

  def create
    @quotation = Quotation.new(quotation_params)
    authorize @quotation
    @quotation.user = current_user
    if @quotation.save
      redirect_to quotation_path(@quotation)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @quotation.update(quotation_params)
      redirect_to quotation_path
    else
      render :update
    end
  end

  def destroy
    @quotation.destroy
    redirect_to root_path
  end

  private
    def find_quotation
      @quotation = Quotation.find_by slug: params[:slug]
      authorize @quotation
    end

    def quotation_params
      params.require(:quotation).permit(:titulo, :servicio, :fecha, :scope, :photo, requirements_attributes: [:id, :nombre, :super_title, :title, :_destroy, sub_requirements_attributes: [:id, :requerimiento, :_destroy], icons_attributes: [:id, :icon_name, :_destroy]],
        phases_attributes: [:id, :title, :description], conditions_attributes: [:id, :description, :_destroy], concepts_attributes: [:id, :name, :cantidad, :subtotal, :_destroy], totals_attributes: [:id, :subtotal, :_destroy], days_attributes: [:id, :fecha, :_destroy], concept_quotations_attributes: [:id, :concepto, :_destroy])
    end
end
