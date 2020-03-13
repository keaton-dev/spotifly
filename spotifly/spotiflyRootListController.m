#include "spotiflyRootListController.h"
#include <spawn.h>

@implementation spotiflyRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

-(void)killSpotify:(id)sender {
	pid_t pid;
	const char *argv[] = {"killall", "Spotify", NULL};
	posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)argv, NULL);
}

@end

@implementation YourLibraryRootListController
-(NSArray *)specifiers {
	if(!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"YourLibrary" target:self];
	}
	return _specifiers;
}
@end

@implementation NowPlayingRootListController
-(id)specifiers {
	if(!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"NowPlaying" target:self];
	}
	return _specifiers;
}
@end

@implementation NowPlayingUIRootListController
-(id)specifiers {
	if(!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"NowPlayingUI" target:self];
	}
	return _specifiers;
}
@end


@implementation NowPlayingAnnoyancesRootListController
-(id)specifiers {
	if(!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"NowPlayingAnnoyances" target:self];
	}
	return _specifiers;
}
@end

@implementation GeneralRootListController
-(id)specifiers {
	if(!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"General" target:self];
	}
	return _specifiers;
}
@end

@implementation ImportMusicRootListController
-(id)specifiers {
	if(!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"ImportMusic" target:self];
	}
	return _specifiers;
}
@end

@implementation ExperimentalRootListController
-(id)specifiers {
	if(!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Experimental" target:self];
	}
	return _specifiers;
}
@end
