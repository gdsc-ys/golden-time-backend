var express = require("express");
var router = express.Router();
var db = require("../database/connection.js");
const admin = require("firebase-admin");

let serviceAccount = require("../auth/fbAuth.json");

const { initializeApp } = require("firebase-admin/app");
initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

router.post("/", (req, res) => {
  var reqs = [];
  if (!req.body.location) reqs.push("location");
  if (!req.body.user) reqs.push("user");
  if (reqs.length) {
    res.status(400).json({
      message: "No " + reqs.join(", ") + " specified.",
    });
    return;
  }

  if (typeof req.body.user !== "object") {
    res.status(400).json({
      message: "Parameter 'user' should be object.",
    });
    return;
  }

  var sql =
    "insert into users (name, birth_date, height, weight, blood_type, allergies, medications, medical_notes, diseases) values (?,?,?,?,?,?,?,?,?)";
  try {
    var usr = req.body.user;
    var datas = [
      usr.name,
      usr.birthDate,
      usr.height,
      usr.weight,
      usr.bloodType,
      usr.allergies,
      usr.medications,
      usr.medicalNotes,
      usr.diseases,
    ];
    db.query(sql, datas, function (err, result) {
      if (err) {
        res.status(400).json({
          message: "MySQL error: " + err.message,
        });
        return;
      }

      var newUserId = result.insertId;
      var sql = "insert into sos (patient_id, patient_location) values (?, ?)";
      var datas = [newUserId, req.body.location];
      db.query(sql, datas, function (err, result) {
        if (err) {
          res.status(400).json({
            message: "MySQL error: " + err.message,
          });
          return;
        }

        var newSosId = result.insertId;
        res.status(200).json({
          message: "Succeeded!",
          sosId: newSosId,
        });

        // Send push notification
        // The topic name can be optionally prefixed with "/topics/".
        const topic = "SOS";

        const message = {
          data: {
            sosId: String(newSosId),
          },
          topic: topic,
        };

        // Send a message to devices subscribed to the provided topic.
        admin
          .messaging()
          .send(message)
          .then((response) => {
            // Response is a message ID string.
            console.log("Successfully sent sos message:", response);
          })
          .catch((error) => {
            console.log("Error sending sos message:", error);
          });
      });
    });
  } catch (e) {
    res.status(400).json({
      message: "Error while parsing 'user'.",
    });
    return;
  }
  return;
});

router.get("/:sos_id", (req, res) => {
  var sql =
    "select patient_location, name, birth_date, height, weight, blood_type, allergies, medications, medical_notes, diseases from sos inner join users on sos.patient_id = users.id where sos.id = ?";
  var datas = [req.params.sos_id];
  db.query(sql, datas, function (err, result) {
    if (err) {
      res.status(400).json({
        message: "MySQL error: " + err.message,
      });
      return;
    }
    res.status(200).json({
      patient: {
        name: result[0].name,
        birthDate: result[0].birth_date,
        height: result[0].height,
        weight: result[0].weight,
        bloodType: result[0].blood_type,
        allergies: result[0].allergies,
        medications: result[0].medications,
        medicalNotes: result[0].medical_notes,
        diseases: result[0].diseases
      },
      location: result[0].patient_location
    });
  });
});

module.exports = router;
