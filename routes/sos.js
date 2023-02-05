var express = require('express');
var router = express.Router();

router.post('/', (req, res) => {
    res.send(req.body);
});

router.get('/:sos_id/location', (req, res) => {
    res.send(req.params);
});

module.exports = router;
