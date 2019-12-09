# frozen_string_literal: true

Before do
  driver.start_driver
end

# gera evidencia da ultima tela. Utilizar FileUtils.mkdir_p para macOS e FileUtils.mkdir para Windows
After do |scenario|
  sufix = ("failed" if scenario.failed?) || "passed"
  name = scenario.name.tr(" ", "_").downcase
  platform = ENV['PLATFORM']
  if scenario.failed?
    unless File.directory?("screenshots/failed")
      FileUtils.mkdir_p("screenshots/failed")
    end
    screenshot_name = "#{platform}_#{name}_#{Time.now.strftime("%d-%m-%Y_%H.%M.%S")}.png"
    screenshot_file = File.join("screenshots/failed", screenshot_name)
    driver.screenshot(screenshot_file)
    embed("#{screenshot_file}", "image/png")
  elsif scenario.passed?
    unless File.directory?("screenshots/passed")
      FileUtils.mkdir_p("screenshots/passed")
    end
    screenshot_name = "#{platform}_#{name}_#{Time.now.strftime("%d-%m-%Y_%H.%M.%S")}.png"
    screenshot_file = File.join("screenshots/passed", screenshot_name)
    driver.screenshot(screenshot_file)
    embed("#{screenshot_file}", "image/png")
  end
  driver.driver_quit
end

# gera relatorio em .html na pasta raiz
at_exit do
  platform = ENV['PLATFORM']
  time = Time.now.strftime("%d/%m/%Y - %H:%M:%S")
  ReportBuilder.configure do |config|
    config.json_path = "report.json"
    config.report_path = "report - automacao cadastro de clientes"
    config.report_types = [:html]
    config.report_tabs = %w[Overview Features Scenarios Errors]
    config.report_title = "Report - Automacao Cadastro de Clientes"
    config.compress_images = false
    config.additional_info = { "Project" => "Cadastro de Clientes", "Platform" => "#{platform}", "Report generated" => time }
  end
  ReportBuilder.build_report
end
