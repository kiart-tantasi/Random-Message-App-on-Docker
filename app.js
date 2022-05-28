const express = require("express");
const app = express();

const fs = require('fs');
fs.writeFile('resources/files/something.txt', 'this is something', err => {
    if (err) {
        console.error(err);
    }
});

app.get("/", (req, res)  => {
    res.json({message: "HELLO"});
});

app.get("/random", (req, res)  => {
    const array = [
        "Hello World",
        "How are you",
        "Good Morning",
        "I am fine",
        "I am good",
    ];
    const randomNumber = Math.floor(Math.random() * array.length);
    res.json({message: array[randomNumber]});
});

const port = process.env.PORT || 8080;
app.listen(port, () => console.log("RUNNING ON PORT", port));
