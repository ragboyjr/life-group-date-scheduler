# Life Group Date Scheduler

This project is designed to be a simple utility for scheduling round robin dates between members of a life
group so that given a certain schedule and group of people, you can ensure that everyone goes on a date with
everyone else with no repeats.

## Project Features

### Users

- All users in the app can be seen

### The Scheduler

The scheduler is responsible for creating a group of users that belong in a schedule, takes a few inputs, and will output
a schedule of who should meet with who over the coming instances of the schedule.

For example:

Given the following users:
  - RJ
  - Jason
  - Tom
  - Garret
Given the a cadence of 2 weeks, and start on thursdays
When the scheduler runs
The following schedule is generated:
 - Week 1
   RJ x Jason
   Tom x Garret
 - Week 3
   RJ x Tom
   Jason x Garret
 - Week 5
   RJ x Garret
   Tom x Jason

Every member was setup to meet with the other.

### Schedule Groups

Schedules are defined for a group of users. A user can be apart of any other different schedules.

### Viewing and Interacting with Schedules

Each user can log in and view any of the schedules they are apart of and view previous dates setup within the schedule, the current date, and future dates/partners.

Each date can maintain state that shows if the user acknowledged if they went on the date or not. Each user can indepently change the state of the given date that THEY own.

### Notifications

Every user account may optionally setup an email address that they can accept reminders and notifications when a new schedule is generated or when it's the next time for their dates.

### Schedule Participation

The schedule can have a group page that shows who has been participating in their dates vs who has not.
