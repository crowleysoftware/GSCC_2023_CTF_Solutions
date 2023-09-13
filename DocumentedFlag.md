# Documented Flag

### Challenge
**The image in the document displays the flag.**

There is download link that points to a Microsoft Word document. As you review the content you will notice there is no image anywhere in the document. However, if you you were aware of the fact that MS Office documents are actually just zip files, you might unzip it to see what is inside. 

Poking around the folders you'll see a file named document.xml. The challenge says the image is in "the document" so look closer.

Inspecting the xml in your favorite editor, you'll notice a large section of comments:

![xml](/images/DocumentedFlag.png)

These hexadecimally encoded bytes are actually a png image if you turn them into bytes and save them as a file.

in C#:

```csharp
//Assume "alltext" is the string containing the hex bytes copied out of the xml file
string[] bytes = alltext.Split(new char[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
var hexAsBytes = bytes.Select(b => Convert.ToByte(b, 16)).ToArray();
File.WriteAllBytes(@"c:\deleteme\DocumentedFlag.png", hexAsBytes);