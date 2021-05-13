require "http"
require "webmock"

include WebMock::API

def setup
  WebMock.enable!

  stub_request(:get, "www.google.com").to_return(status: 200, body: "body")
end

def subject
  HTTP.get("http://www.google.com")
end

setup
puts subject

#  % ruby test.rb
# Traceback (most recent call last):
#         11: from test.rb:17:in `<main>'
#         10: from test.rb:13:in `subject'
#          9: from /Users/epaew/.rbenv/versions/2.7.1/lib/ruby/gems/2.7.0/gems/http-5.0.0/lib/http/chainable.rb:20:in `get'
#          8: from /Users/epaew/.rbenv/versions/2.7.1/lib/ruby/gems/2.7.0/gems/http-5.0.0/lib/http/chainable.rb:75:in `request'
#          7: from /Users/epaew/.rbenv/versions/2.7.1/lib/ruby/gems/2.7.0/gems/http-5.0.0/lib/http/client.rb:31:in `request'
#          6: from /Users/epaew/.rbenv/versions/2.7.1/lib/ruby/gems/2.7.0/gems/webmock-3.12.2/lib/webmock/http_lib_adapters/http_rb/client.rb:8:in `perform'
#          5: from /Users/epaew/.rbenv/versions/2.7.1/lib/ruby/gems/2.7.0/gems/webmock-3.12.2/lib/webmock/http_lib_adapters/http_rb/webmock.rb:10:in `exec'
#          4: from /Users/epaew/.rbenv/versions/2.7.1/lib/ruby/gems/2.7.0/gems/webmock-3.12.2/lib/webmock/http_lib_adapters/http_rb/webmock.rb:41:in `replay'
#          3: from /Users/epaew/.rbenv/versions/2.7.1/lib/ruby/gems/2.7.0/gems/webmock-3.12.2/lib/webmock/http_lib_adapters/http_rb/response.rb:32:in `from_webmock'
#          2: from /Users/epaew/.rbenv/versions/2.7.1/lib/ruby/gems/2.7.0/gems/webmock-3.12.2/lib/webmock/http_lib_adapters/http_rb/response.rb:32:in `new'
#          1: from /Users/epaew/.rbenv/versions/2.7.1/lib/ruby/gems/2.7.0/gems/http-5.0.0/lib/http/response.rb:46:in `initialize'
# /Users/r_maeda/.rbenv/versions/2.7.1/lib/ruby/gems/2.7.0/gems/http-5.0.0/lib/http/response.rb:46:in `fetch': key not found: :request (KeyError)
