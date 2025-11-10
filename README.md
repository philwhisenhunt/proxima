## Proxima
### Proxima is an album generator that shows one album a day.

Make sure you have the latest Ruby and Ruby on Rails installed via this guide:
https://guides.rubyonrails.org/install_ruby_on_rails.html

Check version with:
```
ruby --version
```
Ruby version should be:
`3.4.2`

If it's not, and you've used Mise as the guide suggested, you can run:
```
mise use -g ruby@3.4.2
```

Check rails version with:
```
 rails --version
```

Rails version should be:
 `8.0.3`

If it's not, you can install this version of Rails by running:
```
gem install rails --version=8.0.3
```

#### Adding links
To add spotify URIs you will need to make a spotify developer account and add your keys to the ENV file. **Setting this up is required for the migrations to run.**

setup ENV file:
from the project directory, run:
```bash
touch .env
```

Open up the .env file in your editor and add:
```
SPOTIFY_CLIENT_ID=xxx
SPOTIFY_CLIENT_SECRET=xxx
```
We will add the correct variables once your have a spotify app.

To set up a Spotify developer account, go here: [Spotify for Developers](https://developer.spotify.com/)
+ Login to your Spotify account, or create one.
+ In the upper right corner, click the dropdown with your username, then choose "Dashboard".
+ Review and accept the terms.
+ Click the button to create an app.
+ Give the app a name and description, provide a redirect URI (`https://developer.spotify.com/dashboard/create`), select the Web API, and accept the terms.
+ Copy the Cliend ID and Client Secret into your .env file.


#### Run migrations
```
rails db:migrate
```

#### Adding seed data
You can manually add albums, or use the built in seed data that pulls from a csv file:
```
rails db:seed
```

There is a rake task to add Spotify URIs to the seed data. It will take roughly 20 minutes to populate all 1000 albums:
```
bin/rake spotify:fetch_uris
```

#### Run the local server
```
bin/rails server
```
