# Project Overview

## Project Links

- [Front_end_Link](https://github.com/drewculhane/capstone_final_frontend-)
198 commits.... insane. 
- [Back_end_Heroku](https://git.heroku.com/test-dreamway-1234.herokuapp.com/)
- [subdomain_server_at_Squarespace](https://www.thedreamway.space/)
- [Auberdine_Animation](https://github.com/drewculhane/Auberdine-Animation-)
## Project Description

The Dreamway is a free resource for Night Elf Druid players of the game World of Warcraft. It comes complete with a forum for asking each other questions, a Profile setting where a user can choose an avatar, a specialization, and game server details. Aside from the forum, there also lots of resources for getting started as a night elf druid in world of warcraft, including talent trees for the druid class, an adventure guide, and more! 

## API

I have chosen Ruby on Rails as a server for API data because of how seamlessly bcrypt can digest password data. The Ruby app is actually not an api only app, it is a user auth connected to a database of posts, and comments, where all a users' are associated with herself or himself. It took a while to build out the backend. 

SESSION CONTROLLER: 

```
{data: {class SessionsController < ApplicationController 
    include CurrentUserConcern 
def create
    user = User.find_by(email: params["user"]["email"])
    .try(:authenticate, params["user"]["password"])
    if user 
        session[:user_id] = user.id 
        render json: {
            status: :created, 
            logged_in: true, 
            user: user 
        }
    else 
     render json: { status: 401 }
    end 
end 

def logged_in 
  if @current_user
    render json: {
        logged_in: true, 
        user: @current_user 
    }
    else
    render json: {
        logged_in: false 
    } 
    end 
end 

def logout 
    reset_session 
    render json: { status: 200, logged_out: true }
end 

end } }
```


## Wireframes

Upload images of wireframe to cloudinary and add the link here with a description of the specific wireframe. Also, define the the React components and the architectural design of your app. Here it is: 

- [First Draft](https://res.cloudinary.com/dgmpgmo60/image/upload/v1597111987/Untitled_3_xwiiff.jpg)
- [Wireframes and React architecture rough sketch](https://docs.google.com/presentation/d/14bTXqfF_ZctrxEjwUjeEoK7tPUh4erwvFlkRGOBPXGY/edit?usp=sharing)


### MVP/PostMVP - 5min

As of project week, database is already built, react skeleton mostly complete. 

MVP:
- Dashboard personalization and profile edit options. MET 
-Forum allows posting, editing and deleting only when logged in. MET 
-Dreamway Home provides basic starter information in getting started, and embedded talent trees. MET 
-Media Queries and style minimums that are acceptable. Commercially. Not Andrew Culhane perfectonist minmimum. Chill minimum. MET (SORTA ) 

Post MVP: 
-Provide info on pre -lvl 20 class quests DONE 
-Provide several options for an avatar. DONE 
-Sharpen up styling and media queries because you know it's never going to be "done" NOT QUITE DONE 


## Timelines
##### Writing out your components and its descriptions isn't a required part of the proposal but can be helpful.

Timelines. Note that MVP times INCLUDE staging time expectation. i.e. before a forum can meet its MVP, it first has to be built. 


| Component | Priority | Estimated Time | Time Invetsted | Actual Time |
| --- | :---: |  :---: | :---: | :---: |
| Dashboard personalization and profile edit options| H | 5hrs| | 10 hours |
| Deploying cookies on Heroku| H | 5hrs| | 12 hours |
| Forum allows posting, editing and deleting only when logged in.| H | 10hrs| 10 hours |  |
| Dreamway Home provides basic starter information in getting started, and embedded talent trees.| H | 10hrs| 5 hours  |  |
| Media Queries and style minimums that are acceptable. | H | 12hrs| 6hrs  |  |
| Total | H | 42hrs | 43 hours |

## Additional Libraries
 -Axios
 -Bcrypt
 -React 
 -Boostrap 
 -Wowhead Embed script 

## Code Snippet

The greater functionality is ginormous, but basically this is a state/display ternary based system which lets a user pick an avatar, which is then updated both in state, and in the PUT request to update user information. 

```
function reverse(string) {
	<img className="choice-width-det"
            style={ avatarImg == props.spotlight ? {border: "2px solid green"} : {border: "none"}}
            onClick={handleAvatar}
            src={avatarImg} alt="Elf Avatar" 
            />
}
```
