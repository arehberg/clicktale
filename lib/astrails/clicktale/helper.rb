module Astrails
  module Clicktale
    module Helper
      def clicktale_top
        return unless clicktale_enabled?
        render :partial => "clicktale/top.html.erb"
      end

      def clicktale_bottom(options = {})
        return unless clicktale_enabled?
        config = clicktale_config.merge(options)

        render :partial => "clicktale/bottom.html.erb", :locals => {
          :project_id => config[:project_id],
          :path => clicktale_url,
          :ratio => config[:ratio] || 1,
          :tag => config[:tag],
          :param => config[:param],
          :upload_pre => config[:upload_pre],
          :upload_suf => config[:upload_suf]
        }
      end
    end
  end
end

