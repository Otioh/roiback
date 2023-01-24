const express=require('express');
const mysql=require('mysql');
const cors=require('cors');
const pool=mysql.createPool({
    host:'localhost',
    user:'root',
    password:'',
    database:'roistudy',
    connectionLimit:10
})

const app=express();
app.use(cors())
const bodyParser=require('body-parser');
app.use(bodyParser.urlencoded({extended:false}));
app.use(bodyParser.json());

const response ={
    status:false,
    message:'',
    data:[]
}











app.get('/', (req, res)=>{
    res.send('Yes')
})


app.get('/auth', (req, res)=>{
    res.send('Authentication Route')
})


app.post('/auth', (req, res)=>{
    const { email, password}=req.body;
    if( email==="" || email===undefined || password==="" || password===undefined){
        res.send({...response, message:'Email & Password is required'})
    }else{
 
        pool.query("SELECT * FROM students WHERE email='"+email+"' && password='"+password+"'", (error, result, row)=>{
          
            if(error){
                res.send({...response, message:'Error Validating '})
            }else{

            if(result.length>0){
              
                res.send({...response, message:`Welcome ${result[0].first_name} ${result[0].surname}`, status:true, data:result})
            }else{
                res.send({...response, message:'Invalid Login Details '})
            }

            }})

        
    }
})


app.get('/students', (req, res)=>{
    res.send('Students')
})



app.get('/programmes',  (req, res)=>{
    pool.query("SELECT * FROM programmes", (error, result, row)=>{
          
        if(error){
            res.send({...response, message:'Error Fetching Programmes '})
        }else{

      
          
            res.send({...response, message:`Programmes fetched successfully`, status:true, data:result})
       

        }})
})

app.get('/payments/:payer',  (req, res)=>{
    let payer=req.params.payer;
    pool.query("SELECT * FROM payments WHERE payer ='"+payer+"'", (error, result, row)=>{
          
        if(error){
            res.send({...response, message:'Error Fetching Payments '})
        }else{

      
          
            res.send({...response, message:`Payments fetched successfully`, status:true, data:result})
       

        }})
})



app.post('/students', (req, res)=>{
    const {first_name, surname, email, password, phone, address, lga, state, gender}=req.body;
    let reg_no='RS'+parseInt(Math.random(0,1)*20000);
    if(first_name==="" || first_name===undefined || surname==="" || surname===undefined || email==="" || email===undefined || phone==="" || phone===undefined || password==="" || password===undefined){
        res.send({...response, message:'All Fields are required'})
    }else{
       
pool.query("SELECT * FROM students WHERE email='"+email+"'", (error, result, row)=>{
if(result.length>0){
    res.send({...response, message:'User Already Exist with '+email})
}else{

    pool.query("INSERT INTO `students` (`id`, `first_name`, `surname`, `reg_no`, `email`, `password`, `date_created`, `verify_code`, `verified`, `phone`, `address`, `lga`, `state`, `gender`) VALUES (NULL, '"+first_name+"', '"+surname+"', '"+reg_no+"', '"+email+"', '"+password+"', '"+new Date().toLocaleDateString()+"', '', 'false', '"+phone+"', '"+address+"', '"+lga+"', '"+state+"', '"+gender+"');", (error, result, row)=>{
        if(error){
            res.send({...response, message:'Error Registering New Student'})
        }
        else{
            res.send({...response, message:'Registered Successfully', status:true})
        }
    })
}
})

       
    }
})






app.post('/payments', (req, res)=>{
    const {payer, description, amount, status, tran_id}=req.body;

    let pay_id='T'+parseInt(Math.random(0,1)*200000);

    pool.query("INSERT INTO `payments` (`id`, `transaction_id`, `description`, `amount`, `payer`, `status`, `date_initiated`, `payment_id`) VALUES (NULL, '"+tran_id+"', '"+description+"', '"+amount+"', '"+payer+"', '"+status+"', '"+new Date() +"', '"+pay_id+"');", (error, result, row)=>{
        if(error){
            res.send({...response, message:'Error Posting Payment'})
        }
        else{
            res.send({...response, message:'Payment Processed Successfully', status:true})
        }
    })
       
    
})





app.get('/play', (req, res)=>{
    
})




app.listen(8000, ()=>{
console.log('listening at port 8000');
})