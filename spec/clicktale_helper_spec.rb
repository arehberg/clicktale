require "rspec"
require "astrails/clicktale/helper"



describe "My behaviour" do

  class DummyClass
  end

  describe("#clicktale_bottom") do

    let(:partial) {"clicktale/bottom.html.erb"}

    let(:locals) {
      {
        :project_id=>'ziggy',
        :path=>"app/hash",
        :ratio=>1,
        :tag=>'helpn',
        :param=>nil,
        :upload_pre=>nil,
        :upload_suf=>nil
      }
    }

    before(:each) do
      @helper = DummyClass.new
      @helper.extend(Astrails::Clicktale::Helper)

      @helper.stub(:clicktale_enabled?).and_return(true)
      @helper.stub(:clicktale_config).and_return(locals)
      @helper.stub(:clicktale_url).and_return("app/hash")
    end

    it "should call render with partial and with locals" do
      @helper.should_receive(:render).with({:partial=>partial, :locals=> locals})

      @helper.clicktale_bottom
    end

    [
      [:project_id, 'zudop'],
      [:ratio, 9],
      [:tag, 'facts'],
      [:param, 'param me'],
      [:upload_pre, '<html..'],
      [:upload_suf, '</html>']
    ].each do |key, value|
      it "should update the key: #{key} to '#{value}'" do
        attributes = {key => value}
        @helper.should_receive(:render).with({:partial=>partial, :locals=> locals.merge(attributes)})

        @helper.clicktale_bottom(attributes)
      end
    end

    it "should render with all hash values" do
      attributes = {:project_id => 'zudop',
                    :ratio => 9,
                    :tag => 'facts',
                    :param => 'param me',
                    :upload_pre => '<html..',
                    :upload_suf => '</html>'}
      @helper.should_receive(:render).with({:partial=>partial, :locals=> locals.merge(attributes)})

      @helper.clicktale_bottom(attributes)
    end
  end
end