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

Check rails version with:
```
 rails --version
```

Rails version should be:
 `8.0.3`


#### Run the local server
```
bin/rails server
```

#### Adding seed data
You can manually add albums, or use the built in seed data that pulls from a csv file:
```
rails db:seed
```

#### Adding links
To add spotify uris you will need to make a spotify developer account and add your keys to the ENV file.

Once you add those, you run `bin/rake spotify:fetch_uris` to add uris to the seed data. It will take roughly 20 minutes to populate all 1000 albums.

