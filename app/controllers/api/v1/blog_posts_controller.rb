class Api::V1::BlogPostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    def index
        @posts = BlogPost.includes(:categorizations).all
        render json: @posts
    end

    def show
        @post = BlogPost.includes(:categories).find_by(id: params[:id])
        render json: @post
    end

    def update
        @post = BlogPost.find_by(id: params[:id])
        if @post
            @post.update(post_params)
        end
    end

    def create
        @post = current_user.blog_posts.build(post_params)
        if @post
            @post.save
        end
    end

    def destroy
        @post = BlogPost.find_by(id: params[:id])
        if @post
            @post.destroy
        end
    end

    private
    def post_params
        params.require(:blog_post).permit(:title, :summary, :body, :tags, :categories)
    end


end
