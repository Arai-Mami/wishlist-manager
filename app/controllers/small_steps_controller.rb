class SmallStepsController < ApplicationController
  def update
    small_step = SmallStep.find(params[:id])
    if small_step.done == false
      small_step.done = true
      small_step.save
    else
      small_step.done = false
      small_step.save
    end
  end
end
