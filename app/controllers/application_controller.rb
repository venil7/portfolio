class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  def _try_save_model(model,source_action,redirect_action,opts={})
    opts = {:success=>"Successfully saved.",:error=>"Error performing operation."}
            .merge(opts)
    if model.save
      flash[:success] = opts[:success]
      redirect_to :action => redirect_action
      return true
    else
      flash.now[:error] = opts[:error]
      render source_action
      return false
    end
  end

  private
  def page_size
    5
  end
end
