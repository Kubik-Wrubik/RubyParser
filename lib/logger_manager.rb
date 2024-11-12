require 'yaml'
require 'logger'
require 'fileutils'

module RubyParser
  class LoggerManager
    class << self
      attr_reader :logger

      # Завантаження конфігурації з YAML-файлу
      def load_config(file_path)
        YAML.load_file(file_path)
      end

      # Ініціалізація логера
      def initialize_logger(config)
        return if @logger

        FileUtils.mkdir_p(config['directory']) unless Dir.exist?(config['directory'])

        level = case config['level'].upcase
                when 'DEBUG' then Logger::DEBUG
                when 'INFO' then Logger::INFO
                when 'WARN' then Logger::WARN
                when 'ERROR' then Logger::ERROR
                else Logger::INFO
                end

        @logger = Logger.new(File.join(config['directory'], config['files']['application_log']), 'daily')
        @logger.level = level

        @error_logger = Logger.new(File.join(config['directory'], config['files']['error_log']), 'daily')
        @error_logger.level = Logger::ERROR
      end

      def log_processed_file(file_name)
        return unless @logger
        @logger.info("Файл оброблений: #{file_name}")
      end

      def log_error(message)
        return unless @error_logger
        @error_logger.error(message)
      end
    end
  end
end
