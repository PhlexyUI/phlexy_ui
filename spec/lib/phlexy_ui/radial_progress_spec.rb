require "spec_helper"

describe PhlexyUI::RadialProgress do
  subject(:output) { render described_class.new(value: 50) }

  describe "responsiveness" do
    %i[sm md lg xl @sm @md @lg @xl].each do |viewport|
      context "when given an :#{viewport} responsive option as a single argument" do
        subject(:output) do
          render described_class.new(:neutral, value: 50, responsive: {viewport => :primary})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <div role="progressbar" class="radial-progress bg-neutral text-neutral-content border-neutral #{viewport}:bg-primary #{viewport}:text-primary-content #{viewport}:border-primary" style="--value: 50;"></div>
          HTML

          expect(output).to eq(expected_html)
        end
      end

      context "when given multiple responsive options as an array" do
        subject(:output) do
          render described_class.new(:neutral, value: 50, responsive: {viewport => [:primary, :info]})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <div role="progressbar" class="radial-progress bg-neutral text-neutral-content border-neutral #{viewport}:bg-primary #{viewport}:text-primary-content #{viewport}:border-primary #{viewport}:bg-info #{viewport}:text-info-content #{viewport}:border-info" style="--value: 50;"></div>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end
  end

  context "when size and thickness are not provided" do
    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render PhlexyUI::RadialProgress.new(value: 50) do
            "50%"
          end
        end
      end
    end

    subject(:output) do
      render component.new
    end

    it "does not include the --size nor --thickness styles" do
      expected_html = html <<~HTML
        <div role="progressbar" 
             class="radial-progress"  
             style="--value: 50;">50%</div>
      HTML

      is_expected.to eq(expected_html)
    end
  end

  context "when size is provided but thickness is not" do
    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render PhlexyUI::RadialProgress.new(value: 50, size: "6rem") do
            "50%"
          end
        end
      end
    end

    subject(:output) do
      render component.new
    end

    it "does not include the --thickness style" do
      expected_html = html <<~HTML
        <div role="progressbar" 
             class="radial-progress"  
             style="--value: 50; --size: 6rem;">50%</div>
      HTML

      is_expected.to eq(expected_html)
    end
  end

  context "when thickness is provided but size is not" do
    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render PhlexyUI::RadialProgress.new(value: 50, thickness: "10%") do
            "50%"
          end
        end
      end
    end

    subject(:output) do
      render component.new
    end

    it "does not include the --size style" do
      expected_html = html <<~HTML
        <div role="progressbar" 
             class="radial-progress"  
             style="--value: 50; --thickness: 10%;">50%</div>
      HTML

      is_expected.to eq(expected_html)
    end
  end

  describe "rendering a full radial progress" do
    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render PhlexyUI::RadialProgress.new(
            :neutral,
            value: 50,
            size: "6rem",
            thickness: "10%",
            primary: false,
            class: "border-4",
            style: "background-color: red;",
            as: :section,
            data: {
              my: "radial_progress"
            }
          ) do
            "50%"
          end
        end
      end
    end

    subject(:output) do
      render component.new
    end

    it "is expected to match the formatted HTML" do
      expected_html = html <<~HTML
        <section role="progressbar" class="radial-progress bg-neutral text-neutral-content border-neutral border-4"  
             style="background-color: red; --value: 50; --size: 6rem; --thickness: 10%;"
             data-my="radial_progress">50%</section>
      HTML

      is_expected.to eq(expected_html)
    end
  end
end
