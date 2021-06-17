class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @shops = Shop.all
  end
end
