module WaitForAjax
  def wait_for_ajax
    Timeout.timeout(Capybara.default_max_wait_time) do
      loop until finished_all_ajax_requests?
    end
  end

  def finished_all_ajax_requests?
    jquery_active = page.evaluate_script('jQuery.active')

    (jquery_active.blank? || jquery_active.zero?)
  end
end
