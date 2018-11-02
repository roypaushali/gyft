'user strict';
var sql = require('./db.js');

//User object constructor
var User = function(user){
    this.user = user.user;
    this.status = user.status;
    this.created_at = new Date();
};
User.createUser = function createUser(newUser, result) {    
        sql.query("INSERT INTO user_account set ?", newUser, function (err, res) {
                
                if(err) {
                    console.log("error: ", err);
                    result(err, null);
                }
                else{
                    console.log(res.insertId);
                    result(null, res.insertId);
                }
            });           
};
User.getUserById = function createUser(UserId, result) {
        sql.query("Select (first_name, last_name) from user_account where user_account_id = ? ", UserId, function (err, res) {             
                if(err) {
                    console.log("error: ", err);
                    result(err, null);
                }
                else{
                    result(null, res);
              
                }
            });   
};
User.getAllUsers = function getAllUsers(result) {
        sql.query("Select * from user_account", function (err, res) {

                if(err) {
                    console.log("error: ", err);
                    result(null, err);
                }
                // else{
                  console.log('users : ', res);  

                 result(null, res);
                }
            });   
};
User.updateById = function(id, user, result){
  sql.query("UPDATE user_account SET user = ? WHERE user_account_id = ?", [task.user, id], function (err, res) {
          if(err) {
              console.log("error: ", err);
                result(null, err);
             }
           else{   
             result(null, res);
                }
            }); 
};
User.remove = function(id, result){
     sql.query("DELETE FROM user_account WHERE user_account_id = ?", [id], function (err, res) {

                if(err) {
                    console.log("error: ", err);
                    result(null, err);
                }
                else{
               
                 result(null, res);
                }
            }); 
};

module.exports= User;