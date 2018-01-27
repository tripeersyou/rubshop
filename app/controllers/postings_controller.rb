class PostingsController < ApplicationController
  before_action :set_posting, only: [:show, :edit, :destroy, :update]
  def index
    if supplier_signed_in?
      @postings = Posting.all.where(supplier_id: current_supplier.id)
    else
      @postings = Posting.all
    end
  end
  def new
    @posting = current_supplier.postings.new
  end
  def create
    @posting = current_supplier.postings.new(posting_params)
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
    picture = params[:posting][:avatar]
    if @posting.update(posting_params)
      if picture
        @posting.picture.attach(picture)
      end
      redirect_to @posting
    else
      render :edit
    end
  end
  def destroy
    @posting.reserve_postings.each do |r|
      r.delete
    end
    @posting.delete
    redirect_to postings_path
  end
  def reserve
    @posting = Posting.find(params[:id])
    @posting.reserve_count += 1
    @reserve_posting = ReservePosting.create({posting: @posting, seller: current_seller})
    redirect_to postings_path
  end
  private
    def posting_params
      params.require(:posting).permit!
    end
    def set_posting
      @posting  = Posting.find(params[:id])
    end
end
