#import "MainScene.h"

@implementation MainScene
{
    CCLabelBMFont *_funkyLabel;
}

- (void)changeLabel:(id) sender
{
    // Make a new string which is a copy of the original one, with all the new-lines removed
    NSRegularExpression *newlineRegex = [NSRegularExpression regularExpressionWithPattern:@"\n" options:0 error:nil];
    NSString *labelText = [newlineRegex stringByReplacingMatchesInString:[_funkyLabel string] options:0 range:NSMakeRange(0, [[_funkyLabel string] length]) withTemplate:@""];
    
    // Make a new label with the one long string
    NSString *fontName = @"Anime-Ace";
    NSString *fontPath = [NSString stringWithFormat:@"%@.bmfont/%@.fnt", fontName, fontName];
    CCLabelBMFont *newLabel = [CCLabelBMFont labelWithString:labelText fntFile:fontPath width:[_funkyLabel contentSize].width alignment:CCTextAlignmentCenter];
    
    // Add the label back in the same spot
    [self addChild:newLabel];
    [newLabel setPositionType:[_funkyLabel positionType]];
    [newLabel setPosition:[_funkyLabel position]];
    [_funkyLabel removeFromParent];
    _funkyLabel = newLabel;
}

@end
