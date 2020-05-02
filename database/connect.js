var mysql = require('mysql');

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "Xinchao6868@",
  database: 'InvestmentDatabase',
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});

module.exports = con;