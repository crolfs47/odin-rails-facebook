# odin-rails-facebook
## The Odin Project - Building Facebook

Project completed as part of The Odin Project. Build an application similar to Facebook.

## Features:
 - Users 
    - Users can register and login via Devise
    - Users have a profile page that shows their personal information, posts, friends, and events
    - Users can edit their personal information and upload a profile picture using Active Storage
    - Users can view all other users profile pages
 - Friendships
    - Users can send and accept friend requests
    - Users can decline friend requests, cancel requests, and unfriend other users
    - Friendships can be accessed via the Discover Users page, a user's profile page, or the notifications page
 - Posts
    - Users can create posts and edit or delete their own posts
    - Post display post content, the author, comments, and likes
 - Comments: users can comment on posts and delete their comments
 - Likes: users can like and unlike posts
 - Notifications
    - Users get a notification when someone sends them a friend request
    - Users get a notification when a friend comments or likes one of their posts
    - When a user has a notification, the bell icon becomes a solid white icon, it is just an outlined icon when they do not have any notifications
    - The user can hover over the bell to see how many unread notifications they have and navigate to the notifications page
    - The notifications page displays all unread and read notifications
    - When a user clicks on an unread notification it becomes a read notification
 - Events
    - Users can create events and delete events they've created
    - Users can rsvp to attend events, or remove their rsvp to no longer attend the event
    - Events index page shows all events, sorted by upcoming vs past events
    - A user's profile page shows all events they've rsvped to attend
 - Timeline: the main page is a timeline that shows recent posts of the current user and posts of the users they are friends with
 - Discover Users page: lists all users adn has a button for sending/accepting friend requests depending on their friendship status
 - Tested with RSpec and Capybara with 97% code coverage
 - Seeded the database with users based on house plants including attaching a profile image for each one

## Languages/Technologies used:
 - Rails 
 - Ruby
 - PostgreSQL
 - CSS - Bulma
 - VS Code
 - Git/Github
 - Deployed on Fly.io using volumes for persistent storage
 - Devise gem for user registration and authentication
 - Rspec and Capybara for testing
 - Turbo Frames for editing posts and editing a user's profile
 - Active Storage for uploading profile images

## What I learned:
 - How to use Turbo Frames to create the experience of a single page application and help with faster navigation 
 - How to use Active storage to allow users to upload profile images
 - Better understanding of the MVC - Model-View-Controller pattern and routes, especially with multiple controllers/views interacting with each other and utilizing nested resources
    - How to send a user notifications after certain actions, and mark notifications as read
    - How to implement adding friends and the friendship status on multiple pages
 - More complex Active Record associations and querying
    - The friendship model was challenging to implement with friend requests and accepting the request - had to figure out how to query sent vs. received friendships, accepted vs. pending friendships, and how to find a user's friendships depending on whether they were the requestor or requestee
    - Creating the notifications model with a polymorphic association belonging to friendships, comments, and likes
    - Creating the events and rsvps models with many-to-many association (has_many :through)
 - Better understanding of how to use Rspec and Capybara for testing in Rails
 - How to deploy using Fly.io and use volumes for persistent storage with images
 
## Still can improve:
 - Add additional features: allow comments to be edited, let users see who liked a post and not just the like count, let posts allow images
 - Add javascript for navbar burger, modal overlay for new events form, tabbed browsing on user profile page
 - User interface, mobile compatibility - was mostly focused on functionality for this application

Assignment - https://www.theodinproject.com/lessons/ruby-on-rails-rails-final-project

View Project - https://fakebookcr.fly.dev/ (can login with guest account if you don't want to register - Email: guest@test.com, Password: password)

## Screenshots:
Login:
![f](https://user-images.githubusercontent.com/97067689/229606815-2245b71e-71ae-42e9-a834-683eb718daaf.png)

Newsfeed:
![f](https://user-images.githubusercontent.com/97067689/229607130-39e7ad80-d422-4d87-8bb8-a1c5dfd47deb.png)

Discover Users:
![f](https://user-images.githubusercontent.com/97067689/229607259-7134bcba-2c35-4fb1-a602-c9c516bdedd4.png)

Notifications:
![f](https://user-images.githubusercontent.com/97067689/229607843-c0b6dd01-c494-450b-bd18-42540c283b10.png)

User Profile - Posts:
![f](https://user-images.githubusercontent.com/97067689/229607409-5347f7f9-0b71-408f-815d-db370414baa8.png)

User Profile - Friends:
![f](https://user-images.githubusercontent.com/97067689/229607555-cd514c19-c659-4af7-853d-be6ca03870d5.png)

Edit User Profile:
![f](https://user-images.githubusercontent.com/97067689/229607715-1f505040-fde7-4590-a80d-c652c086309c.png)

Edit Post:
![f](https://user-images.githubusercontent.com/97067689/229608021-ffa7a6cc-2a1a-4f2c-b358-b19573f40085.png)


