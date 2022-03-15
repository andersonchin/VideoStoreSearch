var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.post('/search', function(req,res,next) {
    console.log(req.body);
    req.pool.getConnection(function(err,connection) {
    if (err) {
      res.sendStatus(500);
      return;
    }


    var query = "SELECT DISTINCT Video_Games.Name, Video_Games.Genre, Video_Games.Platform, Features.Feature, Video_Games.Price FROM Video_Games INNER JOIN Features ON Video_Games.id = Features.Video_Game WHERE Video_Games.Genre = ? AND Video_Games.Platform = ? AND Features.Feature = ? AND Video_Games.PRICE < ?;";

    connection.query(query, [req.body.Genre, req.body.Platform, req.body.Feature,req.body.Price], function(err, rows, fields) {
      connection.release();
      if (err) {
        res.sendStatus(405);
        return;
      }
      res.json(rows);
    });

  });
});

module.exports = router;
