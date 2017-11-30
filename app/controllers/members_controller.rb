class MembersController < ApplicationController

  def index
    @member = Member.new
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new
  end
end

