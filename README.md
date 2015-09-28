# ruby-progressbar-twoline

This is a monkeypatch for the [ruby-progressbar gem](https://github.com/jfelchner/ruby-progressbar), allowing you to create a progress bar with information displayed over two lines rather than just one.

The modified `ProgressBar` class can be used in exactly the same manner as before, with the added benefit of allowing a newline in the [format string](https://github.com/jfelchner/ruby-progressbar/wiki/Formatting). The progress bar must be contained on the first line.

## Example

```ruby
require_relative 'ruby-progressbar-twoline'

progressbar = ProgressBarTwoLine.create(
  format: "%t %b%i\n%a %E Processed: %c of %C, %P%",
  remainder_mark: '･',
)
```

Produces:

```
Progress ==･･････････････････････････････････････････････････････
Time: 00:00:04  ETA: 00:01:42 Processed: 2 of 100,  2.00%
```

And behaves correctly when other information is logged using `progressbar.log()`:

```
Processing: file01.txt
Processing: file02.txt
Progress ==･･････････････････････････････････････････････････････
Time: 00:00:04  ETA: 00:01:42 Processed: 2 of 100,  2.00%
```