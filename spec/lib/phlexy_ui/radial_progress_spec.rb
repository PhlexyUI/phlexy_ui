require "spec_helper"

describe PhlexyUI::RadialProgress do
  subject(:output) { render described_class.new }

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
              my: :radial_progress
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
        <section role="progressbar" class="radial-progress bg-neutral text-neutral-content border-4"  
             style="background-color: red; --value: 50; --size: 6rem; --thickness: 10%;"
             data-my="radial_progress">50%</section>
      HTML

      is_expected.to eq(expected_html)
    end
  end
end
