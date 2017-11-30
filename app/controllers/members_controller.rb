class MembersController < ApplicationController

  def index
    member_new
  end

  def new
    member_new
  end

  def create
    member_new
  end

  def member_new
    @member = Member.new
  end
end

