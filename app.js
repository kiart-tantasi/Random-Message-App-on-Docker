const express = require("express");
const app = express();
const fs = require('fs');

const dir = "resources/files/note.txt";

app.get("/", (req, res)  => {
    fs.appendFile(dir, "Hello World !" + "\n", err => {
        if (err) {
            console.error(err);
            res.sendStatus(500);
        } else {
            res.json({message: "Hello World !"});
        }
    });
});

app.get("/read", (req, res) => {
    fs.readFile(dir, "utf-8", (err, data) => {
        if (err) {
            res.sendStatus(500);
        } else {
            res.json(data);
        }
    })
} );

app.get("/random", (req, res)  => {
    const array = [
        "Hello World",
        "How are you",
        "Good Morning",
        "I am fine",
        "I am good",
        "See You !"
    ];
    const randomNumber = Math.floor(Math.random() * array.length);
    const word = array[randomNumber];

    return fs.appendFile(dir, word + "\n", err => {
        if (err) {
            console.error(err);
            res.sendStatus(500);
        } else {
            res.json({message: word});
        } 
    });
});

app.get("/delete", (req, res) => {
    fs.unlink(dir, err => {
        if (err) {
            console.error(err);
            res.sendStatus(500);
        } else {
            res.sendStatus(200);
        } 
    });
});

const port = process.env.PORT || 4000;
app.listen(port, () => console.log("RUNNING ON PORT", port));
