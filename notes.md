The Plan:
Follow the CFOS for the top 


Equation?
Measure deviation of each stat within the players considered. Normalize
them, and add them into one statistic. Percentage deviation gets weighted by 
the deviation in number of attempts. Try first with one season of data,
then with two. Then, start adding in players with estimated stats for
next season that might be a lot more different than last season.

Problems: doesn't consider rarity?
	How to weight the categories? % of players above the mean? But then
	this doesn't weight the rarity of that z-score. Weight by percent of
	players with that z-score or higher? But then that overweights the
	top, if lots of players have close scores.
	Can I use IQR?

Should I weight less for negative?

1. Trim the list down to players to be considered. Average lines w/
   different teams
2. Find out how to calculate deviation for a single stat
3. Find out how to normalize those deviations amongst each other (if not
   already)
4. Sum
5. Manually groom the list and repeat

Double-check: does this really show which categories are more valuable?
	Is there a way to incorporate the 13-player idea?
	Do sums on these scores

13 rounds, 13 players each
When to go for steals?
Typically don't go for them until your last turn before their O-Rank,
unless someone better falls down to you.

**Add an R function to calculate scores based on some estimated values
**Recalculate scores using only the nearby players in ranking


Each team is 13 players
	pg sg g sf pf f c c util util bn bn bn
	4 smalls, 4 bigs, 5 any
There are 12 teams
1. For each category, estimate what the number of contributing players
   in that category will be across the league.
2. For each category, estimate the number to hit to beat an average
   team.
   Note: Contributing players must be in the top 150~ players in general:
   no specialists - but what about breakout/rookie players? Consider
   those case-by-case in step 4: the overall analysis will be the same
3. For each roster, note who the possible contributors will be.
   Especially note injuries, trades, possible breakouts.
4. Categorize the categories into how rare they are: then grab the
   players who contribute to those in the most uncommon way. Also
   consider public opinion though: no need to draft too early.

FG% FT% 3PTM PTS REB AST ST BLK TO
Be sure to consider #makes/#attempts when considering percentages

First, only considering players over 20 MP. Try consolidating traded
players later to get a better picture. Also, we want to scrub this even
more to only get considerable players.
Total frame is 251 players.
Above 3rd Quartile is usually about 60 players.
Whiskers are at 3rd Quartile + 1.5 x IQR

How do I tell if a category is rare or not?
* Number of outliers?
* Try a violin plot or histogram

Perhaps I should value multiple contributions over a singular
contribution, where a contribution is defined as being above some
number.
## FG%
FGM:
Min.    1st Qu. Median  Mean   3rd Qu.  Max. 
1.000   3.400   4.400   4.581  5.550    10.100
FGA:
Min.    1st Qu. Median  Mean   3rd Qu.  Max. 
3.30    7.50    9.50    10.13  12.25    22.20
## FT%
FTM:
Min.    1st Qu. Median  Mean   3rd Qu.  Max. 
0.100   1.200   1.800   2.098  2.800    8.600
FTA:
Min.    1st Qu. Median  Mean   3rd Qu.  Max. 
0.300   1.650   2.400   2.737  3.500    10.200
## 3PTM
Min.    1st Qu. Median  Mean   3rd Qu.  Max. 
0.0000  0.0000  0.9000  0.8876 1.4000   3.5000
It takes 2.5 players at 1.4 each to equal 3.5(Stephen Curry)
What is the number to hit?
## PTS
Min.    1st Qu. Median  Mean   3rd Qu.  Max. 
4.20    8.80    11.40   12.15  14.70    28.70
## REB
Min.    1st Qu. Median  Mean   3rd Qu.  Max. 
1.000   2.800   4.200   4.963  6.450    18.000
## AST
Min.    1st Qu. Median  Mean   3rd Qu.  Max. 
0.300   1.300   2.300   2.842  3.700    11.100
## ST
Min.    1st Qu. Median  Mean   3rd Qu.  Max. 
0.0000  0.6000  0.8000  0.9112 1.1000   2.4000
## BLK
Min.    1st Qu. Median  Mean   3rd Qu.  Max. 
0.0000  0.2000  0.4000  0.5653 0.7000   3.0000
## TO
Min.    1st Qu. Median  Mean   3rd Qu.  Max. 
0.100   1.200   1.600   1.685  2.050    3.900 
