# Welcome Challenge

### Challenge

> aXQncy1jYXB0dXJlLXRoZS1mbGFnLWdzY2MtMjAyMyE=

This challenge presents you with some text that at first glance seems unintelligible. But if you have much experience with web development you might recognize this as Base64 encoding. Base64 is a binary-to-text encoding designed to allow systems to communicate binary data over a text format. The most common being HTTP.

The only challenge is to decode this value. Notice I said "decode", not "decrypt". Base64 is not encryption and provides no security at all. You can easily decode the value online by searching for a decoder. Notepad++ also has Base64 encoding/decoding built in. Here is a C# implementation:

```
string plainText = Encoding.UTF8.GetString(Convert.FromBase64String("aXQncy1jYXB0dXJlLXRoZS1mbGFnLWdzY2MtMjAyMyE="));

... and here is a javascript implementation:
```

atob("aXQncy1jYXB0dXJlLXRoZS1mbGFnLWdzY2MtMjAyMyE=")