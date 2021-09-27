const mongoose = require('mongoose')

const medicineSchema = new mongoose.Schema({
    name: {
        type:String,
        required: true
    },
    composition: {
        type:String,
        required: true
    },
    usage: {
        type: String,
        required: true
    }

})
module.exports = mongoose.model('medicine',medicineSchema)