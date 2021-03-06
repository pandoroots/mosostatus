class VenuesController < ApplicationController
  # GET /venues
  # GET /venues.json
  # GET venues.json?callback=parseVenue
  before_filter :authenticate_user!, :except => :index

  def index
    @venues = Venue.all
    if( params.has_key?(:callback) )
      venues_json = @venues.to_json
      respond_to do |format|
        format.json { render :json => venues_json, :callback => params[:callback]}
      end
    else
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @venues }
      end
    end
  end

  # GET /venues/1
  # GET /venues/1.json
  def show

    if user_signed_in?

    @venue = Venue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @venue }
    end
    end
  end

  # GET /venues/new
  # GET /venues/new.json
  def new

  if user_signed_in?

    @venue = Venue.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @venue }
    end

  end
  end

  # GET /venues/1/edit
  def edit

  if user_signed_in?
    @venue = Venue.find(params[:id])
  end
  end

  # POST /venues
  # POST /venues.json
  def create

  if user_signed_in?

    @venue = Venue.new(params[:venue])

    respond_to do |format|
      if @venue.save
        format.html { redirect_to @venue, notice: 'Venue was successfully created.' }
        format.json { render json: @venue, status: :created, location: @venue }
      else
        format.html { render action: "new" }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end
  end

  # PUT /venues/1
  # PUT /venues/1.json
  def update

    if user_signed_in?

    @venue = Venue.find(params[:id])

    respond_to do |format|
      if @venue.update_attributes(params[:venue])
        format.html { redirect_to @venue, notice: 'Venue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
    end
  end

  # DELETE /venues/1
  # DELETE /venues/1.json
  def destroy
    if user_signed_in?

    @venue = Venue.find(params[:id])
    @venue.destroy

    respond_to do |format|
      format.html { redirect_to venues_url }
      format.json { head :no_content }
    end
  end
  end
end
