# Monky Business

### Challenge
TIP: there are no '-'s in this flag

The one clue without spending any points is in the title: "Monky Business". You may notice the typical phrase, Monkey Business, is misspelled. This is meant to clue you in to the fact that "Monk", not "Monkey" is what you shold be pondering.

What you get when you visit the link is:

![Monky Business](/images/MonkyBusiness.png "Monky Business")

Clearly this must be some sort of encoding that hides a message. But what kind of encoding???

If you Google "monk encoding" the first result is [Cistercian numerals](https://en.wikipedia.org/wiki/Cistercian_numerals). If you "buy" the hints, you will also be clued into "Cistercian Monks". 

Based on this information, you should be able to convert each symbol into a number. For instance:

![1769](/images/Cistercian1.png)

represents 1769, which is the Unicode code point for ۩

These unicode characters are more often expressed as hexadecimal which in this case would be \u06e9

If you continue to decode all the symbols in the same say you will discover the flag.

In javascript you could :

    String.fromCharCode(...[1769, 8540, 7891, 8251, 8432, 2039, 8987, 4314, 5555, 6366, 8596, 1421, 7450, 5593, 3647, 3237, 6670, 3515, 8734, 8800, 5775, 4186, 5854, 4587, 3572, 5122])

output:
> ۩⅜ồ※⃰߷⌛ლᖳᣞ↔֍ᴚᗙ฿ಥᨎර∞≠ᚏၚᛞᇫ෴ᐂ