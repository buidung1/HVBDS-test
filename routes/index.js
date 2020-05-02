var express = require("express");
var router = express.Router();
var dbConnect = require("../database/connect");
var bodyParser = require("body-parser");
var idInvesment = Number();
var idProject = Number();
var idInvestor = Number();
var details;
var status;

router.use(bodyParser.json());
router.use(bodyParser.urlencoded({ extended: false }));

// Get home page
router.get('/', function(req, res, next) {
  dbConnect.query("SELECT * FROM InvestmentDatabase.Project", function(err,data) {
    if (err) throw err;
    res.render("project", { data: data });
  })
});

// save investor id
router.get('/proj/:id', function(req,res){
  idProject = req.params.id;
  res.redirect("/investor");
})


//Sign Up
router.get("/add", function(req, res){
  res.render("signup")
});
// save User's details
router.post("/add",function(req, res){
  dbConnect.query(`INSERT INTO InvestmentDatabase.User (UserName, UserPassword) VALUES('${req.body.name}','${req.body.password}')`, function(err, result){
    if(err) throw err;
    // idUser = result.idUser;
    res.redirect("/");
  });
  // var Name = req.body.name;
  // var password = req.body.password;
  // idUser = dbConnect.query("SELECT idUser FROM InvestmentDatabase.User WHERE UserName = ? && UserPassword = ?", [Name, password]);
});

//investor
router.get("/investor", function(req,res, next){
  dbConnect.query("SELECT * FROM InvestmentDatabase.Investor", function(err,data) {
    if (err) throw err;
    res.render("investor", {data: data});
  })
});

//save investor id
router.get('/investor/:id', function(req, res){
  idInvestor = req.params.id;
  res.redirect("/details");
});


//add details and save to investment table
router.get("/details", function(req,res){
  res.render('details');
});
router.post('/details', function(req, res){
  
  var sql = `INSERT INTO InvestmentDatabase.Investment (InvestmentDetails, InvestmentSatus, Project_idProject, Investor_idInvestor, User_idUser) VALUES('${req.body.details}','${req.body.status}', ?)`;
  var values = [idProject,idInvestor,'1']
  status = req.body.status;
  details = req.body.details;
  dbConnect.query(sql,[values], function(err,result){
    idInvestment=result.idInvestment;
    if (err) throw err;
    res.redirect('/result')
  })
});

//result
router.get('/result', function(req, res, next) {
  dbConnect.query("SELECT * FROM InvestmentDatabase.Investment WHERE Investor_idInvestor = ? && Project_idProject = ? && InvestmentDetails = ? && InvestmentSatus=?", [idInvestor, idProject, details, status], function(err,data) {
    if (err) throw err;
    res.render("result", { data: data });
  })
});

module.exports = router;
