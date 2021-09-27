const mongoose = require('mongoose')

const signupSchema = new mongoose.Schema({
    name: {
        type:String,
        required: true
    },
    email: {
        type:String,
        required: true
    },
    pswd: {
        type: String,
        required: true
    },
    conpswd: {
        type: String,
        required: true
    }


})
module.exports = mongoose.model('signupmodel',signupSchema)