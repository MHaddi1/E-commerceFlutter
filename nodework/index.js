const express = require('express');
const app = express();
app.use(express.json());
app.use(express.urlencoded({
  extended: true
})
);


app.listen(3000, () => {
  console.log(`Server is listening on port 3000`);
});
const productAllData = [];

app.get('/', (req, res) => {
  res.send("connected successfully")

})

app.post('/api/addProduct', (req, res) => {
  console.log("Result", req.body);
  const singleProductData = {
    id: productAllData.length + 1,
    pname: req.body.pname,
    pprice: req.body.pprice,
    pdetails: req.body.pdetails,
  };


  productAllData.push(singleProductData);
  res.status(200).send({
    code: 200,
    message: "Product added successfully",
    addedproduct: singleProductData,
  });
});

app.get("/api/getProduct", (req, res) => {
  if (productAllData.length > 0) {
    res.status(200).send({ code: "200", productData: productAllData });
  } else {
    res.status(200).send({ code: 200, productData: [] });
  }
});



// const express = require("express");
// const app = express();
// app.use(express.json());
// app.use(
//   express.urlencoded({
//     extended: true,
//   })
// );

// app.listen(4000, () => {
//   console.log("Listening on port 4000 ");
// });

// const productAllData = [];

// app.get("/", (req, res) => {
//   res.send("Connected");
// });

// app.post("/api/addproduct", (req, res) => {
//   console.log("Result", req.body);

//   const singleProductData = {
//     id: productAllData.length + 1,
//     pname: req.body.pname,
//     pprice: req.body.pprice,
//     pdetails: req.body.pdetails,
//   };

//   productAllData.push(singleProductData);
//   res.status(200).send({
//     code: 200,
//     message: "Product added successfully",
//     addedproduct: singleProductData,
//   });
// });

// app.get("/api/getProduct", (req, res) => {
//   if (productAllData.length > 0) {
//     res.status(200).send({ code: "200", productData: productAllData });
//   } else {
//     res.status(200).send({ code: 200, productData: [] });
//   }
// });



// {
//     "myapi": [{
//         "name": "Winter Jacket",
//         "price": 30,
//         "Description": "Infinity Loop Drive",
//         "image_url": "https://static-01.daraz.pk/p/512ca715d815a37df4aeed1b2067a4f9.jpg"
//     },
//     {
//         "name": "Winter Jacket",
//         "price": 30,
//         "Description": "Infinity Loop Drive",
//         "image_url": "https://static-01.daraz.pk/p/512ca715d815a37df4aeed1b2067a4f9.jpg"
//     }
//         ,
//     {
//         "name": "Winter Jacket",
//         "price": 30,
//         "Description": "Infinity Loop Drive",
//         "image_url": "https://static-01.daraz.pk/p/512ca715d815a37df4aeed1b2067a4f9.jpg"
//     },
//     {
//         "name": "Winter Jacket",
//         "price": 30,
//         "Description": "Infinity Loop Drive",
//         "image_url": "https://static-01.daraz.pk/p/512ca715d815a37df4aeed1b2067a4f9.jpg"
//     }]
// }