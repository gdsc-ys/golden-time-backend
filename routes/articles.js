var express = require('express');
var router = express.Router();

router.get('/', function(req, res, next) {
  res.send({'aaaa':5,'bbbb':4});
});

module.exports = router;
