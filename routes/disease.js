var express = require('express');
var router = express.Router();
var db = require("../database/connection.js");

router.get('/', function(req, res) {
  var sql = "select id, title, subtitle from disease";
  var datas = [];
  if (req.query.id !== undefined)
    sql += " where id in (" + req.query.id + ")";
  console.log(sql);
  db.query(sql, datas, function (err, result) {
    if (err) {
      res.status(400).json({
        message: "MySQL error: " + err.message,
      });
      return;
    }
    res.status(200).json({
      diseases: result
    });
  });
});

router.get('/:disease_id', function (req, res) {
  var sql = "select title, subtitle, overview, content from disease inner join manual on disease.manual_id = manual.id where disease.id = ?";
  var datas = [req.params.disease_id];
  db.query(sql, datas, function (err, result) {
    if (err) {
      res.status(400).json({
        message: "MySQL error: " + err.message,
      });
      return;
    }
    res.status(200).json({
      title: result[0].title,
      subtitle: result[0].subtitle,
      overview: result[0].overview,
      manual: JSON.parse(result[0].content)
    });
  });
});

router.get('/:disease_id/manual', function (req, res) {
  var sql = "select content from disease inner join manual on disease.manual_id = manual.id where disease.id = ?";
  var datas = [req.params.disease_id];
  db.query(sql, datas, function (err, result) {
    if (err) {
      res.status(400).json({
        message: "MySQL error: " + err.message,
      });
      return;
    }
    res.status(200).json({
      manual: JSON.parse(result[0].content)
    });
  });
});

module.exports = router;
