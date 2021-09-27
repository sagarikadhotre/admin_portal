const express = require('express');
const mongoose = require('mongoose');
const MedData = require('./models/medicine');

const app = express();

app.use(express.json());

app.get('/', async(req,res)  => {
  try{
      const datamed = await MedData.find();
      res.json(datamed);

  } catch(err){
      res.send('ERROR'+ err);
  }
});

app.get('/:id', async(req,res)  => {
  try{
      const datameds = await MedData.findById(req.params.id);
      res.json(datameds);

  } catch(err){
      res.send('ERROR'+ err);
  }
});


app.post('/upload', async(req,res) => {
  const data = new MedData({
      name:req.body.name,
      composition: req.body.composition,
      usage: req.body.usage,
  });
  try{
      await data.save();
      res.sendStatus(200);
  }catch(err){
      res.sendStatus(500);
  }
});

const dbURI = 'mongodb+srv://admin:admin123@geneeraadmin.3btsu.mongodb.net/medicine_info?retryWrites=true&w=majority';
mongoose.connect(dbURI, { useUnifiedTopology: true, useNewUrlParser: true })
  .then((result) => { app.listen(27017);
 console.log("Database Connected");
}) // listen to requests only after dB is connected
  .catch((err) => console.log(err));