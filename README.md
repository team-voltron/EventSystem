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
	- Date
	- Place (Town/Club)
	- Short info
	- Image
- Users - list of users that will visit (have joined) the event
- Comments (created by users)
- Rating - every user (auth. user) can rate the event

## Public part (accessible without authentication)
- View events (w/o comments) 
- User login and user registration forms

## Private part (available for registered users)
- View events with comments
- View details for event
- Take part in events (Join event)
- Rate event (only once)
- Write comments for events
- User's profiles management functionality
	- edit profile
	- upload profile picture

## Administrative part (available for administrators only)
- create / edit / delete users and other administrators
- create / edit / delete events and comments
- remove users from events

### Optionally
- categories
- tags