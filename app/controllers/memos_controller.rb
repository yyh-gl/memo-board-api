class MemosController < ApplicationController
  before_action :set_memo, only: [:show, :update, :destroy]

  # GET /memos
  def index
    @memos = Memo.all
    json_response(@memos)
  end

  # POST /memos
  def create
    @memo = Memo.create!(memo_params)
    json_response(@memo, :created)
  end

  # GET /memos/:id
  def show
    json_response(@memo)
  end

  # PUT /memos/:id
  def update
    @memo.update(memo_params)
    head :no_content
  end

  # DELETE /memos/:id
  def destroy
    @memo.destroy
    head :no_content
  end

  private

  def memo_params
    # whitelist params
    params.permit(:content)
  end

  def set_memo
    @memo = Memo.find(params[:id])
  end
end
