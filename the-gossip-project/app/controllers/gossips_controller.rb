class GossipsController < ApplicationController

	def new
		@gossip = Gossip.new
	end

	def create
		post = Gossip.create(post_params)
		redirect_to gossip_path(post.id)
	end

	def show 
		@gossip = Gossip.find(params[:id])
	end

	def index
		@gossip = Gossip.all
	end

	def edit
		@gossip = Gossip.find(params[:id])
	end

	def update
		@gossip = Gossip.find(params[:id])
		@gossip.update(post_params)
		redirect_to gossip_path
	end

	def destroy
		@gossip = Gossip.find(params[:id])
		@gossip.destroy
		redirect_to gossips_path
	end

	private
	def post_params
		params.require(:gossip).permit(:anonymous_author, :content)
	end
end