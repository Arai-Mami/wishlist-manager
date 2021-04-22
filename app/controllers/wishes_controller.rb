class WishesController < ApplicationController
  def index
    @wishes = Wish.where(user_id: current_user.id)
  end

  def new
    @wish = Wish.new
  end

  def create
    wish = Wish.create(wish_params)
    small_step_params.each_value{|value|
      if value != ""
        SmallStep.create(text: value, wish_id: wish.id)
      end
    }
    redirect_to :action => "index"
  end

  def show
    @wish = Wish.find(params[:id])
  end

  def update
    wish = Wish.find(params[:id])
    
    wish.update(wish_params)

    small_steps_ids = []
    #small_step_update_paramsのメモ{"text1"=>"繰り返し１", "text2"=>"繰り返し２", "text3"=>"繰り返し３", "small_step_id1"=>"56", "small_step_id2"=>"57", "small_step_id3"=>"58"} 
    
    num=1
    3.times do
      key = "small_step_id"
      key = key + num.to_s
      small_steps_ids << small_step_update_params[key.to_sym]
      num += 1
    end

    text_num=1

    small_steps_ids.each_with_index do |id,i|
      key = "text" + text_num.to_s
      if SmallStep.exists?(small_steps_ids[i])
        SmallStep.find(small_steps_ids[i]).update(text: small_step_update_params[key.to_sym]) 
      else
          SmallStep.create(text: small_step_update_params[key.to_sym], wish_id: wish.id)
      end
      text_num += 1
    end
    redirect_to wish_path(wish)
  end

  def destroy
    wish = Wish.find(params[:id])
    wish.destroy
  end

  private
  def wish_params
    wish_params = params.require(:wish).permit(:title, :memo, :deadline).merge(user_id: current_user.id)
  end

  def small_step_params
    small_step_params = params.require(:wish).permit(small_step: [:text1,:text2, :text3])
    # paramsからsmall_stepの情報を取得
    small_step_params = small_step_params.require(:small_step).permit(:text1, :text2, :text3)
  end

  def small_step_update_params
    small_step_params = params.require(:wish).permit(small_step: [:text1,:text2, :text3, :small_step_id1, :small_step_id2, :small_step_id3])
    # paramsからsmall_stepの情報を取得
    small_step_params = small_step_params.require(:small_step).permit(:text1, :text2, :text3,:small_step_id1, :small_step_id2, :small_step_id3)
  end
  #HACK:あとで繰り返し処理にする
end
