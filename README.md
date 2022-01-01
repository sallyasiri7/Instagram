
## Description

Instagram brings you closer to the community and the things you love and connects with friends by sharing photos that express your diary.. Create the photos you want to display on your profile. Learn more about your interests.. View your favorite photos and discover the community around the world.


## User Stories

- Signup : As a user I want to register account So that I can use the app.
- Login : As a user, I want to login to my account so that I can use my account on the app.
- Logout : As a user, I can log out so that no one else can come and use my account.
- Edit password: As a user, if I forgot my password, I can click I forgot my password and edit it.
- Homepage: As a user, I can browse photos of followers and give them likes and comments.
- Explores:  As a user, I can see community photos when exploring and I can search for the users I want.
- Add photos : As a user, I can add and edit photos, write under photos and add them to my personal account.
- notification : As a user I get notifications when they like my photos and my username appears when they follow my account.
- My profile : As a user on my profile, I put the content that I want to share on social media and I can see how many followers I follow and who I follow.



# tuwaiq-10-solo

| Component | Permissions | Behavior|
| ------ | ------ |------ |
| Login | anon only |  Registration form, link to login and link to forget password, go to the home page after registration.
|Signup | anon only | Registration form, link to login, go to the home page after registration
|Forgot password| User only | Enter the email, then verify and go to the home page.
| Homepage | User only |Photos of the users I follow like below the photo, I comment and tap the username through the photo and go to their profile page and browse for user photos.
| Explore |User only |It shows all photos of Instagram users whether I follow them or not, tap on the photo and then open the photo. I can comment and like the photo and hit the photo username and go to the profile page and browse their profile. And back to explore, I can search through the bar above, search for a specific user, and go to their page.
| Add photos page | User only | Pressing a button to add the desired images, then going to the photo effects and selecting it, then moving to write under the image, then pressing the next button and the image will go to the profile page and the home page.
|notification page| User only |Show the user like the picture and you can open the picture as well as open the name of the user and go to his page and also show the users who followed me.
|profile page| User only|My profile contains the profile picture, the number of pictures, the number of users who follow me, the number of users I follow, the pictures I have downloaded, I can open the picture and show likes and comments on one of the pictures.


## Models:

- User
- Post
- Comment
- Notification

## ViewModel

- AuthenticationViewModel
- PrfileHeaderViewModel
- UserCellViewModel
- PostViewModel
- CommentViewModel
- NotificationViewModel




## Views(Controllers):

- LoginController
- RegistrationController
- ResetPasswordController
- MainTabController
- FeedController
- SearchController
- ImageSelectorController
- NotificationsController
- ProfileController
- UploadPostController
- CommentController

## Services:

- ImageUploader
- AuthService
- UserService
- PostService
- CommentService
- NotificationService

## Localizable:

- Localizable(English)
- Localizable(Arabic)

## Links

## GitHub Rebo

https://github.com/sallyasiri7/tuwaiq-10-solo.git

## Slides :

## My presentation:
