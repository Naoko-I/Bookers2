class PostImagesController < ApplicationController
end

def new
end

def create
end

def index
end

def show
  @post_image = PostImage.find(params[:id])
end

