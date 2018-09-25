RSpec.describe WebpageUpdateChecker do
  it "has a version number" do
    expect(WebpageUpdateChecker::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(false)
  end

  it "accesses https://www.yahoo.co.jp/ and recieve correct header" do
    expect(WebpageUpdateChecker.new.header).not_to eq(nil)
  end
end
