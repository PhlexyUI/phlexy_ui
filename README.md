<picture>
  <source srcset="https://github.com/user-attachments/assets/2c4d7fdb-abe7-4f71-a6d0-ef4d41b5625a" media="(prefers-color-scheme: dark)">
  <img src="https://github.com/user-attachments/assets/9afa9755-4aab-412a-9dc9-5eb2f76c12d6" width="350" alt="PhlexUI logo"><br>
</picture>

A Ruby UI component library for DaisyUI using Phlex ✨

# ⚙️ Installation

## 1. Install CSS dependencies

You can install TailwindCSS and DaisyUI either via a JS bundler or via importmaps.

### JS Bundler

**TailwindCSS**

Install TailwindCSS by following the instructions in the TailwindCSS documentation, using either the Tailwind CLI or PostCSS.

**DaisyUI**

Install DaisyUI by following the instructions in the DaisyUI documentation as a Node package.

### Importmaps

**TailwindCSS with DaisyUI**

You'll need to download a TailwindCSS standalone CLI that comes bundled with DaisyUI by following the instructions in the [tailwind-cli-extra repo](https://github.com/dobicinaitis/tailwind-cli-extra).

Afterwards, place it somewhere in your project, e.g. in the bin directory.

If you want to compile the standalone TailwindCSS CLI with DaisyUI yourself, you can follow the instructions here.

**tailwindcss-rails gem**

Install tailwindcss-rails gem for Rails to automatically include your TailwindCSS stylesheets when the asset pipeline compiles your assets.

For this, you'll need to install the gem by following the instructions in the [tailwindcss-rails repo](https://github.com/rails/tailwindcss-rails).

Finally, you'll need to set the `TAILWINDCSS_INSTALL_DIR` environment variable in your Rails app pointing to the directory where you plaed the binary from the tailwind-cli-extra repo mentioned above. e.g. `TAILWINDCSS_INSTALL_DIR=bin`

### 2. Install Ruby dependencies

#### Install Phlex

Install Phlex by following the instructions in the [Phlex documentation](https://www.phlex.fun/#rails-introduction).

#### Install PhlexyUI

1. Add the PhlexyUI gem to your Gemfile:

```
bundle add phlexy_ui
```

2. (Optional) Include the `PhlexyUI` module in `ApplicationComponent`:

```rb
class ApplicationComponent < Phlex::HTML
  include PhlexyUI
end
```

This will allow you to use PhlexyUI components using the short-form syntax. For example:

```rb
class SomeView < ApplicationView
  def view_template
    Button :primary do
      "Hello, world!"
    end
  end
end
```

If you don't include PhlexyUI, you can still use the namespaced syntax:

```rb
class SomeView < ApplicationView
  def view_template
    PhlexyUI::Button :primary do
      "Hello, world!"
    end
  end
end
```

Consider not including PhlexyUI in ApplicationComponent if:

- You have your own component library with the same component names as PhlexyUI.
- You're including your own components module in `ApplicationComponent`.

In this scenario, including both PhlexyUI and your own component library in `ApplicationComponent` will lead to naming conflicts.

3. Update your `tailwind.config.js` file to include PhlexyUI styles:

```js
const execSync = require("child_process").execSync;
const outputPhlexyUI = execSync("bundle show phlexy_ui", { encoding: "utf-8" });
const phlexyUIPath = outputPhlexyUI.trim() + "/**/*.rb";
module.exports = {
  content: [
    // ... other paths
    phlexyUIPath,
  ],
};
```

4. Update your tailwind.config.js file to detect TailwindCSS classes in Ruby files.

```js
module.exports = {
  content: [
    // ... other paths
    //
    // Note the "rb" extension at the end
    "./app/views/**/*.{erb,haml,html,slim,rb}",
  ],
};
```

# 💡 Usage

Refer to [the docs](https://phlexyui.com) to see how to use components. Here's an example:

```rb
Card :base_100 do |card|
  figure do
    img(src:)
  end
  card.body do
    card.title do
      "Shoes!"
    end
    p do
      "If a dog chews shoes whose shoes does he choose?"
    end
    card.actions class: "justify-end" do
      Button :primary do
        "Buy Now"
      end
    end
  end
end
```

Which produces:

<img width="544" alt="Screenshot 2024-09-20 at 12 22 52 a m" src="https://github.com/user-attachments/assets/fad06a89-85fa-43cd-8c8f-7ed23b4ad77b">

# 🔧 Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

# 💻 Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/PhlexyUI/phlexy_ui. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/phlexy_ui/blob/main/CODE_OF_CONDUCT.md).

1. Visit [the docs](https://phlexyui.com/) to see which components are still not implemented or not yet added to the docs.

2. Implement it.

3. After your PR is merged, [add it to the docs](https://github.com/PhlexyUI/phlexy_ui_docs).

4. Celebrate 🎉

# 📃 License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

# ☝️ Code of Conduct

Everyone interacting in the PhlexyUI project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/phlexy_ui/blob/main/CODE_OF_CONDUCT.md).
