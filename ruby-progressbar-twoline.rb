require 'ruby-progressbar'

class ProgressBar
  module Format
    class String < ::String
      # Redef
      def displayable_length
        gsub(ANSI_SGR_PATTERN, '').split("\n").first.length
      end
      # Redef
      def bar_molecule_placeholder_length
        @bar_molecule_placeholder_length ||= bar_molecules_on_first_line.size * 2
      end
      def bar_molecules_on_first_line
        @bar_molecules ||= molecules_on_first_line.select(&:bar_molecule?)
      end
      def molecules_on_first_line
        split("\n").first.molecules
      end
    end
  end
  module Outputs
    class Tty < Output
      # Redef
      def clear
        if @clear_required
          stream.print "\033[2K" # Erase line
          stream.print "\033[A"  # Move up
          stream.print "\033[2K" # Erase line
          @clear_required = false
        end
      end
    end
  end
  class Output
    alias_method :log_orig, :log
    alias_method :print_and_flush_orig, :print_and_flush
    def log(string)
      clear
      log_orig(string)
    end
    def print_and_flush
      clear
      print_and_flush_orig
      @clear_required = true
    end
  end
end
