Capybara::Webkit.configure(&:block_unknown_urls)

Capybara.javascript_driver = :webkit
Capybara.server_port = 31_337

Capybara.always_include_port = true
