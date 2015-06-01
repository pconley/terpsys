class InterpreterController < ApplicationController
    
  def dash
    @job = current_user.interpreter_jobs.order('created_at DESC').all
  end
  
end