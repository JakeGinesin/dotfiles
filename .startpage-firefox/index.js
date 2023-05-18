const express = require('express');
const app = express();

const path = require('path');
const cors = require('cors');

//install forever global

app.use(cors());
app.use(express.static(path.join(__dirname, 'src')));

app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, 'src','index.html'));
});

app.listen(process.env.PORT || 5050, function(error){
  if(error) console.log(error);
  console.log("listening on 5050");
});
