class FilterMd5Asset
  def self.clean(string)
    string.gsub(/-([a-fA-F\d]{32})/, '')
  end
end