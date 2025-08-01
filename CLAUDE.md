# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Common Development Commands

### Testing

- Run all tests: `bundle exec rspec`
- Run a specific test file: `bundle exec rspec spec/lib/phlexy_ui/button_spec.rb`
- Run tests with documentation format: `bundle exec rspec --format documentation`

### Linting

- Run linter: `bundle exec standardrb`
- Auto-fix linting issues: `bundle exec standardrb --fix`

### Console

- Interactive console: `bin/console`

### Building and Releasing

- Build gem: `gem build phlexy_ui.gemspec`
- Bump version: `rake release:bump_version VERSION=x.x.x`
- Publish new version: `rake release:publish`

## Architecture Overview

PhlexyUI is a Ruby UI component library that wraps DaisyUI components using the Phlex framework. Understanding this architecture requires knowledge of:

1. **Phlex**: A Ruby gem for building HTML components using Ruby classes. Components inherit from `Phlex::HTML` and use Ruby methods to generate HTML.

2. **DaisyUI**: A Tailwind CSS component library that provides pre-styled components through CSS classes.

3. **Component Structure**:

   - All components inherit from `PhlexyUI::Base` (defined in `lib/phlexy_ui/base.rb`)
   - `PhlexyUI::Base` inherits from `Phlex::HTML` and provides common functionality
   - Components are automatically loaded via Zeitwerk
   - The module uses `Phlex::Kit` to enable short-form syntax when included

4. **Key Base Class Features**:

   - **Modifiers System**: Components accept modifier symbols (e.g., `:primary`, `:large`) that map to DaisyUI CSS classes
   - **Options Handling**: Additional HTML attributes and classes via the `options` hash
   - **Class Generation**: The `generate_classes!` method builds the final CSS class list
   - **Attribute Generation**: The `generate_attributes` method handles data attributes and other HTML attributes
   - **Render Delegation**: The `render_as` method allows components to be rendered as different elements or components

5. **Configuration System** (`lib/phlexy_ui/configurable.rb`):

   - Global configuration via `PhlexyUI.configure`
   - Custom modifiers can be added globally or per-component
   - Prefix support for CSS classes

6. **Component Patterns**:

   - Components typically have a main rendering method and may yield to blocks
   - Many components support nested sub-components (e.g., Card with card.body, card.title)
   - CSS classes are generated based on the component type and modifiers passed

7. **Responsive Class Comments**:
   - All modifier mappings must include comments with responsive variants (sm:, md:, lg:)
   - This is because Tailwind CSS cannot execute Ruby code to discover dynamically generated classes
   - Without these comments, Tailwind won't generate the CSS for responsive modifiers
   - Example from `card.rb`:
     ```ruby
     register_modifiers(
       # "sm:card-bordered"
       # "md:card-bordered"
       # "lg:card-bordered"
       bordered: "card-bordered",
       # "sm:bg-primary sm:text-primary-content"
       # "md:bg-primary md:text-primary-content"
       # "lg:bg-primary lg:text-primary-content"
       primary: "bg-primary text-primary-content"
     )
     ```

## Testing Approach

- Uses RSpec with Phlex testing helpers
- Tests verify HTML output structure and CSS classes
- Test files mirror the component structure in `spec/lib/phlexy_ui/`
- Support files in `spec/support/` provide testing utilities

## Development Workflow

When creating or modifying components:

1. Check existing components for patterns and conventions
2. Ensure proper modifier mappings for DaisyUI classes
3. **Always include responsive variant comments** above each modifier (sm:, md:, lg:)
4. Write tests that verify HTML structure and CSS classes
5. Run linter to ensure code style consistency
6. Update version and timestamp when releasing
