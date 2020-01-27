class ReceiptsController < ApplicationController
  respond_to :html, :pdf
  def show
    @cart = Cart.find(params[:id])
    @movie = @cart.movie
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "#{@cart.id}",
        title: 'Receipt',
        layout: 'pdf.html',
        template: 'receipts/show',
        :save_to_file => Rails.root.join('public', "#{@cart.id}.pdf")
      end
    end
  end
end
