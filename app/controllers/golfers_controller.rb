class GolfersController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @golfer = Golfer.find(params[:user_id])
  end

  def new
    @user = User.find(params[:user_id])
    @golfer = Golfer.new
  end

  def create
    @golfer = Golfer.new(golfer_params)
    if @golfer.save
      redirect_to user_golfers_path(@golfer.id)
    else
      render :new
    end
  end

  def edit
    @golfer = Golfer.find(params[:user_id])
  end

  def update
    @golfer = Golfer.find(params[:user_id])
    if @golfer.update(golfer_params)
      redirect_to user_golfers_path(@golfer.id)
    else
      render :edit
    end
  end

  private
  def golfer_params
    params.require(:golfer).permit(:average_score_id, :type_id, :dominant_hand_id, :golf_history_id,
    :average_putt, :feature, :worries).merge(user_id: current_user.id)
  end

end
