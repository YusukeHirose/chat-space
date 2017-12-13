class MembersController < ApplicationController
  before_action :member_new, only: [:index,:new]

  def index

  end

  def new

  end

  def create

  end

  def member_new
    @member = Member.new
  end
end

