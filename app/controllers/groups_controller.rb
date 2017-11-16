class GroupsController < ApplicationController

  def index
    @group = Group.new
  end

  def new
    @group = Group.new
  end

  def create

  end

  def edit
    @group = Group.new
  end

  def update

  end

end
