require "cucumber/js_console_errors/version"

module Cucumber
  module JsConsoleErrors

  def self.inject_script
    return '' unless ::Rails.env == 'test'

    <<-EOF
    <script type="text/javascript">

        window.onerror = function(message, url, linenumber) {

          // We want to avoid a dependency on jQuery or any other library in case
          // the error we are capturing is due to those libraries blowing up
          var escapeHtml = function (str) {
            return String(str)
              .replace(/&/g, "&amp;")
              .replace(/</g, "&lt;")
              .replace(/>/g, "&gt;")
              .replace(/"/g, "&quot;")
              .replace(/'/g, "&#039;")
              .replace(/\\//g, "&#x2F;");
          };

          var errorReport = '*** JavaScript Console Error: ' + message +
            ' on line ' + linenumber + ' for ' + url + ' (error location may' +
            ' be in a different file/linenumber if the test environment is' +
            ' running minified Javascript) ***';

          var elemDiv = document.createElement('div');
          elemDiv.className = 'debug-captured-javascript-console-errors';
          elemDiv.innerHTML = escapeHtml(errorReport);

          // The body may not be defined yet
          if (document.body) {
            document.body.appendChild(elemDiv);
          } else {
            window.onload = function() {
              document.body.appendChild(elemDiv);
            };
          }
        };

    </script>
    EOF

  end

  end
end
