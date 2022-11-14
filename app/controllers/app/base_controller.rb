class App::BaseController < ApplicationController
  include PowerTypes::Presentable

  before_action :authenticate_user!
end
