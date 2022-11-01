class GolfersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :user_set
  before_action :golfer_set, only: %i[edit update]
  before_action :contributor_confirmation_user, except: [:index]

  def index
    @golfer = Golfer.find_by(user_id: @user.id) if @user.golfer.present?
  end

  def new
    @golfer = Golfer.new
  end

  def create
    @golfer = Golfer.new(golfer_params)
    if @golfer.save
      redirect_to user_golfers_path(@golfer.user_id)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @golfer.update(golfer_params)
      redirect_to user_golfers_path(@golfer.user_id)
    else
      render :edit
    end
  end

  private

  def golfer_params
    params.require(:golfer).permit(:average_score_id, :type_id, :dominant_hand_id, :golf_history_id,
                                   :average_putt, :feature, :worries).merge(user_id: current_user.id)
  end

  def user_set
    @user = User.find(params[:user_id])
  end

  def golfer_set
    @golfer = Golfer.find_by(user_id: params[:user_id])
  end

  def contributor_confirmation_user
    redirect_to root_path if @user.id != current_user.id
  end
end
