require 'logger'
require 'fileutils'

module RubyParser
  class LoggerManager
    class << self
      # Читання логера
      attr_reader :logger

      # Ініціалізація логера
      def initialize_logger(config)
        # Якщо логер вже ініціалізований, не робимо нічого
        return if @logger

        # Створення директорії для логів, якщо вона не існує
        FileUtils.mkdir_p(config['directory']) unless Dir.exist?(config['directory'])

        # Налаштування рівня логування
        level = case config['level'].upcase
                when 'DEBUG' then Logger::DEBUG
                when 'INFO' then Logger::INFO
                when 'WARN' then Logger::WARN
                when 'ERROR' then Logger::ERROR
                else Logger::INFO
                end

        # Створення об'єкта Logger
        @logger = Logger.new(
          File.join(config['directory'], config['files']['application_log']),
          'daily' # Лог-файл буде створюватися кожен день
        )
        @logger.level = level

        # Додавання файлу для помилок
        @error_logger = Logger.new(
          File.join(config['directory'], config['files']['error_log']),
          'daily'
        )
        @error_logger.level = Logger::ERROR
      end

      # Логування обробленого файлу
      def log_processed_file(file_name)
        return unless @logger

        @logger.info("Файл оброблений: #{file_name}")
      end

      # Логування помилки
      def log_error(message)
        return unless @error_logger

        @error_logger.error(message)
      end
    end
  end
end
