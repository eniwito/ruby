require_relative "error"

module RemoveBg
  class Result
    attr_reader :data, :width, :height, :credits_charged

    def initialize(data:, width:, height:, credits_charged:)
      @data = data
      @width = width
      @height = height
      @credits_charged = credits_charged
    end

    def save(file_path, overwrite: false)
      if File.exist?(file_path) && !overwrite
        raise FileOverwriteError.new(file_path)
      end

      File.write(file_path, data)
    end
  end
end
