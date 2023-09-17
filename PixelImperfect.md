# Pixel Imperfect

### Challenge
**The flag is what is different between the two images.**

When you click on the link you are presented with two images:

![Pixel Imperfect 1](/images/PixelImperfect1.bmp) ![Pixel Imperfect 2](/images/PixelImperfect2.bmp)

To the naked eye, there should be no obvious difference. However, if you download the images and inspect them pixel-by-pixel you will find that there are a few pixels that differ between them.

Of course, doing so in an image editor would be tedious, so GitHub CoPilot and I wrote a quick C# script to do it for me:

```csharp
Bitmap orig = (Bitmap)Bitmap.FromFile(@"(Your download location)\PixelImperfect1.bmp", true);
Bitmap modified = (Bitmap)Bitmap.FromFile(@"(Your download location)\PixelImperfect2.bmp", true);

var letters = new List<byte>();

int h = orig.Height;
int w = orig.Width;

for(int i = 0; i < w; i++)
{
    for(int j = 0; j < h; j++)
    {
        var origPxl = orig.GetPixel(i, j);
        var modPxl = modified.GetPixel(i, j);

        if(origPxl.R != modPxl.R)
        {
            letters.Add(modPxl.R);
            Console.Write($"{modPxl.R:x2} ");
        }

        if (origPxl.G != modPxl.G)
        {
            letters.Add(modPxl.G);
            Console.Write($"{modPxl.G:x2} ");
        }

        if (origPxl.B != modPxl.B)
        {
            letters.Add(modPxl.B);
            Console.Write($"{modPxl.B:x2} ");
        }
    }
}
Console.WriteLine();
Console.WriteLine(Encoding.UTF8.GetString(letters.ToArray())); //This is the flag!
```

### How did I create these images?

I wrote a program to loop over the pixels in much the same way as the above script. Whenever I encountered a byte with value 0, I wrote the next letter of the flag to the pixel until I had written all the letters. I then saved the image as a bitmap.

If you were to binary compare these images you would easily see the byte differences but they would not be in obvious order. That's why it is easier to loop over the pixes row-by-row and compare the bytes in order.

