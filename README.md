# Dokumentasi API travelEase

# BASE URL:


Development : [http://localhost:9000/{url}]


### Register

- URL

`/register`

- HEADERS

`Content-Type: application/json`

- Method

`POST`

- Request Body

`name` as `string`

`email` as `string`, must be unique

`password` as `string`, must be at least 8 characters

`confPassword` as `string`, must be at least 8 characters

`age` as `integer`,

`location` as `string`, 

- Response


``` json
{
   "status": "200 OK",
    "message": "Registration successful.",
    "data": {
        "id": 1,
        "username": "John Doe" ,
        "email": "Johndoe@gmail.com",
        "location": "Jakarta",
        "createdAt": "2024-05-31T10:08:52.381Z",
        "updatedAt": "2024-05-31T10:08:52.381Z"
    }
}

 ```

### Login

- URL


`/login`

- Method

    `POST`

- Request Body


`email` as `string`, must be unique

`password` as `string`, must be at least 8 characters

- Response


``` json
{
   "status": "200 OK",
    "data": {
        "id": 3,
	    "accessToken": "accessToken"
    }
}

 ```

### Refresh Token

- URL

`/token`

- Method

`GET`

- Headers

`Authorization: Bearer <token>`


- Response


``` json
{
   "status": "200 OK",
    "data": {
        "accessToken": "accessToken"

    }
}

 ```

### Logout

- URL

`/logout`

- Method

`POST`

- Headers

`Authorization: Bearer <token>`


- Response


``` json
{
    "status": "204 No Content ",
}

 ```

### GET All Places

- URL

`/places`

- Method

`GET`

- Headers

`Authorization: Bearer <token>`


- Response


``` json
[
    {
        "id": 1,
        "image_url": "https://upload.wikimedia.org/wikipedia/id/b/b1/Merdeka_Square_Monas_02.jpg",
        "place_name": "Monumen Nasional",
        "city": "Jakarta",
        "price": 20000,
        "rating": 9,
        "category": "Budaya",
        "description": "Monumen Nasional atau yang disingkat dengan Monas atau Tugu Monas adalah monumen peringatan setinggi 132 meter (433 kaki) yang terletak tepat di tengah Lapangan Medan Merdeka, Jakarta Pusat. Monas didirikan untuk mengenang perlawanan dan perjuangan rakyat Indonesia dalam merebut kemerdekaan dari pemerintahan kolonial Kerajaan Belanda.",
        "lat": -6.176132,
        "lon": 106.822864
    }
]

 ```


 ### GET Places by ID

- URL

`/places/:{id}`

- Method

`GET`

- Headers

`Authorization: Bearer <token>`


- Response


``` json
    {
        "id": 1,
        "image_url": "https://upload.wikimedia.org/wikipedia/id/b/b1/Merdeka_Square_Monas_02.jpg",
        "place_name": "Monumen Nasional",
        "city": "Jakarta",
        "price": 20000,
        "rating": 9,
        "category": "Budaya",
        "description": "Monumen Nasional atau yang disingkat dengan Monas atau Tugu Monas adalah monumen peringatan setinggi 132 meter (433 kaki) yang terletak tepat di tengah Lapangan Medan Merdeka, Jakarta Pusat. Monas didirikan untuk mengenang perlawanan dan perjuangan rakyat Indonesia dalam merebut kemerdekaan dari pemerintahan kolonial Kerajaan Belanda.",
        "lat": -6.176132,
        "lon": 106.822864
    }

 ```


### GET All Itinerary

- URL

`/itinerary/:{id}`

- Method

`GET`

- Headers

`Authorization: Bearer <token>`


- Response


``` json
[
    {
        "id": 1,
        "user_id": 1,
        "place_id": 1,
        "start_date": "2024-06-10",
        "end_date": "2024-06-11",
        "city": "Jakarta",
        "category": "Wisata",
        "numberofpeople": 2,
        "added_at": "2024-06-09T10:38:45.000Z",
        "createdAt": "2024-06-09T05:38:06.000Z",
        "updatedAt": "2024-06-09T05:38:06.000Z"
    },
    {
        "id": 2,
        "user_id": 1,
        "place_id": 1,
        "start_date": "2024-06-10",
        "end_date": "2024-06-11",
        "city": "Jakarta",
        "category": "Wisata",
        "numberofpeople": 2,
        "added_at": "2024-06-09T04:45:49.000Z",
        "createdAt": "2024-06-09T04:45:48.000Z",
        "updatedAt": "2024-06-09T04:45:48.000Z"
    }
]

```



### Post Itinerary

- URL

`/itinerary`

- Method

`POST`

- Headers

`Authorization: Bearer <token>`

- Request Body


`user_id` as `integer`, 

`place_id` as `integer`, 

`city` as `string`,

`category` as `string`,

`numberofpeople` as `integer`,

`start_date` as `date`, 

`start_date` as `date`, 



- Response


``` json
{
    "msg": "Rencana perjalanan anda berhasil dibuat!"
}
```

### DELETE Itinerary

- URL

`/itinerary/:{id}`

- Method

`DELETE`

- Headers

`Authorization: Bearer <token>`


- Response


``` json
{
    "message": "Rencana Perjalanan anda telah dihapus!."
}
```





### GET All Comments

- URL

`/user/:{user_id}/comments`

- Method

`GET`

- Headers

`Authorization: Bearer <token>`


- Response


``` json
[
    {
        "id": 1,
        "user_id": 1,
        "place_id": 1,
        "user_comment": "Monumen Nasional atau yang disingkat dengan Monas atau Tugu Monas adalah monumen peringatan setinggi 132 meter (433 kaki) yang terletak tepat di tengah Lapangan Medan Merdeka, Jakarta Pusat. Monas didirikan untuk mengenang perlawanan dan perjuangan rakyat Indonesia dalam merebut kemerdekaan dari pemerintahan kolonial Kerajaan Belanda.",
        "user_rating": 9
    },
    {
        "id": 2,
        "user_id": 1,
        "place_id": 1,
        "user_comment": "Dunia Fantasi atau yang lebih populer dengan sebutan Dufan, pertama kali dibuka untuk umum pada 29 Agustus 1985 dan merupakan theme park pertama yang dikembangkan oleh Perseroan dan telah memiliki sertifikat ISO 9001:2015 sejak Februari 2017. Terdapat 33 wahana di Dunia Fantasi(Dufan) seperti Hysteria, Tornado, Baling-Baling, Kicir-Kicir, Halilintar, Kora-Koradan masih banyak wahana yang lainnya",
        "user_rating": 8
    }
]


```
```

```

### POST Comment

- URL

`/user/:{user_id}/comments`

- Method

`POST`

- Headers

`Authorization: Bearer <token>`

- Request Body


`user_id` as `integer`, 

`place_id` as `integer`, 

`user_comment` as `string`, 

`rating` as `integer`, 



- Response


``` json
{
    "msg": "komentar anda berhasil dibuat!"
}
```


```
```


### GET IMAGE PROFILE

- URL

`/image`

- Method

`GET`

- Headers

`Authorization: Bearer <token>`


- Response


``` json
[
    {
        "id": 5,
        "uploadedBy": "John Doe",
        "image": "https://storage.googleapis.com/traveleasebucket/089caf0a-38e9-4931-a1a6-e6c62eef58dd-profilepict.jpg",
        "createdAt": "2024-06-18",
        "updatedAt": "2024-06-18"
    }
]
```


```
```

### POST IMAGE PROFILE

- URL

`/image`

- Method

`POST`

- Headers

`Authorization: Bearer <token>`

- Request Body


`image` as `integer`, 

`uploadedBy` as `string`, 


- Response


``` json
{
    "message": "Upload Success",
    "image": "https://storage.googleapis.com/traveleasebucket/f9651e4b-86c5-4fe7-b3cd-9d12632aab7a-capstone1.jpg"
}
```


