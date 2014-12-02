class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :join]

  def join
    @list = List.find(params[:list_id])
    if @list and current_user
        if current_user.subs.include?(@list)
          redirect_to @list, notice: 'You\'ve already joined this list.' 
        else
          @list.users << current_user
          @list.create_tasklings_for(current_user)
          redirect_to @list, notice: 'You have been subscribed to this list.'
        end
    end
  end

  def index
    @lists = current_user.lists
  end

  def show
    @task = Task.new
    @tasks = @list.tasks
  end

  def new
    @list = List.new
  end

  def edit
  end

  def create
    @list = List.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_list
      @list = List.find(params[:id])
    end

    def list_params
      params.require(:list).permit(:name, :description).merge(user_id: current_user.id)
    end
end
