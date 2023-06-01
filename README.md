WELCOME TO BATTLESHIP!

## Allen:
1. Iteration 3 did not provide an interaction pattern. How did you approach designing this iteration? If you did not get to Iteration 3, reflect on how you think you would’ve approached the design and problem solving process.

Iteration 3 was tricky because we were not able to write RSpec tests for a majority of the game class.  Instead we used a runner.rb file and SimpleCov to test program integration.  We wrote code in a linear fashion and then implemented the runner file, identified "bugs", then fixed the code accordingly.  

## Garrett:

Even though Iteration 3 didn't provide an interaction pattern, it did give us a relative blueprint of what methods to write and an informal order of complexity (menu, turns, endgame, etc.) As Allen mentioned, we then ran the game until it broke, took notes, returned to code. Wash, rinse, repeat. Once we were able to complete an entire game we began to work on edgecasing and looking for ways to break the game to make our code more inclusive and "stronger".


## Allen:

2. If you had one more day to work on this project, what would you work on?

In order to complete iteration 4 we would have a major refactor.  For instance, we hard coded the number of ships by making them attributes in the game class, so the game will only be instantiated with a set number of ships.  Therefore their names could not be changed, sizes could not be changed, and number of ships was static.  Also, the board size was static.  We could have instantiated the board cells as a range and allowed the user to input the number of cells (last number in the range), and this could have been one possible solution.  Otherwise, we could have created options for "easy", "medium", and "hard" and hard coded ships in a similar way.  However the user would not experience as much flexibility. 

## Garrett: 

We would have definitely refactored our board class to be more dynamic and adaptable for board sizes as well as changing up our ships class to allow for greater adaptability for ship length to ship name. This wasn't central to functionality but at one point Allen had sound in our module that allowed the puts statements to be read aloud and it was amazing. Then it broke just minutes before turning it in so it had to be removed. It would be great to get that back.

## Allen: 

3. Describe the pairing techniques you used while working on this project.

We experimented with VS Code Live Share and resorted to just sharing screens on Zoom.  We basically used the ping-pong method and took turns driving and navigating.  All of the code was done together and there was no individual time where we divided up tasks and items to work on.  In my opinion, based on my personal work style and personality, this would have been a much more productive option.  Overall it was a good experience and showed the importance of communicating individual needs for future projects.

## Garrett: 

As Allen mentioned we used ping-pong method and took turns driving and navigating. A great use-case for Live Share while ping-ponging was have the navigator pseudo-code while the driver was writing tests and code, so a workflow could be established for methods and functionality.

## Allen:

4. Describe how feedback was shared over the course of this project.

Feedback was generally shared "on the fly" when it was appropriate.  The conversations were realistic and led to increased productivity overall.  We also utilized peer support and support from a mentor, as well as instructor check-in.

## Garrett

Feedback was shared in real time. We worked on problems together and reached out for help when we found moments of unproductive struggle.