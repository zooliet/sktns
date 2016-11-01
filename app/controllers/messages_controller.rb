class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token, if: :json_request?

  def index
    @messages = Message.all.order(created_at: :desc)
  end

  def show
    @message = Message.last
    respond_to do |format|
      format.json { render json: @message }
    end
  end

  def create
    @message = Message.new(message_params)
    respond_to do |format|
      if @message.save

        if (counts = Message.count) > 100
          n = counts - 100
          ids = Message.order('created_at DESC').limit(n).pluck(:id)
          Message.where(id: ids).delete_all
        end


        format.html { redirect_to messages_path, notice: '메시지가 정상적으로 생성되었습니다.' }
        # format.json { render :show, status: :created, location: @message }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to messages_path, notice: '메시지가 정상적으로 삭제되었습니다.'
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def message_params
    params.require(:message).permit(:status)
  end

  def json_request?
    request.format.json?
  end
end






