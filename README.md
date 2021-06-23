# square_wave_generation assembly language
Initialize the Tmod register with count 1 in mode 2 and timer 0 in mode 1
Firstly start the counter 1 and keep incrementing A value . keep storing the counted value in any port for example p2.
Check the counted value and make sure that it doesn’t cross 10.
Once it reaches 10 then stop the counter 1 and start the timer.
Put TL0 value as 33H from the below calculations.
Wait till tf0 becomes 1. If it becomes 1 then it means that we waited for 0.5
msec
Then stop the timer and go back and compliment the p1.2 value and
continue the process.
