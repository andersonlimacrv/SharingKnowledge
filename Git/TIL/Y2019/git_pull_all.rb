# frozen_string_literal: true

module Git
  module TIL
    module Y2019
      class GitPullAll
        def reference
          <<~REFERENCE
            https://github.com/tatsuyaoiw/git-pull-all
          REFERENCE
        end
      end
    end
  end
end


=begin
#!/bin/sh
find . -type d -name .git -exec sh -c "cd \"{}\"/../ && pwd && git pull" \;
=end

=begin
#!/bin/sh
find . -type d -name .git -exec sh -c "cd \"{}\"/../ && pwd && git checkout master && git pull" \;
=end
