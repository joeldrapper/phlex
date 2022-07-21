class CardComponent < Phlex::Component
  def template(&)
    article.p_5.rounded.drop_shadow(&)
  end
end

RSpec.describe "Performance" do
  it "doesn't allocate too many objects" do
    # warmup
    CardComponent.new.call

    report = MemoryProfiler.report { CardComponent.new.call }

    expect(report.total_allocated).to eq 40
    expect(report.total_retained).to eq 0
  end
end
