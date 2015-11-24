class WelcomeController < ApplicationController
	Pusher['test_channel'].trigger('greet', {
  :greeting => "Hello there!"
})
end
