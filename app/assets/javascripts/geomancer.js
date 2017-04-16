// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

var image_url = "https://s3.amazonaws.com/book-of-fate/images/";

$(document).ready(function(){

    geomancer = new Geomancer($('#results'), $('#times'));
    $("#roll").click(function(){
        geomancer.roll();       
    });
    $('#skip').click(function() {
        geomancer.skip();
    });
});


function Die(startFace, target) {
    this.face = startFace;
    this.target = target;
    this.maxRollTime = 250 * (1 + Math.random());

    this.getLink = function() {
        return image_url + 'die' + this.face + '.png';
    };

    this.getValue = function() {
        return this.face;
    };

    this.roll = function() {
        return this.shiftFace(50);
    };

    this.shiftFace = function(time) {
        this.face = (this.face + 1) % 4;
        this.target.attr('src', this.getLink());

        if (time < this.maxRollTime) {
            return this.shiftFace(time * 1.1);
        };

        return Promise.resolve(this.getValue());
    };

}

function Geomancer (results, rollCounter) {
    this.rolls = [];
    this.rollsLeft = 4;
    this.results = results;
    this.rollCounter = rollCounter;

    this.dice = [];
    for (var i = 0; i < 4; i++) {
        this.dice[i] = new Die(i + 1, $('#die' + (i + 1)));
    }

    this.roll = function() {
        if (this.rollsLeft > 0) {
            // update roll counter
            this.rollsLeft -= 1;
            this.rollCounter.text( this.rollsLeft);

            // compute roll
            var rolls = [];
            for(var i = 0; i < 4; i++) {
                rolls.push(Math.floor(Math.random() * 4) + 1);
            }
            this.rolls = this.rolls.concat(rolls);

            // update dice
            for (var i = 0; i < 4; i++) {
                this.dice[i].face = rolls[i];
                this.dice[i].target.attr('src', this.dice[i].getLink());
            }
            // update results section
            var html = [];
            html.push("<div class='roll-result'>");
            for(var i = 0; i < 4; i++) {
                html.push('<img src="'+ image_url + 'die' + rolls[i]  +'.png">');
            }
            html.push('</div>');
            this.results.append(html.join(""));
        }
        if (this.rollsLeft < 1) {
            location.href = './' + this.rolls.join("");
        }
    };

    this.skip = function() {
        this.rolls = [];
        for(var i = 0; i < 16; i++) {
            var randomnumber = Math.floor(Math.random() * 4) + 1;
            this.rolls.push(randomnumber);
        }
        location.href = './' + this.rolls.join("");
    };

    this.update = function() {

    };
    return this;
}