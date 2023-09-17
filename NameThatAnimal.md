# Name That Animal

### Challenge
**Its simple, just submit the name of the animal in the photo.**

The link shows you a picture of an elephant and there is a simple form where all you have to do is type in the name of the animal. If you type in the name of the animal, you get the flag.

![Name that animal](/images/namethatanimal.png)

The problem is that the text box only accepts 5 characters. No matter what you try to type in, you get an error message:

> No, this is an Elephant

You need to figure out a different way to submit the name. If you review the network traffic, you will see that the form is submitting a POST request to the server. If you recreate this request with your favorite HTTP client, you can submit the name of the animal and get the flag. This is a classic case of trusting the front end to enforce security.

cURL example:

```curl
curl -X POST --location "https://localhost:5001/api/submit" \
    -H "Content-Type: application/x-www-form-urlencoded" \
    -d "value=Elephant"
```

.http client example:

```
### Get flag
POST https://localhost:5001/api/submit
Content-Type: application/x-www-form-urlencoded

value=Elephant
```