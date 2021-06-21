const express= require('express');
const morgan =require('morgan');
const path= require('path');


//inicialized
const app=express();

//settings
app.set('port', process.env.PORT || 4000);

//middlewares
app.use(morgan('dev'));
app.use(express.urlencoded({extended:false}));
app.use(express.json());

//global variables
app.use((req,res,next)=>{
    next();
});
//routes
app.use(require('./routes/main_routes.js'));
app.use(require('./routes/authentications.js'));
app.use('/links',require('./routes/links.js'));
//public 
app.use(express.static(path.join(__dirname,'public')))
//starting server
app.listen(app.get('port'),()=>{
    console.log('server on port::::'+ app.get('port'));
});