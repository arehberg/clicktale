require 'filter_md5_asset'

class ClicktaleController < ApplicationController
  def show
    send_data(get_cleaned_file(params[:filename]), :type => :html, :disposition => "inline")
  end

  private
  def get_cleaned_file(filename)
    FilterMd5Asset.clean(Rails.cache.fetch(filename))
  end
end