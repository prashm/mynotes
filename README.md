**mynotes** is a tiny rails 4 app for writing and saving notes that can be accessed from anywhere. Uses faye gem for pushing notes to any open browser window.

## Installation

You require ruby 1.9.3 or higher

`rvm install ruby`

`bundle install`

`rake db:migrate`

## Running

`rails s`

open localhost:3000 in chrome. Create account. Write text and save.
open another browser. Sign-in. You should see the saved text.

## Notes update without refresh on another window

Launch faye server on a separate terminal.

`rackup faye.ru -s thin -E production`

open localhost:3000 in chrome. Sign-in to account. 
open localhost:3000 in FF. Sign-in to account. 
Write text via chrome window and save.
You should see the saved text appear in the firefox window.

