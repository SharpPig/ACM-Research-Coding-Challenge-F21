// Sentiment Analysis using Swift!

/*This code will work on the following operating systems.
- iOS 13.0+
- macOS 10.15+
- Mac Catalyst 13.0+
- tvOS 13.0+
- watchOS 6.0+ */


/* Establish an input: 
During the input phrase, we need to use unicode characters in order to be able to use the double quotes character inside the string. The unicode \u{22} is a substitute for a single " sign.
Example:
let stringVariable = "this is a \u{22}string\u{22}!"
Instead of:
let stringVariable = "this is "string"!" 
*/

//Begin Code:
static let sentiment: NLTagScheme

let inputString = "\u{22}Stop blushing. I'm not needling, really I'm not. Do you know, I had a dream an hour ago. I lay down for a cat-nap and in this dream you and I, Montag, got into a furious debate on books. You towered with rage, yelled quotes at me. I calmly parried every thrust. Power, I said, And you, quoting Dr. Johnson, said `Knowledge is more than equivalent to force!' And I said, `Well, Dr. Johnson also said, dear boy, that \u{22}He is no wise man that will quit a certainty for an uncertainty.'\u{22} Stick with the fireman, Montag. All else is dreary chaos!\u{22} \u{22}Don't listen,\u{22} whispered Faber. \u{22}He's trying to confuse. He's slippery. Watch out!\u{22} Beatty chuckled. \u{22}And you said, quoting, `Truth will come to light, murder will not be hid long!' And I cried in good humour, 'Oh God, he speaks only of his horse!' And `The Devil can cite Scripture for his purpose.' And you yelled, 'This age thinks better of a gilded fool, than of a threadbare saint in wisdom's school!' And I whispered gently, 'The dignity of truth is lost with much protesting.' And you screamed, 'Carcasses bleed at the sight of the murderer!' And I said, patting your hand, 'What, do I give you trench mouth?' And you shrieked, 'Knowledge is power!' and 'A dwarf on a giant's shoulders of the furthest of the two!' and I summed my side up with rare serenity in, 'The folly of mistaking a metaphor for a proof, a torrent of verbiage for a spring of capital truths, and oneself as an oracle, is inborn in us, Mr. Valery once said.'\u{22} I think you may like to know something of his person and character. He had an excellent constitution of body, was of middle stature, but well set, and very strong; he was ingenious, could draw prettily, was skilled a little in music, and had a clear, pleasing voice, so that when he played psalm tunes on his violin and sung withal, as he sometimes did in an evening after the business of the day was over, it was extremely agreeable to hear. He had a mechanical genius too, and, on occasion, was very handy in the use of other tradesmen's tools; but his great excellence lay in a sound understanding and solid judgment in prudential matters, both in private and publick affairs. In the latter, indeed, he was never employed, the numerous family he had to educate and the straitness of his circumstances keeping him close to his trade; but I remember well his being frequently visited by leading people, who consulted him for his opinion in affairs of the town or of the church he belonged to, and showed a good deal of respect for his judgment and advice: he was also much consulted by private persons about their affairs when any difficulty occurred, and frequently chosen an arbitrator between contending parties. At his table he liked to have, as often as he could, some sensible friend or neighbor to converse with, and always took care to start some ingenious or useful topic for discourse, which might tend to improve the minds of his children. By this means he turned our attention to what was good, just, and prudent in the conduct of life; and little or no notice was ever taken of what related to the victuals on the table, whether it was well or ill dressed, in or out of season, of good or bad flavor, preferable or inferior to this or that other thing of the kind, so that I was bro't up in such a perfect inattention to those matters as to be quite indifferent what kind of food was set before me, and so unobservant of it, that to this day if I am asked I can scarce tell a few hours after dinner what I dined upon. This has been a convenience to me in traveling, where my companions have been sometimes very unhappy for want of a suitable gratification of their more delicate, because better instructed, tastes and appetites."

// Feed it into the NaturalLanguage framework which is built into Swift
let tagger = NLTagger(tagSchemes: [.sentimentScore])
tagger.string = inputString

// Ask for the results. This is where a bulk of the processing happens.
let sentiment = tagger.tag(at: inputString.startIndex, unit: .paragraph, scheme: .sentimentScore).0

// Read the sentiment back to determine a final score.
let score = Double(sentiment?.rawValue ?? "0") ?? 0

//This step is unnecessary, but it separates the calculating from the printing.
let finalScore = score

// Prints a happy, sad, or neutral face based on the final score.
if score == 0{
    print(":|")
}
else if score < 0{
    print(":(")
}
else {
    print(":D")
}
//A positive score (score > 0) represents a sentiment that is of positive sentimental polarity.

//A negative score (score < 0) represents a sentiment that is of negative sentimental polarity.\

//A neutral score (score = 0) represents a sentiment that is of neutral sentimental polarity.


//Since (score) is a Double type, a more user friendly version of the score is multiplied by 100. This increases the score range to [-100, 100], instead of [-1.0, 1.0].
print("The estimated sentiment score is: \(score*100)")

//You can optionally add a % (percent symbol) after the number to have a certain percentage polarity for a certain mood.
