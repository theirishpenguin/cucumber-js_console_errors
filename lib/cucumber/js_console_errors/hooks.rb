After('@javascript') do |scenario|

  if scenario.failed?
    # Capture and Javascript Console Errors
    errorDivSelector = '.debug-captured-javascript-console-errors'
    if page.has_selector?(errorDivSelector)
      page.all(errorDivSelector).each do |div|
        STDERR.puts div.text
      end
    end
  end
end

