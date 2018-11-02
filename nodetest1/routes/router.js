const express = require('express');
const router = new express.Router();
const new_user = require('./signup.js');
 
router.route('/signup/:user_id?')
  .get(employees.get);
 
module.exports = router;