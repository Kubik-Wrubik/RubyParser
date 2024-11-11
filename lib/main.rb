# Підключення модулів з основними класами
require_relative 'app_config_loader'
require_relative 'logger_manager'

module RubyParser
  class Main
    def run
      # 1. Завантаження бібліотек
      loader = RubyParser::AppConfigLoader.new
      loader.load_libs

      # 2. Завантаження конфігурацій
      config_data = loader.config('config/default_config.yaml', 'config/yaml_config')

      # 3. Перевірка завантаження конфігурацій
      puts 'Завантажені конфігураційні дані:'
      loader.pretty_print_config_data

      # 4. Логування
      logging_config = config_data['logging']
      LoggerManager.initialize_logger(logging_config)

      # Тестові повідомлення для перевірки логування
      LoggerManager.log_processed_file('test_file.yaml')
      LoggerManager.log_error('Це тестове повідомлення про помилку')
    end
  end
end

# Запуск програми
RubyParser::Main.new.run
