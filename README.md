Welcome to Hasher! this README will guide you to setup the website on your local host.

# SETUP

**This project uses the latest ruby version at the moment, so Please be sure to update to _Version 2.6.3_**

- Click on **Clone or Download** link on this repo site and choose **SSH** option and copy the generated link.
- Now lets use that link to clone the repo using this console command:

```bash
$ git clone git@github.com:DarkDante27/twitter_copycat.git
```

- This created a folder with the repo, lets move to the project's root path:

```bash
$ cd twitter_copycat
```
- Now that we have the project locally we can install the gems we are using and other libraries using **yarn** and **bundle**.
Run this commands:

```bash
$ bundle
```
```bash
$ yarn
```

# ENVIRONMENT VARIABLES

- First we are going to create a .ENV file on the root of the project to save our secrets so please run this command:

```bash
$ touch .env
```

- **Please be sure you register on all the sites and get all the required variables otherwise the program will crash.**

## This is the list of variables need for the project to work:

## 1. Google's GMAIL SMTP Server

- :warning: **We are using gmail to send user confirmation emails, So that's why you need to put your gmail address and password.** **_If you are using double factor authentication on your gmail account, The app will not work.
You need to generate a special password for it so Please follow the link below to create a unique password:_** :warning:

- Follow this link and log into your google account:

- [Google Link](https://accounts.google.com/signin/v2/sl/pwd?service=accountsettings&passive=1209600&osid=1&continue=https%3A%2F%2Fmyaccount.google.com%2Fapppasswords&followup=https%3A%2F%2Fmyaccount.google.com%2Fapppasswords&rart=ANgoxce83uzzCpHhpweTYNKxPXBp1l_nIu-hmDslQ12iE5pV_5ydCW7pXqxUoEpxsqPYtxX_YR9OM3KIMm12eSUGEvq-_pLYSg&authuser=0&csig=AF-SEnYQ0KjvNjiox2Ge%3A1530278834&flowName=GlifWebSignIn&flowEntry=ServiceLogin)

- After you login you have to click on **SELECT APP** and then choose **MAIL**
Now click on **SELECT DEVICE** and choose **MAC**, lastly click on **GENERATE**

- Now paste that password on the **.env** instead of your regular password. **_Remember you can use your regular password if you dont have Double factor activated on your account. but if you have any problem please generate the password._**

## 2. Cloudinary's Image hosting service

- We are using cloudinary for image hosting, so we need to create an account.
Please follow the link below to register a new account.

- [Cloudinary Link](https://cloudinary.com/users/register/free)

- Once signed up, cloudinary will provide you a unique key that you can find in your dashboard and looks a like this: 

- **_CLOUDINARY_URL=cloudinary://298522699261255:Qa1ZfO4syfbOC-***********************8_**
- **Paste it in your .ENV file**

- **At the end this is how your .ENV file should look**:

```ruby
# your gmail account password or use your generated password from the link.
export SENDMAIL_PASSWORD=password
# must be a gmail account.
export SENDMAIL_USERNAME=gmailaddress@gmail.com
# the mail host.
export MAIL_HOST=localhost:3000
# your cloudinary variable
export CLOUDINARY_URL=cloudinary://298522699261255:Qa1ZfO4syfbOC-***********************8
```

# SETTING UP USERS

- Just to be sure that the Database is starting clean, please choose one of the next commands:

## Site without users:

- If you want to see the site totally empty run this command:

```bash
$ rails db:drop db:create db:migrate
```

## USING THE SEED

- if you want to add users, please run this command after running the command above to inject users:

```bash
$ rails db:seed
```

- :warning:**Everytime the seed file runs it performs cleaning, so it will delete all the existing users. you can change that by deleting _``User.destroy_all`` line on the seed file_**:warning:

- :warning:**Everytime you run the seed file it will also send emails to the fake email addresses so you may receive lots of failed emails to your own gmail account inbox, Just ignore and delete them.**:warning:

- **The seed file was programmed to create 35 users, with a set of provided profile pictures and covers, also 30 miniposts and 7 miniposts with pictures you will be able to see if you follow the created users.**

## Seed profile pictures

- **For the profile pictures im using _notarealhuman.com_ AI generated faces all credits to them**: 

- [Not a real human site](http://notarealhuman.com/)

# LAUNCH THE SERVER

- Now we are ready to run the local server. please run this command on the console:

```bash
$ rails s
```

- Please access the default server URI in your browser:

- [http://localhost:3000/](http://localhost:3000/)

# CREATING YOUR ACCOUNT

- In order to access the site you need to create your own account, you can't access the seed created user profiles.

- :warning:Please Register in the site with a real email and verify the link **ONLY IN THE COMPUTER**, This project is still in development so if you do it in your phone it will try to access **_LOCALHOST_** and you will not be able to verify the account.:warning:

- When you click on the verify link, you will be able to login with your password and email.

**Now the Site is running and you can test it.**

- If you encounter an error when opening local host please try restarting your server:

```bash
$ rails restart
```

# GRAPHQL QUERIES

- An API was implemented thanks to GRAPHQL at the moment, You can access the graphql interface by going to this link when your server is running:

- [http://localhost:3000/graphiql](http://localhost:3000/graphiql)

- Now on the inteface you can run some queries:

## Users

- Return a list of all the users with their emails, usernames, bios, and Id's:

```graphql
{
  users {
    id
    username
    email
    bio
    createdAt
  }
}
```

- Return a list of all users with their miniposts: 

```graphql
{
  users {
    id
    username
    email
    bio
    createdAt
    miniposts {
      id	
      content
      createdAt
    }
  }
}
```

- If you want to find a user by id use, this query:

```graphql
{
  user (id: 1) {
    id
    username
    email
    bio
    createdAt
  }
}
```

- If you want to see an specific user miniposts, use this query: 

```graphql
{
  user (id: 2) {
    id
    username
    email
    bio
    createdAt
    miniposts {
      id	
      content
      createdAt
    }
  }
}
```

## Miniposts

- Return a list of all miniposts: 

```graphql

{
  miniposts {
    id	
    content
    createdAt
    user {
      id
      username
    }	
  }
}
```

- Find a minipost by id: 

```graphql
{
  minipost (id: 1) {
    id	
    content
    createdAt
    user {
      id
      username
    }	
  }
}
```

- **_In order to see the data with Graphql you should be logged in_**

# TESTS 

- **At the moment 1 test was implemented and it was for the miniposts model to run the test please type this command:**

```bash
$ rails test models
```

- The output for a passed test is only 5 green dots.

# TROUBLESHOOTING 

- **At the moment only a few errors could happen only if the above setup is not done properly so please follow the steps below if you find one of those:**

## _attempt to write a readonly database_

- This error could happen if you are trying to acccess the site while running a migration, seeding, or performing a database drop, Please wait for the operation to finish and perform a server restart:

```bash
$ rails restart
```

## _Must supply cloud_name in tag or in configuration_

- This error could happen if you are missing the cloudinary environment variable, Please check the .env file for any typos or missing variables. after fixing the error please perform a server restart:

```bash
$ rails restart
```

# _You can't start your server_

- Could be possible that you can't start the server, if so please read the error and perform again a ``$ yarn`` or ``$ bundle`` in your console, after that please try to start your server again:

```bash
$ rails s
```

# _If you have any other problem_

- If problems persists, it could be you are missing some global gems, please follow this command to have the same basic setup (le wagon's setup): 

```bash
$ gem install rake bundler rspec rubocop rubocop-performance pry pry-byebug hub colored octokit
```

- Please if you have any question, contact me i will be happy to help.
