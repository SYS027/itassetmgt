class Api::V1::StatesController < ApplicationController
  def index
    if params[:country_id]
      states = State.where(country_id: params[:country_id])
    else
      states = State.all
    end
    render json: states
  end
    
  def show
    state = State.find(params[:id])
    render json: state
  end
    
  def create
    state = State.new(state_params)
    if state.save
      render json: state, status: :created
    else
      render json: { errors: state.errors }, status: :unprocessable_entity
    end
  end
    
  def update
    state = State.find(params[:id])
    if state.update(state_params)
      render json: state
    else
      render json: { errors: state.errors }, status: :unprocessable_entity
    end
  end
    
  def destroy
    state = State.find(params[:id])
    state.destroy
    head :no_content
  end
    
  private
  def state_params
    params.require(:state).permit(:state_name, :country_id)
  end
end

