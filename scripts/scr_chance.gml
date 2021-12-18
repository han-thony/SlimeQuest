//Random script used for the random questions and some other stuff

var percent = argument[0];
percent = clamp(percent, 0, 1);

return random(1) < percent;
