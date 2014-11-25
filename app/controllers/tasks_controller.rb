class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def activate

  end

  def close

  end

  def index
    @tasks = Task.all
  end

  def show
    @users = @task.users
    @user = current_user
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    @task.status = 0
    @task.user = current_user

    respond_to do |format|
      if @task.save
        format.html { redirect_to list_path(@task.list), notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
        format.js
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to list_path(@task.list), notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :status).merge(list_id: params[:list_id])
    end
end
