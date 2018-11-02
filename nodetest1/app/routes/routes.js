'use strict';
module.exports = function(app) {
  var user_account = require('../controllers/user_account');

  // todoList Routes
  app.route('/login')
    .get(user_account.list_all_users)
    .post(user_account.create_user);
   
   app.route('/login/:user_account_id')
    .get(user_account.match_user)
    .put(user_account.update_user)
    .delete(user_account.delete_user);
    };