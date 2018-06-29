module TaskServices
  class JsonFilesParse
    EXTENSION = '.json'.freeze

    def self.get_content(files_directory_path)
      new(files_directory_path).data_content
    end

    def initialize(files_directory_path)
       @path = files_directory_path
       @parsed_data = {}
    end

    def data_content
      Dir.glob("#{path}/*#{EXTENSION}") { |file|
        content_name = parse_filename(file)
        @parsed_data[content_name] = parse_content(file)
      }
      parsed_data
    end

    private

    attr_reader :path, :extension, :parsed_data

    def parse_filename(file)
      File.basename(file, EXTENSION)
    end

    def parse_content(file)
      JSON.parse(File.read(file))
    end
  end
end
