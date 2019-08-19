class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  def index
    @events = Event.all.sort { |e1,e2| e1.start_date <=> e2.start_date }
  end

  def show
    @event = Event.find(params[:id])
    @end_date = end_date(@event.start_date, @event.duration)
    @users = @event.users
    @attendance = Attendance.find_by(user: current_user, attended_event: @event)

  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    event_params = params[:event]
    @event = Event.new(title: event_params[:title], description: event_params[:description], start_date: event_params[:start_date].to_datetime, duration: event_params[:duration], price: event_params[:price], location: event_params[:location], admin: current_user)
    if @event.save
      flash[:success] = 'Event successfully created'
      redirect_to event_path(@event.id)
    else
      flash[:danger] = "Event creation aborted : #{@event.errors.messages}"
      puts @event.errors.messages
      render 'new'
    end
  end

  def update
  end

  def destroy
  end

  private
  def end_date(start_date, duration)
    start_date + duration*60
  end

end
