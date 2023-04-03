# odin-rails-facebook
## The Odin Project - Building Facebook

Project completed as part of The Odin Project. Build an application similar to Facebook.

## Features:
 - Users 
    - Users can register and login via Devise
    - Users have a profile page that shows their personal information, posts, and friends
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
 - Better understanding of how to use Rspec and Capybara for testing in Rails
 - How to deploy using Fly.io and use volumes for persistent storage with images
 
## Still can improve:
 - Add additional features: allow comments to be edited, let users see who liked a post and not just the like count, let posts allow images
 - Use turbo frames for more parts of the app (likes, adding friends)
 - User interface, mobile compatibility - was mostly focused on functionality for this application

Assignment - https://www.theodinproject.com/lessons/ruby-on-rails-rails-final-project

View Project - https://fakebookcr.fly.dev/ (can login with guest account if you don't want to register - Email: guest@test.com, Password: password)

## Screenshots: