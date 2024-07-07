# Vikanoid
A game written in BASIC for the unexpected VIC-20.
![screenshot](https://sdesros.ca/vic20/content/vicanoid-revised.png?v=34)

# About the game
The game was originally written around 1987 and was the last game I had written for the VIC-20. I had moved onto coding on TRS-80 CoCo 3.

This was an attempt to make a version of Arkanoid and starting off with the simple bouncing ball example program in the VIC-20 user guide.

# Instructions
* Get a highest score while trying to clear all 8 levels of the game on a continous loop.
* Move the paddle using cursor down for left, cursor right for right.
* Special blocks
  * "P" will award 500 points.
  * "E" will "explode" the surrouding blocks.
  * "F" will change the paddle to an up arrow.
    * Move the arrow using the same controls
    * Hitting "return" will fire a laser clearing all of the blocks on top and resume the game play as normal

There are two versions of the game: 
* `vicanoid-orig` contains the game as originally written.
* `vicanoid-revised` was reworked in 2021 with the following changes:
  * Paddle and physics reworked.  The ball's angle will alter when hitting the edge of the paddle
  * Reduces flickering
  * Fixes bug where occasionally clearing the board does not cause the game to proceed.
  * Adds 3 lives on clearing the board (max 9)
  * Hitting "1-8" on the title screen will start the game at that level.

# How to build
This repository includes a project in [CBM Prg Studio](http://www.ajordison.co.uk/) a windows IDE for various Commodore 8 bit computers.

# How to run
Either build or download the .prg file(s) to run in an emulator or load into a real VIC-20 via SDIEC or other means.

Game is also available to play or download on: https://sdesros.ca/vic20/?gamefile=vicanoid-revised
