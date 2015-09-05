# PayrolleeMate Ruby - setup

## Rspec Installation

### Terminal View/Tool windows/Terminal (Alt-F12)

    $ sudo gem install rspec
    $ rspec —init
    $ sudo gem install rspec-core

### And then add to PayrolleeMate.gemspec:

    spec.add_development_dependency "rspec"
    spec.add_development_dependency "rspec-expectations"

### And then run
 
    bundler install --binstubs

