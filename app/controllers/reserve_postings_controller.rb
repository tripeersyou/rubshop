class ReservePostingsController < ApplicationController
    def index
        @reserve_postings = ReservePosting.all.where(seller_id: current_seller.id)
    end
    def delete
        @reserve_posting = ReservePosting.find(params[:id])
    end
    def approve
        @posting = Posting.find(params[:posting_id])
        @reservations = ReservePosting.find(params[:reserve_posting_id])
        @posting.reserve_postings.each do |rp|
            rp.delete unless rp == @reservations
        end
        @posting.status = false
        @posting.save
        redirect_to @posting
    end
end
