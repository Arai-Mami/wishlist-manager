class SmallStepsController < ApplicationController
  def update
    small_step = SmallStep.find(params[:id])
    small_step.switch_done
  end
end