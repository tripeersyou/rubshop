class PostingsController < ApplicationController
  def index
    @postings = Posting.all.where(supplier_id: current_supplier.id)
  end
  def new
    @posting = current_supplier.postings.new
  end
  def create
    @posting = current_supplier.posting.new(posting_params)
    if @posting.save
      redirect_to @posting
    else
      render :new
    end
  end
  def show

  end
  def edit

  end
  def update
    if @posting.update(posting_params)
      redirect_to @posting
    else
      render :edit
    end
  end
  def delete

  end
  private
    def posting_params
      params.require(:posting).permit!
    end
    def set_posting
      @posting  = Posting.find(params[:id])
    end
end
