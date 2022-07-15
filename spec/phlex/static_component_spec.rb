RSpec.describe Phlex::StaticComponent do
  let(:output) { example.call }
  let(:example) { component.new(name: "Joel") }
  let(:component) do
    Class.new Phlex::StaticComponent do
      def initialize(name:)
        @name = name
      end

      def template(&)
        h1 "Hello #{@name}"
        h2 "Foo #{foo}"
      end

      def foo
        "bar"
      end
    end
  end

  it "works" do
    expect(output).to eq '<h1>Hello Joel</h1><h2>Foo bar</h2>'
  end
end
