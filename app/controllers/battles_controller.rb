class BattlesController < ApplicationController
  def index
    @battles = Battle.where(lock: false).where(created_at: (DateTime.current - 12.hours)..(DateTime.current)).order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @battle = Battle.find(params[:id])
    # 悲観的ロック、排他処理
    @battle.with_lock do
      if @battle.lock == false
         @battle.lock = true
         @battle.save
         render :show
      else
        flash[:lock] = "既にロックされています。"
        redirect_to battles_path
      end
    end
  end

  def new
    @battle = Battle.new
  end

  def create
    @battle = Battle.new(battle_params)
    if @battle.save
      flash[:success] = "投稿されました"
      redirect_to battles_path
    else
      flash[:danger] = "投稿出来ませんでした"
      render :new
    end
  end
  
  private
  
  def battle_params
    params.require(:battle).permit(:format, :leader_1, :leader_2, :room, :content)
  end
end
