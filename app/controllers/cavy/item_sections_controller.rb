require_dependency 'cavy/application_controller'

module Cavy
  class ItemSectionsController < ApplicationController
    before_action :set_item_section, only: %i[show edit]
    layout 'cavy/admin_layout'

    def index
      @item_sections = ItemSection.all
    end

    def new
      @item_section = ItemSection.new
      @item_groups = ItemGroup.all
    end

    def edit
      @item_groups = ItemGroup.all
    end

    def create
      @item_section = ItemSection.new(title: item_section_params[:title], item_groups: params[:item_section][:item_groups])
      @item_groups = ItemGroup.all

      if @item_section.save
        redirect_to cavy_edit_items_path(item_section_id: @item_section), notice: 'Item section was successfully created.'
      else
        render action: 'new'
      end
    end

    def update
      @item_groups = ItemGroup.all

      if @item_section.update(title: item_section_params[:title], item_groups: params[:item_section][:item_groups])
        redirect_to cavy_item_section_path(@item_section), notice: 'Item section was successfully updated.'
      else
        render action: 'edit'
      end
    end

    def destroy
      @item_section.destroy
      redirect_to cavy_item_sections_url, notice: 'Item section was successfully destroyed.'
    end

    private

    def set_item_section
      @item_section = ItemSection.find(params[:id])
    end

    def item_section_params
      params.require(:item_section).permit(:title)
    end
  end
end
