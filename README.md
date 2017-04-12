Kiba Common is a companion gem to [Kiba](https://github.com/thbar/kiba) and [Kiba Pro](https://github.com/thbar/kiba/blob/master/Pro-Changes.md) in which I'll share commonly used helpers.

Please consider it a work-in-progress for the time being.

In particular, review the changes when updating, until a proper release is ready.

## Usage

**Do not try to use a gem version**. While the name has been [reserved](https://rubygems.org/gems/kiba-common), the gem is not yet published for real. Use git master directly.

## Currently available

### Kiba::Common::DSLExtensions::Logger

A simple logging facility.

Usage:

```ruby
require 'kiba-common/dsl_extensions/logger'
extend Kiba::Common::DSLExtensions::Logger

pre_process do
  logger.info "pre_process is running!"
end
```

By default the logger will output to `STDOUT`.

You can customize that behaviour by setting the logger:

```ruby
require 'kiba-common/dsl_extensions/logger'
extend Kiba::Common::DSLExtensions::Logger

logger = Logger.new(xxx)
```

## Contributing & Legal

(agreement below borrowed from Sidekiq Legal)

By submitting a Pull Request, you disavow any rights or claims to any changes submitted to the Kiba Common project and assign the copyright of those changes to LoGeek SARL.

If you cannot or do not want to reassign those rights (your employment contract for your employer may not allow this), you should not submit a PR. Open an issue and someone else can do the work.

This is a legal way of saying "If you submit a PR to us, that code becomes ours". 99.9% of the time that's what you intend anyways; we hope it doesn't scare you away from contributing.