class ReservePostingsController < ApplicationController
    def approve
        @posting = Posting.find(params[:posting_id])
        @reservations = ReservePostings.find(params[:reserve_posting_id])
        @posting.reserve_postings.each do |rp|
            rp.delete unless rp == @reservations
        end
        @posting.status == false
        @posting.save
        redirect_to @posting
    end
end
