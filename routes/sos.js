var express = require("express");
var router = express.Router();
var db = require("../database/connection.js");
const admin = require('firebase-admin')

let serviceAccount = require('../auth/fbAuth.json');

const { initializeApp } = require('firebase-admin/app');
initializeApp({
  credential: admin.credential.cert(serviceAccount)
});

router.post("/", (req, res) => {
  var reqs = [];
  if (!req.body.location) reqs.push("location");
  if (!req.body.patient_id) reqs.push("patient_id");
  if (reqs.length) {
    res.status(400).json({
      status: 400,
      message: "No " + reqs.join(", ") + " specified.",
    });
    return;
  }

  var sql = "insert into sos (location, patient_id) values (?, ?)";
  var datas = [req.body.location, req.body.patient_id];
  db.query(sql, datas, function (err, result) {
    if (err) {
      res.status(400).json({
        status: 400,
        message: "MySQL error: " + err.message,
      });
      return;
    }

    var newSosId = result.insertId;
    res.status(200).json({
      status: 200,
      message: "Succeeded!",
      data: {
        sos_id: newSosId
      },
    });

    // Send push notification
    // The topic name can be optionally prefixed with "/topics/".
    const topic = "SOS";

    const message = {
      data: {
        sos_id: String(newSosId)
      },
      topic: topic,
    };

    // Send a message to devices subscribed to the provided topic.
    admin.messaging()
      .send(message)
      .then((response) => {
        // Response is a message ID string.
        console.log("Successfully sent sos message:", response);
      })
      .catch((error) => {
        console.log("Error sending sos message:", error);
      });
  });
  return;
});

router.get("/:sos_id/location", (req, res) => {
  res.send(req.params);
});

module.exports = router;
