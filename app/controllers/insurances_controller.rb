class InsurancesController < ApplicationController
  before_filter :authenticate_user!
  
  
  inherit_resources
  actions :show, :edit, :update, :new, :create
  
end