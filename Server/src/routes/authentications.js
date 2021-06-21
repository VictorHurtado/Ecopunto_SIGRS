const express =require('express');

const router = express.Router();

router.get('/',(req,res)=>{
    res.send('authentication World');
})

module.exports=router;