Welcome to Hasher README This little file will guide you to setup the website on your local host.

## SETUP

**This project uses the latest ruby version at the moment, so Please be sure to update to _Version 2.6.3_**

- Click on **Clone or Download** link on this repo site and choose **SSH** option and copy the generated link.
- Now lets use that console command to clone this repo into your computer:

```bash
$ git clone git@github.com:DarkDante27/twitter_copycat.git
```

- Now lets move to the project's root path:

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

- Now we are ready to run the local server with:

```bash
$ rails s
```
**Now the Site is running and you can test it.**

## SETTING UP USERS

- Just to be sure that the Database is starting clean, please run this command:

```bash
$ rails db:drop db:create db:migrate
```

- First we are going to create a .ENV file on the root of the project to save our secrets so please run this command:

```bash
$ touch .env
```

- Now that the **.env** file has been created we are going to use it to put our gmail password and email and the mail host.
Now open the **.env** File and paste this code inside:

```ruby
export SENDMAIL_PASSWORD=please_type_your_gmail_password
export SENDMAIL_USERNAME=pleasetypeyourgmailaddress@gmail.com # or use your generated password from the link below.
export MAIL_HOST=localhost:3000
```

- :warning: **Now Read Carefully, We are using gmail for the user confirmation email, So that's why you need to put your gmail address and password**
**_If you are using double factor authentication on your gmail account, The app will not work.
You need to generate a special password for it so Please follow this link to create a unique password:_** :warning:

- Follow this link and log into your google account:

[Google Link:] (https://accounts.google.com/signin/v2/sl/pwd?service=accountsettings&passive=1209600&osid=1&continue=https%3A%2F%2Fmyaccount.google.com%2Fapppasswords&followup=https%3A%2F%2Fmyaccount.google.com%2Fapppasswords&rart=ANgoxce83uzzCpHhpweTYNKxPXBp1l_nIu-hmDslQ12iE5pV_5ydCW7pXqxUoEpxsqPYtxX_YR9OM3KIMm12eSUGEvq-_pLYSg&authuser=0&csig=AF-SEnYQ0KjvNjiox2Ge%3A1530278834&flowName=GlifWebSignIn&flowEntry=ServiceLogin)

- After you login you have to click on **SELECT APP** and then choose **MAIL**
Now click on **MAC** and lastly click on **GENERATE**

- Now paste that password on the **.env** instead of your regular password. **_Remember you can use your regular password if you
dont have Double factor activated on your account. but if you have any problem please generate the password._**

## CREATING USERS

- In order to fill the site with fake users to test, Please run this command:

```bash
$ rails db:seed
```

- Of course if you have different emails you can register your own emails and log in.

## GRAPHQL QUERIES

- I Implemented 1 API for this site at the moment, You can access the graphql interface by going to this link when your server is running:

[LOCAL HOST] (http://localhost:3000/graphiql)

- Now on the inteface you can run this query:

```graphql
{
  users {
    username
    id
    email
    bio
  }
}
```

-This should return a list of all the users with their emails, usernames, bios, and Id's.

- **_In order to see the data with Graphql you should be logged in._**
