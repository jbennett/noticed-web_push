# Noticed::WebPush

## 🎉 Web Push Notifications for your Ruby on Rails app.

## 🎬 Screencast

**todo**

## 🚀 Installation

Run the following commands to add Noticed-WebPush to your Gemfile and install the engine.

```bash
bundle add noticed-web_push --github jbennett/noticed-web_push

rails g noticed:web_push:install
rails noticed_web_push:install:migrations
rails db:migrate
```

Generate and save encryption keys. Do this for all your environments.

```bash
rails g noticed:web_push:vapid_keys
rails credentials:edit
```

## 📝 Usage

Add the `web_push` delivery method to your existing notifications

```ruby
class NewPostNotification < Noticed::Base
  deliver_by :database
  deliver_by :web_push, data_method: :web_push_data

  param :post

  def post
    params[:post]
  end

  def web_push_data
    {
      title: "New post: #{post.title}",
      body: post.content.truncate(40),
      url: post_url(post),
    }
  end
end
```

## How it works

**add details about service_worker paths etc and how the manifest etc are special**


## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
