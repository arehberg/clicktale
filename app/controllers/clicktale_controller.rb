class ClicktaleController < ApplicationController
  def show
    send_data(Rails.cache.fetch(params[:filename]), :type => :html, :disposition => "inline")
  end
end