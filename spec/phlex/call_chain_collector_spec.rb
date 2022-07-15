RSpec.describe Phlex::CallChainCollector do
  let(:output) { collector.to_s }
  let(:collector) { Phlex::CallChainCollector.new("@article") }

  it "returns the interpolation string" do
    expect(output).to eq '#{@article}'
  end

  context "with chained methods" do
    let(:output) { collector.a.b.c.to_s }

    it "returns the interpolation string" do
      expect(output).to eq '#{@article.a.b.c}'
    end
  end
end


