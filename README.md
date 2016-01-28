# EventSystem

---
### Build status
[![Build status](https://ci.appveyor.com/api/projects/status/phjy4o6pc13gkapr?svg=true)](https://ci.appveyor.com/project/georgimanov/eventsystem)
---

## Team Members
* shunobaka
* vesheff
* georgimanov

----------
## Events have
- Description:
	- Start Date
	- Date Created
	- Category
	- Description
	- Image 
		- default image if none is provided
		- image can be uploaded
- Participants 
	- list of users that have joined the event
- Comments 
	- created by users
	- stored with current date (DateTime.Now)
	- Listed with UserName/Date/Content
- Likes 
	- every user that is authorized can rate the event
	- this is a custom control

## Public part (accessible without authentication)
- Home page
	- includes caching
	- control that handles caching for 10 minutes for the statistics
	- displays top 5 categories ordered by events.count()
	- displays top 5 events ordered by up-coming event and then by comments.count() 
	- drag(able) functionality for the panels
- User log in and user registration forms

## Private part (available for registered users)
- All events page
	- lists all events
	- has search by event title 
- Create event page
	- can create new event
- View event details page
	- comments
	- write comments for events
	- participants
	- user can like (can view total like counts)
	- take part in events (Join event)
- View events by category
	- displays all events for the current directory
- View events by title search
	- displays all events for the current search query
- User profile page
	- edit profile (change password)

## Administrative part (available for administrators only)
- admin can make other users administrators
- create / edit / delete events and comments
- create / edit / delete events and category

## Controls used
- Like control - used in event details
- Stats control - used on home page
- Mind your language - not implemented but can be seen on
	- http://localhost:65402/ControlsTestingPage.aspx.cs