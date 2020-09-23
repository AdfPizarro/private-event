# README

# Authentication in Rails

This project is to practice how to implement rails authentication using devise gem. It involves building an application where users who are members will be able to logn in, create a post in the application. The authors of the post will be displayed only if the user logged in as a member. Users who did not log in can only see the posts but not the authors.

## Features 
You can sign up into the app.
You can sign in into the app. 
You can create and edit posts.
Only logged in members will see posts and authours.

## How to Test the Project

Get a local copy of the file  clone with HTTPS 

```
https://github.com/AdfPizarro/members-only.git  
```
Install all the dependencies
```
bundle install
```

Migrate the database with the following command
```
bin/rake db:migrate
```

## Run the server

- Access the project folder by typing the command cd members-oly folder from your terminal
- Start rails server with the command rails server.
- In your brwoser, type http://localhost:3000/ to access the app.
- You can now sign in, sign up, create, and edit posts.

## Built With
- Ruby 
- Rails

## Authors

 **Adrian Flores Pizarro**
- Github: [@AdfPizarro](https://github.com/AdfPizarro)
- Twitter: [@AdfPizarro](https://twitter.com/adfpizarro)
- Linkedin: [adrian-flores-pizarro-73b62316a](https://www.linkedin.com/in/   adrian-flores-pizarro-73b62316a/)

##  Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/AdfPizarro/members-only/issues).

