class PostsController < ApplicationController

  before_action :authorize!, only: [:show, :purchase]

  def index
    @posts = ButterCMS::Post.all
  end

  def show
    @post = ButterCMS::Post.find(params[:slug])
    @skus = Commercelayer::Sku.where(codes: sku_codes).includes(:prices, :stock_items).all
  end

  def purchase
    sku = Commercelayer::Sku.find(params[:sku_id]).first
    order = Commercelayer::Order.create({
      cart_url: post_url(params[:slug]),
      return_url: root_url
    })
    line_item = Commercelayer::LineItem.new(quantity: 1)
    line_item.relationships.order = order
    line_item.relationships.item = sku
    line_item.save
    redirect_to order.checkout_url
  end

  private
  def authorize!
    CLAYER_CLIENT.authorize!
  end

  def sku_codes
    @post.tags.map{|tag| tag.name}.join(",")
  end

end
