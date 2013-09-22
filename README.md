Crowd Rank
==========

The app aggregates user (submitted) and pundit (scraped off the web) power rankings for various sports.  I'm starting with the NFL as it's in season and has the easiest set of requirements (games only on the weekend; reasonable number of teams), but my goal is to incorporate Division I college football and basketball, allowing rankings over individual conferences as well as a 'Top 25' to work in tandem to create an overall composite ranking.  Users will also be able to join groups to isolate their rankings among friends, pundits, or everyone (UserGroup model).

Currently the app has essentially the bare minimum of functionality: you can see some week by week NFL rankings, and submit your own, which are aggregated into the appropriate weeks viewable via the lovely JS library Highcharts.  These acitivies are probably fairly bug-prone, and not safe (not much validation going on in Rails yet).  The app as it stands at [thecrowdrank.herokuapp.com](thecrowdrank.herokuapp.com) is basically a prototype in staging (I haven't publicized it to any potential users). All data is scraped.

Todos
-----
My long term goals (other than support for the six major US team sport leagues, which is a data integrity nighmare in and of itself) include whatever fun statistical stuff involving trends and ranker biases I can think of, but here's a list of my short term tasks

- Clean up the ranking interface. Make the drag and drop ranking page more intutive and cleaner. Numbers should appear next to each team that change dynamically.
- Clean up the charts displaying rankings over time.  30 teams at once should be possible for fun, but it should be easy to get other combinations of teams quickly (one division). 
- Implement the bulk of the UserGroup feature.  This will require rankings to be compiled together into composite rankings for each group.  Since that compiling of rankings every request won't scale for shit, create another model, probably something like CompositeRanking that has one composite ranking for each time period for each group, which is itself stored in the database.  Perhaps this is not stored in Postgres, and instead MongoDB or even memcached?  That could make static requests damn fast.  But something needs to happen here because generating the graph would be on the order of O(num_user_groups * num_rankings * num_time_periods). *** Composite rankings are now implemented, but they need to be appropriated calculated when a user submits a ranking (only rake tasks can currently calculate composites)
- Pursuant to the above step, perhaps when a ranking is made, use Resque to kick off a job that compiles the composite ranking and saves it to the db rather than doing it in a request. This is less essential as the write step (creating a new ranking), assuming the above is implemented would only be O(num_user_groups * num_rankings)
 - Implement some logical link-flow in the application.  Navigation is wanting.
- Schedule the NFL pundit scraping jobs on Heroku to run on Tuesday or Wednesday and write a bunch more of them (a dozen maybe)
- TESTS. RSpec is not getting any love.  Maybe also try to learn Jasmine?

Somewhat longer term:
- Get logos for teams (scrape them and use PIL to process)
- Figure out how to compile partial rankings into other partial rankings: Someone ranks the top 25, but they also rank the Big 10 conference - can (or should) those go into the same composite?  It'd be cool if they did.

General Stack
-----
Ruby 2.0.0
Rails 4.0.0
PostgreSQL 9.2 (might be moving to 9.3 on Heroku?)
jQuery