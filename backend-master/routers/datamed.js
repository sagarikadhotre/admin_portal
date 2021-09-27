// const express = require('express')
// const router = express.Router()
// const MedData = require('./models/data')

// router.get('/', async(req,res)  => {
//     try{
//         const datamed = await MedData.find()
//         res.json(datamed)

//     } catch(err){
//         res.send('ERROR'+ err)
//     }
// })

// router.get('/:id', async(req,res)  => {
//     try{
//         const datameds = await MedData.findById(req.params.id)
//         res.json(datameds)

//     } catch(err){
//         res.send('ERROR'+ err)
//     }
// })


// router.post('/upload', async(req,res) => {
//     const data = new MedData({
//         name:req.body.name,
//         composition: req.body.composition,
//         usage: req.body.usage
//     })

//     try{
//         const a1= await data.save()
//         res.json(a1)
//     }catch(err){
//         res.send('Error')
//     }
    

// })
// module.exports = router