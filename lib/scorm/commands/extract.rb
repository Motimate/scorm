module Scorm::Command
  class Extract < Base
    def index
      package = begin
        args.shift.strip
      rescue StandardError
        raise(CommandFailed, "Invalid package.")
      end

      Scorm::Package.open(package, :cleanup => false) do |pkg|
        display "Extracted package to #{pkg.path}"
      end
    end
  end
end
