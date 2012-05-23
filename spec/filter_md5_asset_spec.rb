require "rspec"
require 'filter_md5_asset'

describe "Filter MD5 Asset" do

  it "should filter out css MD5 fingerprints" do
    string = "global-908e25f4bf641868d8683022a5b62f54.css"
    FilterMd5Asset.clean(string).should == "global.css"
  end

  it "should filter out js MD5 fingerprints" do
    string = "application-908e25f4bf641868d8683022a5b62f54.js"
    FilterMd5Asset.clean(string).should == "application.js"
  end

  it "should handle an html page with multiple references" do
    string = '
            <html><head>
              <link href="/clientrms/assets/application-d000030d95528094c2a9887e1829e9be.css" media="screen" rel="stylesheet" type="text/css" />
              <link href="/clientrms/assets/application-media-print-d1fe6f470254a71af2d6b824cac19e7d.css" media="print" rel="stylesheet" type="text/css" />
              </head><body>
              <script src="/clientrms/assets/views/home/index-b686b80dcf1fae5d2ff888e8a8a5daf7.js" type="text/javascript"></script>
            </body></html>
           '

    expected_result = '
            <html><head>
              <link href="/clientrms/assets/application.css" media="screen" rel="stylesheet" type="text/css" />
              <link href="/clientrms/assets/application-media-print.css" media="print" rel="stylesheet" type="text/css" />
              </head><body>
              <script src="/clientrms/assets/views/home/index.js" type="text/javascript"></script>
            </body></html>
           '
    FilterMd5Asset.clean(string).should == expected_result
  end
end