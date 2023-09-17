# Missing Link

### Challenge
**Enjoy this quote of the day**

Not much to go on here... 

The link takes you to a page that shows you a quote of the day. Inspecting the URL, we see a date. If we change the date, we get a different quote. Maybe that's the key to solving this challenge? 

In fact, if you keep trying different dates, you will eventually get the flag instead of a quote. This challenge requires persistence to keep trying dates until you get the flag. You may want to employ a binary search strategy. Try a date one month in the past and if you get a quote, try an additional month in the past. When you have established the valid range, narrow your search. Of course this strategy assumes you know or suspect that the flag is on the first valid date.