require "spec_helper"

describe PhlexyUI::Chat do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <div class="chat"></div>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "with part methods" do
    subject(:output) do
      render described_class.new do |c|
        c.image { "Image" }
        c.header { "Header" }
        c.bubble { "Message" }
        c.footer { "Footer" }
      end
    end

    it "renders all parts" do
      expected_html = html <<~HTML
        <div class="chat">
          <div class="chat-image">Image</div>
          <div class="chat-header">Header</div>
          <div class="chat-bubble">Message</div>
          <div class="chat-footer">Footer</div>
        </div>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "conditions" do
    {
      start: "chat-start",
      end: "chat-end"
    }.each do |modifier, css|
      context "when given :#{modifier} modifier" do
        subject(:output) { render described_class.new(modifier) }

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <div class="chat #{css}"></div>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end
  end

  describe "bubble colors" do
    {
      primary: "chat-bubble-primary",
      secondary: "chat-bubble-secondary",
      accent: "chat-bubble-accent",
      neutral: "chat-bubble-neutral",
      info: "chat-bubble-info",
      success: "chat-bubble-success",
      warning: "chat-bubble-warning",
      error: "chat-bubble-error"
    }.each do |color, css|
      context "when bubble is given :#{color} modifier" do
        subject(:output) do
          render described_class.new do |c|
            c.bubble(color) { "Message" }
          end
        end

        it "renders bubble with color class" do
          expected_html = html <<~HTML
            <div class="chat">
              <div class="chat-bubble #{css}">Message</div>
            </div>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end
  end

  describe "data" do
    subject(:output) do
      render described_class.new(data: {foo: "bar"})
    end

    it "renders it correctly" do
      expected_html = html <<~HTML
        <div class="chat" data-foo="bar"></div>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "responsiveness" do
    %i[sm md lg xl @sm @md @lg @xl].each do |viewport|
      context "when given an :#{viewport} responsive option" do
        subject(:output) do
          render described_class.new(:start, responsive: {viewport => :end})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <div class="chat chat-start #{viewport}:chat-end"></div>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end
  end

  describe "passing :as option" do
    subject(:output) { render described_class.new(as: :section) }

    it "renders as the given tag" do
      expected_html = html <<~HTML
        <section class="chat"></section>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
