# Clipboard is a centralized point to shell out to each individual platform's
# clipboard, pasteboard, or whatever they decide to call it.
#
module Boom
  class Clipboard
    class << self
      
      # Public: copies a given Item's value to the clipboard. This method is
      # designed to handle multiple platforms.
      #
      # Returns nothing.
      def copy(item)
        if RUBY_PLATFORM =~ /darwin/
          `echo '#{item.value}' | tr -d "\n" | pbcopy`
        end

				if RUBY_PLATFORM =~ /x86_64-linux/
					`echo '#{item.value}' | tr -d "\n" | xclip -sel clip`
				end

        "Boom! We just copied #{item.value} to your clipboard."
      end

    end
  end
end
