module Refinery
  module Stores
    class StoresController < ::ApplicationController

      before_filter :find_all_stores
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @store in the line below:
        present(@page)
      end

      def show
        @store = Store.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @store in the line below:
        present(@page)
      end

    protected

      def find_all_stores
        @stores = Store.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/stores").first
      end

    end
  end
end
