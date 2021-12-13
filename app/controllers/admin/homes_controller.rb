class Admin::HomesController < ApplicationController
  def top
    @customer = Customer.find(params[:id])
  end
end
