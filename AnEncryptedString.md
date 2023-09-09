# An Encrypted String

### Challenge
**You're more than Welcome to try to decrypt this: lIyB4FIcI2m+AbeBom5MDS18grzMcRYh82AHFNQ+8sQ=**

The challenge is to decrypt the string "lIyB4FIcI2m+AbeBom5MDS18grzMcRYh82AHFNQ+8sQ=". The clues are:
1. The first letters of the title words are A, E, S. You might notice this and guess the encryption algorithm used is [AES](https://en.wikipedia.org/wiki/Advanced_Encryption_Standard).
1. The description says you are "Welcome" to try... notice the capital W which might make you wonder if the Welcome Challenge has anything to do with this.

Of course you can also "buy" the hints to get these clues a little more directly.

If you know you are dealing with AES, and the encryption key is probably the solution to the Welcome Challenge, then you can get to work decrypting this string.

If you look into how AES works, you will see that there are a few Cipher Modes that can be used. Since you have been given a key but not an initialization vector you can deduce that the cipher mode must be ECB since that is the only one that does not require an IV. You now have all information you need to decrypt the text.

A CSharp implementation:
```
 var encryptedString = Convert.FromBase64String("lIyB4FIcI2m+AbeBom5MDS18grzMcRYh82AHFNQ+8sQ=");
            
 var aesAlg = Aes.Create();
 aesAlg.Mode = CipherMode.ECB;
 aesAlg.IV = new byte[16]; //CipherMode.ECB doesn't use an IV but must provided all zeros

 aesAlg.Key = Encoding.UTF8.GetBytes("it's-capture-the-flag-gscc-2023!"); //key is solution to Welcome Challenge

 ICryptoTransform decryptor = aesAlg.CreateDecryptor();

 using (MemoryStream msDecrypt = new MemoryStream(encryptedString))
 {
     using (CryptoStream csDecrypt = new CryptoStream(msDecrypt, decryptor, CryptoStreamMode.Read))
     {
         using (StreamReader srDecrypt = new StreamReader(csDecrypt))
         {
             var plaintext = srDecrypt.ReadToEnd();
             Console.WriteLine(plaintext);
         }
     }
 }
```