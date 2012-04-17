class ExpirationsController < ApplicationController
  # GET /expirations
  # GET /expirations.json
  def index
    @expirations = Expiration.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @expirations }
    end
  end

  # GET /expirations/1
  # GET /expirations/1.json
  def show
    @expiration = Expiration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @expiration }
    end
  end

  # GET /expirations/new
  # GET /expirations/new.json
  def new
    @expiration = Expiration.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @expiration }
    end
  end

  # GET /expirations/1/edit
  def edit
    @expiration = Expiration.find(params[:id])
  end

  # POST /expirations
  # POST /expirations.json
  def create
    @expiration = Expiration.new(params[:expiration])

    respond_to do |format|
      if @expiration.save
        format.html { redirect_to @expiration, notice: 'Expiration was successfully created.' }
        format.json { render json: @expiration, status: :created, location: @expiration }
      else
        format.html { render action: "new" }
        format.json { render json: @expiration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /expirations/1
  # PUT /expirations/1.json
  def update
    @expiration = Expiration.find(params[:id])

    respond_to do |format|
      if @expiration.update_attributes(params[:expiration])
        format.html { redirect_to @expiration, notice: 'Expiration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @expiration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expirations/1
  # DELETE /expirations/1.json
  def destroy
    @expiration = Expiration.find(params[:id])
    @expiration.destroy

    respond_to do |format|
      format.html { redirect_to expirations_url }
      format.json { head :no_content }
    end
  end
end
