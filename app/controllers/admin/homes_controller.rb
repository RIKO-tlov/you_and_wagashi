class Admin::HomesController < ApplicationController

  def top
    @shops = Shop.all
  end
end
