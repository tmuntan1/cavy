require_dependency "cavy/application_controller"

module Cavy
  class AdminPagesController < ApplicationController

    layout 'layouts/cavy/admin_layout'

    def index
    end

    def new
      @page = Cavy::Page.new
    end

    def show
      @page = Cavy::Page.find(params[:id])
    end

    def create
      @page = Page.new(page_params)

      if @page.save
        redirect_to admin_page_path(@page), notice: 'Page was successfully created.'
      else
        render action: 'new'
      end
    end

    def delete
      @page = Cavy::Page.find(params[:id])
      @page.destroy
      redirect_to admin_pages_path, notice: 'Page was successfully destroyed.'
    end

    def update
      @page = Page.find(params[:id])
      if @page.update(page_params)
        redirect_to admin_page_path(@page), notice: 'Page was successfully created.'
      else
        render action: 'edit'
      end
    end

    def edit
      @page = Cavy::Page.find(params[:id])
    end

    private

      def page_params
        params.require(:page).permit(:title, :render)
      end

  end
end
