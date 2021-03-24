class WishesController < ApplicationController
  def index
    @wishes = Wish.all
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
    small_steps_ids << small_step_update_params[:small_step_id1]
    small_steps_ids << small_step_update_params[:small_step_id2]
    small_steps_ids << small_step_update_params[:small_step_id3]
    
    if SmallStep.exists?(small_steps_ids[0])
      SmallStep.find(small_steps_ids[0]).update(text: small_step_update_params[:text1]) 
    else
        SmallStep.create(text: small_step_update_params[:text1], wish_id: wish.id)
    end


    if SmallStep.exists?(small_steps_ids[1])
      SmallStep.find(small_steps_ids[1]).update(text: small_step_update_params[:text2]) 
    else
      SmallStep.create(text: small_step_update_params[:text2], wish_id: wish.id)
    end

    if SmallStep.exists?(small_steps_ids[2])
      SmallStep.find(small_steps_ids[2]).update(text: small_step_update_params[:text3]) 
    else
      SmallStep.create(text: small_step_update_params[:text3], wish_id: wish.id)
    end

    redirect_to wish_path(wish)
  end

  def destroy
    wish = Wish.find(params[:id])
    wish.destroy
  end

  private
  def wish_params
    re_params = params.require(:wish).permit(:title, :memo)
    #deadline以外のデータを取得したハッシュを作成
    date = params.require(:wish).permit(:deadline)
    deadline = Date.new(date["deadline(1i)"].to_i, date["deadline(2i)"].to_i,  date["deadline(3i)"].to_i)
    #deadlineのデータをDateクラスに変換
    re_params.merge(deadline: deadline)
    #２つのデータを合体し新しいハッシュを生成
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

end
