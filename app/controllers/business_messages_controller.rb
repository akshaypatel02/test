class BusinessMessagesController < ApplicationController
  before_action :set_business_message, only: [:show, :edit, :update, :destroy]

  # GET /business_messages
  # GET /business_messages.json
  def index
    @business_messages = BusinessMessage.all
  end
  
  def broadcasts
    @business_messages = BusinessMessage.all
  end

  # GET /business_messages/1
  # GET /business_messages/1.json
  def show
  end

  # GET /business_messages/new
  def new
    @business_message = BusinessMessage.new
  end

  # GET /business_messages/1/edit
  def edit
  end

  # POST /business_messages
  # POST /business_messages.json
  def create
    @business_message = BusinessMessage.new(business_message_params)
    @business_message.user_id = current_user.id
    respond_to do |format|
      if @business_message.save
        format.html { redirect_to home_path, notice: 'Business message was successfully created.' }
        format.json { render :show, status: :created, location: @business_message }
      else
        format.html { render :new }
        format.json { render json: @business_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /business_messages/1
  # PATCH/PUT /business_messages/1.json
  def update
    respond_to do |format|
      if @business_message.update(business_message_params)
        format.html { redirect_to @business_message, notice: 'Business message was successfully updated.' }
        format.json { render :show, status: :ok, location: @business_message }
      else
        format.html { render :edit }
        format.json { render json: @business_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business_messages/1
  # DELETE /business_messages/1.json
  def destroy
    @business_message.destroy
    respond_to do |format|
      format.html { redirect_to business_messages_url, notice: 'Business message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business_message
      @business_message = BusinessMessage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def business_message_params
      params.require(:business_message).permit(:title, :content, :user_id)
    end
end
