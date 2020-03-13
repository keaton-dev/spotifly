#include "Tweak.h"

// Your Library
%hook SPTYourLibraryMusicTestManagerImplementation
-(BOOL)isShowAlbumArtistRecomendationsEnabled {
    //Enable Album and Artists Recommendations
    if(enabled && albumRecomendations) {
        return YES;
    }
    //Disable Album and Artists Recomendations
    if(enabled && albumRecomendationsOff) {
        return NO;
    }
    return %orig;
}
%end
//New Artists & Playlists UI
%hook SPTVISREFFlagsServiceImplementation
-(BOOL)headerEnabled {
    if(enabled && newUI){
        return YES;
    }
    return %orig;
}
//Old Artists & Playlists UI
-(BOOL)isVisualRefreshHeaderEnabled {
    if(enabled && oldUI) {
        return NO;
    }
    return %orig;
}
%end
//Double Play Button Action in Playlists
%hook SPTFreeTierPlaylistTestManagerImplementation
-(BOOL)isDoubleStatePlayButtonEnabled {
    if(enabled && doublePlay) {
        return YES;
    }
    return %orig;
}
%end
//Open Canvas Playlist
%hook SPTCanvasTestManager
-(BOOL)shouldEnableCanvasPlaylist {
    if(enabled && canvasPlaylist) {
        return YES;
    }
    return %orig;
}
%end
//True Shuffle
%hook SPTFreeTierTestManagerImplementation
-(BOOL)isWeightedShufflePlayDisabled {
    if(enabled && trueShuffle) {
        return YES;
    }
    return %orig;
}
%end
//Quick Scroll
%hook SPTYourLibraryMusicTestManagerImplementation
-(NSUInteger)quickScrollMechanism {
    if(enabled && quickScroll) {
        return 1;
    }
    return %orig;
}
%end
//No Shuffle on Play Button
%hook VISREFPlayButtonForegroundView
-(BOOL)isShuffleBadgeShown {
    if(enabled && shuffleBadge) {
        return NO;
    }
    return %orig;
}
%end
//Hide Create Playlist
%hook SPTYourLibraryMusicTestManagerImplementation
-(BOOL)isHideCreatePlaylistEnabled {
    if(enabled && hideCreatePlaylist) {
        return YES;
    }
    return %orig;
}
%end
//Create Playlist in Header
%hook SPTYourLibraryTestManagerImplementation
-(BOOL)isCreateButtonInHeaderEnabled {
    if(enabled && createPlaylistHeader) {
        return YES;
    }
    return %orig;
}
//Persist Active Tab
-(BOOL)isPersistActiveTabEnabled {
    if(enabled && persistActiveTab) {
        return YES;
    }
    return %orig;
}
%end
/*
enable floating create playlist button
enable playlist tabbar thing
*/
//View Artists Offline
%hook SPTFreeTierArtistFeatureProperties
-(BOOL)offlineArtistEnabled {
    if(enabled && offlineArtist) {
        return YES;
    }
    return %orig;
}
%end
//Make this is slider or number input later
%hook GLUEImageStyle
-(NSUInteger)mask {
    //Image Shape: Square
    if(enabled && imageSquare) {
        return 0;
    }
    //Image Shape: Circle
    if(enabled && imageCircle) {
        return 2;
    }
    //Image Shape: Rounded Square
    if(enabled && imageRoundedSquare) {
        return 3;
    }
    return %orig;
}
%end
//Playlist You Also Might Like
%hook SPTFreeTierPlaylistViewModelConfigurationFull
-(BOOL)isYouMightAlsoLikeEnabled {
    if(enabled && youMightAlsoLike) {
        return YES;
    }
    return %orig;
}
%end
//Playlist Recomendations
%hook SPTFreeTierPlaylistViewModelImplementation
-(BOOL)isPlaylistExtenderEnabled {
    if(enabled && playlistRecomendations) {
        return YES;
    }
    return %orig;
}
%end

// Now Playing
//
//Sleep Timer
%hook SPTNowPlayingTestManagerImplementation
-(BOOL)isMusicSleepTimerEnabled {
    if(enabled && sleepTimer) {
        return YES;
    }
    return %orig;
}
%end
//Put Title at Top
%hook SPTNowPlayingInformationUnitViewController
-(NSUInteger)leadingEdge {
    if(enabled && titleTop) {
        return 1;
    }
    return %orig;
}
%end
//Put Title in Center
%hook SPTNowPlayingInformationUnitViewModelImplementation
-(BOOL)centerAlignText {
    if(enabled && titleCenter) {
        return YES;
    }
    return %orig;
}
%end
//Put Album Playback Controls at Top
%hook SPTNowPlayingDefaultPremiumHeadUnitViewController
-(NSUInteger)leadingEdge {
    if(enabled && albumControlsTop) {
        return 1;
    }
    return %orig;
}
%end
//Put Radio Playback Controls at Top
%hook SPTNowPlayingFeedbackHeadUnitViewController
-(NSUInteger)leadingEdge {
    if(enabled && radioControlsTop) {
        return 1;
    }
    return %orig;
}
%end
//Put Duration Labels at Top
%hook SPTNowPlayingDurationUnitViewController
-(NSUInteger)leadingEdge {
    if(enabled && durationTop) {
        return 1;
    }
    return %orig;
}
%end
//Make Header Small
%hook SPTNowPlayingNavigationBarUnitViewController
-(NSUInteger)leadingEdge {
    if(enabled && headerTop) {
        return 0;
    }
    return %orig;
}
%end
//Put Footer at Top
%hook SPTNowPlayingFooterUnitViewController
-(NSUInteger)leadingEdge {
    if(enabled && footerTop) {
        return 1;
    }
    return %orig;
}
%end
//Auto Hide Duration Labels
%hook SPTNowPlayingDurationUnitViewController
-(BOOL)nowPlayingDurationViewShouldAlwaysShowDurationLabels:(id)arg {
    if(enabled && autoHideDurationLabels) {
        return NO;
    }
    return %orig;
}
%end
//!FIX
//Blackout Mode
/*%hook SPTNowPlayingBackgroundViewModel
-(void)setColor:(UIColor *)arg {
    if(enabled && blackoutMode) {
        return %orig([UIColor colorWithRed: 0.0 green: 0.0 blue: 0.0 alpha:1.0]);
    }
    %orig;
}
%end
//Disable Home Gradient
%hook SPTHomeGradientBackgroundView
-(void)updateHomeBackgroundGradientWithViewModel:(id)arg {
    if(enabled && homeGradient) {
    }
    %orig;
}
%end*/
//Canvas Toggle
%hook SPTCanvasTestManager
-(BOOL)shouldDisplayCanvasToggle {
    if(enabled && canvasToggle) {
        return YES;
    }
    return %orig;
}
//Canvas Tap Toggle
-(BOOL)shouldEnableCanvasTap {
    if(enabled && canvasTap) {
        return YES;
    }
    return %orig;
}
%end
//Enable Car View
%hook SPTDrivingState
-(BOOL)isDriving {
    if(enabled && carModeOn) {
        return YES;
    }
    return %orig;
}
%end
//Always Show Status Bar
%hook SPTStatusBarToken
-(BOOL)hidden {
    if(enabled && statusBarAlwaysOn) {
        return NO;
    }
    return %orig;
}
%end
//Real Time Lyrics Button
%hook SPTNowPlayingTestManagerImplementation
-(BOOL)isContentLayerLyricsEnabled {
    if(enabled && lyricsButtonToggle) {
        return YES;
    }
    return %orig;
}
%end
//Real Time Lyrics Card
%hook SPTLyricsV2TestManagerImplementation
-(BOOL)isFeatureEnabled {
    if(enabled && lyricsCardToggle) {
        return YES;
    }
    return %orig;
}
%end
//!FIX
//Lyrics Card View Blackout Mode
/*%hook LyricsV2Colors
-(UIColor *)darkColor {
    if(enabled && blackoutMode) {
        return [UIColor colorWithRed: 0.0 green: 0.0 blue: 0.0 alpha:1.0];
    }
    return %orig;
}
-(UIColor *)activeColor {
    if(enabled && blackoutMode) {
        return [UIColor colorWithRed: 120.0 green: 120.0 blue: 120.0 alpha:1.0];
    }
    return %orig;
}
-(UIColor *)brightColor {
    if(enabled && blackoutMode) {
        return [UIColor colorWithRed: 255.0 green: 255.0 blue: 255.0 alpha:1.0];
    }
    return %orig;
}
%end*/

// Now Playing Annoyances
//Disable Genius
%hook SPTGeniusService
-(BOOL)isTrackGeniusEnabled:(id)arg {
    if(enabled && geniusEnabled) {
        return NO;
    }
    return %orig;
}
%end
//Disable Storylines
%hook SPTStorylinesEnabledManager
-(BOOL)storylinesEnabledForTrack:(id)arg {
    if(enabled && storylineEnabled) {
        return NO;
    }
    return %orig;
}
%end
//Disable Canvas
%hook SPTCanvasTestManager
-(BOOL)isCanvasEnabled{
    if(enabled && canvasEnabled) {
        return NO;
    }
    return %orig;
}
%end
//Disable Queue Screen Controls
%hook SBQueueViewControllerIMplementation
-(BOOL)souldHideFooterViewController {
    if(enabled && queueFooter) {
        return NO;
    }
    return %orig;
}
%end
//Disable Social Listening Section
%hook SPTGaiaSocialListeningIntegrationManager
-(BOOL)isSocialDeviceFeatureEnabled {
    if(enabled && socialListening) {
        return NO;
    }
    return %orig;
}
%end
//Disable Like Song Heart
%hook SPTNowPlayingInformationUnitViewModelImplementation
-(BOOL)shouldShowPositiveFeedback {
    if(enabled && likeSongHeart) {
        return NO;
    }
    return %orig;
}
%end

// General Tab
//Connect Access Button
%hook SPTConnectAccessButtonTestManagerImplementation
-(BOOL)buttonEnabled {
    if(enabled && connectDevices) {
        return YES;
    }
    return %orig;
}
%end
//Big Connect Access Button
%hook SPTConnectAccessButton
-(BOOL)usingCompactMode {
    if(enabled && bigConnectDevices) {
        return NO;
    }
    return %orig;
}
%end
//Import Your Music
%hook SPTLocalFilesImportManager
-(BOOL)enabled {
    if(enabled && importMusic) {
        return YES;
    }
    return %orig;
}
//Import Songs First
-(BOOL)shouldStartWithSongs {
    if(enabled && importSongsFirst) {
        return YES;
    }
    return %orig;
}
//Import Playlists First
-(BOOL)shouldStartWithPlaylists {
    if(enabled && importPlaylistsFirst) {
        return YES;
    }
    return %orig;
}
//Import Show Dialog
-(BOOL)shouldShowDialog {
    if(enabled && importShowDialog) {
        return NO;
    }
    return %orig;
}
%end
//Voice Search
%hook SPTVoiceTestSearchEnabled
-(BOOL)isVoiceServiceEnabled {
    if(enabled && voiceSearchEnabled) {
        return YES;
    }
    return %orig;
}
%end
%hook SPTVoiceTestManagerImplementation
-(BOOL)isNewVoiceSearchEnabled {
    //New Voice Search
    if(enabled && newVoiceSearch) {
        return YES;
    }
    //Old Voice Search
    if(enabled && oldVoiceSearch) {
        return NO;
    }
    return %orig;
}
//Floating Mic Button
-(BOOL)isFloatingMicrophoneEnabled {
    if(enabled && floatingMic) {
        return YES;
    }
    return %orig;
}
%end
%hook SPTProfileUserEntity
//Verified Profile Badge
-(BOOL)isVerified {
    if(enabled && verifiedEnabled) {
        return YES;
    }
    return %orig;
}
%end
//Old Now Playing Bar
%hook SPTNowPlayingTestManagerImplementation
-(BOOL)isNowPlayingBarImprovementsEnabled {
    if(enabled && nowPlayingBarImprovements) {
        return NO;
    }
    return %orig;
}
%end
//Now Playing Bar Voice Button
%hook SPTNowPlayingBarContentView
-(void)showVoiceCompanionButton:(BOOL)arg {
    if(enabled && nowPlayingBarVoice) {
        return %orig(YES);
    }
    %orig;
}
%end
//Hide Now Playing Bar Album Art
%hook SPTNowPlayingBarLeftAccessoryCoverArtViewController
-(void)setCoverArtImageView:(id)arg {
    if(enabled && nowPlayingBarArt) {
    }
    %orig;
}
%end
/*
no burger menu icon on lockscreen toggle
*/
//Follow Feed
%hook FollowFeed
-(BOOL)followFeedEnabled {
    if(enabled && followFeedOn) {
        return YES;
    }
    return %orig;
}
%end
//Sign in with Apple
%hook SPTLoginAppleSignInTestManager
-(BOOL)isAppleSignInSystemButtonEnabled {
    if(enabled && signInWithApple) {
        return YES;
    }
    return %orig;
}
%end

// Experimental
//Big Text
%hook GLUELabelStyle
-(BOOL)upperCase {
    if(enabled && bigText) {
        return YES;
    }
    return %orig;
}
%end
//Show Participants in Now Playing
%hook SPTGaiaSocialListeningIntegrationManager
-(BOOL)shouldShowParticipantsInNowPlayingView {
    if(enabled && participantsNowPlaying) {
        return YES;
    }
    return %orig;
}
%end
//Disable Now Playing Swipe Down
%hook SPTNowPlayingViewController
-(BOOL)barViewControllerInteractiveTransitionEnabled:(id)arg {
    if(enabled && nowPlayingSwipeDisabled) {
        return NO;
    }
    return %orig;
}
%end
//Time Remaining Shows Duration
%hook SPTNowPlayingDurationUnitViewModelImplementation
-(BOOL)timeRemainingLabelShowsDuration {
    if(enabled && timeRemainingDuration) {
        return YES;
    }
    return %orig;
}
%end
//Hide Tab Bar
%hook SPTAdaptiveTabBarController
-(void)tabBarHidden:(BOOL)arg {
    if(enabled && hideTabBar) {
        return %orig(YES);
    }
    return %orig;
}
%end
//Show Badges
%hook SPTSidebarItem
-(BOOL)isBadgeDisplayed {
    if(enabled && showBadges) {
        return YES;
    }
    return %orig;
}
%end
//Legacy Premium UI
%hook SPTPremiumDestinationExperimentsImplementation
-(BOOL)shouldShowLegacyPD {
    if(enabled && legacyPD) {
        return YES;
    }
    return %orig;
}
%end

static void loadPrefs()
{
    NSDictionary *prefs = [[NSDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.keaton.spotifly.plist"];
    if(prefs)
    {
        enabled = ( [prefs objectForKey:@"tweakEnabled"] ? [[prefs objectForKey:@"tweakEnabled"] boolValue] : enabled );
        newUI = ( [prefs objectForKey:@"newUI"] ? [[prefs objectForKey:@"newUI"] boolValue] : newUI );
        canvasToggle = ( [prefs objectForKey:@"canvasToggle"] ? [[prefs objectForKey:@"canvasToggle"] boolValue] : canvasToggle );
        lyricsCardToggle = ( [prefs objectForKey:@"lyricsCardToggle"] ? [[prefs objectForKey:@"lyricsCardToggle"] boolValue] : lyricsCardToggle );
        lyricsButtonToggle = ( [prefs objectForKey:@"lyricsButtonToggle"] ? [[prefs objectForKey:@"lyricsButtonToggle"] boolValue] : lyricsButtonToggle );
        canvasTap = ( [prefs objectForKey:@"canvasTap"] ? [[prefs objectForKey:@"canvasTap"] boolValue] : canvasTap );
        importMusic = ( [prefs objectForKey:@"importMusic"] ? [[prefs objectForKey:@"importMusic"] boolValue] : importMusic );
        importSongsFirst = ( [prefs objectForKey:@"importSongsFirst"] ? [[prefs objectForKey:@"importSongsFirst"] boolValue] : importSongsFirst );
        importPlaylistsFirst = ( [prefs objectForKey:@"importPlaylistsFirst"] ? [[prefs objectForKey:@"importPlaylistsFirst"] boolValue] : importPlaylistsFirst );
        importShowDialog = ( [prefs objectForKey:@"importShowDialog"] ? [[prefs objectForKey:@"importShowDialog"] boolValue] : importShowDialog );
        titleTop = ( [prefs objectForKey:@"titleTop"] ? [[prefs objectForKey:@"titleTop"] boolValue] : titleTop );
        titleCenter = ( [prefs objectForKey:@"titleCenter"] ? [[prefs objectForKey:@"titleCenter"] boolValue] : titleCenter );
        quickScroll = ( [prefs objectForKey:@"quickScroll"] ? [[prefs objectForKey:@"quickScroll"] boolValue] : quickScroll );
        albumRecomendations = ( [prefs objectForKey:@"albumRecomendations"] ? [[prefs objectForKey:@"albumRecomendations"] boolValue] : albumRecomendations );
        autoHideDurationLabels = ( [prefs objectForKey:@"autoHideDurationLabels"] ? [[prefs objectForKey:@"autoHideDurationLabels"] boolValue] : autoHideDurationLabels );
        nowPlayingBarImprovements = ( [prefs objectForKey:@"nowPlayingBarImprovements"] ? [[prefs objectForKey:@"nowPlayingBarImprovements"] boolValue] : nowPlayingBarImprovements );
        geniusEnabled = ( [prefs objectForKey:@"geniusEnabled"] ? [[prefs objectForKey:@"geniusEnabled"] boolValue] : geniusEnabled );
        storylineEnabled = ( [prefs objectForKey:@"storylineEnabled"] ? [[prefs objectForKey:@"storylineEnabled"] boolValue] : storylineEnabled );
        voiceSearchEnabled = ( [prefs objectForKey:@"voiceSearchEnabled"] ? [[prefs objectForKey:@"voiceSearchEnabled"] boolValue] : voiceSearchEnabled );
        newVoiceSearch = ( [prefs objectForKey:@"newVoiceSearch"] ? [[prefs objectForKey:@"newVoiceSearch"] boolValue] : newVoiceSearch );
        floatingMic = ( [prefs objectForKey:@"floatingMic"] ? [[prefs objectForKey:@"floatingMic"] boolValue] : floatingMic );
        verifiedEnabled = ( [prefs objectForKey:@"verifiedEnabled"] ? [[prefs objectForKey:@"verifiedEnabled"] boolValue] : verifiedEnabled );
        reportAbuse = ( [prefs objectForKey:@"reportAbuse"] ? [[prefs objectForKey:@"reportAbuse"] boolValue] : reportAbuse );
        trueShuffle = ( [prefs objectForKey:@"trueShuffle"] ? [[prefs objectForKey:@"trueShuffle"] boolValue] : trueShuffle );
        doublePlay = ( [prefs objectForKey:@"doublePlay"] ? [[prefs objectForKey:@"doublePlay"] boolValue] : doublePlay );
        shuffleBadge = ( [prefs objectForKey:@"shuffleBadge"] ? [[prefs objectForKey:@"shuffleBadge"] boolValue] : shuffleBadge );
        bigText = ( [prefs objectForKey:@"bigText"] ? [[prefs objectForKey:@"bigText"] boolValue] : bigText );
        participantsNowPlaying = ( [prefs objectForKey:@"participantsNowPlaying"] ? [[prefs objectForKey:@"participantsNowPlaying"] boolValue] : participantsNowPlaying );
        nowPlayingSwipeDisabled = ( [prefs objectForKey:@"nowPlayingSwipeDisabled"] ? [[prefs objectForKey:@"nowPlayingSwipeDisabled"] boolValue] : nowPlayingSwipeDisabled );
        statusBarAlwaysOn = ( [prefs objectForKey:@"statusBarAlwaysOn"] ? [[prefs objectForKey:@"statusBarAlwaysOn"] boolValue] : statusBarAlwaysOn );
        timeRemainingDuration = ( [prefs objectForKey:@"timeRemainingDuration"] ? [[prefs objectForKey:@"timeRemainingDuration"] boolValue] : timeRemainingDuration );
        canvasEnabled = ( [prefs objectForKey:@"canvasEnabled"] ? [[prefs objectForKey:@"canvasEnabled"] boolValue] : canvasEnabled );
        canvasPlaylist = ( [prefs objectForKey:@"canvasPlaylist"] ? [[prefs objectForKey:@"canvasPlaylist"] boolValue] : canvasPlaylist );
        queueFooter = ( [prefs objectForKey:@"queueFooter"] ? [[prefs objectForKey:@"queueFooter"] boolValue] : queueFooter );
        socialListening = ( [prefs objectForKey:@"socialListening"] ? [[prefs objectForKey:@"socialListening"] boolValue] : socialListening );
        hideTabBar = ( [prefs objectForKey:@"hideTabBar"] ? [[prefs objectForKey:@"hideTabBar"] boolValue] : hideTabBar );
        showBadges = ( [prefs objectForKey:@"showBadges"] ? [[prefs objectForKey:@"showBadges"] boolValue] : showBadges );
        albumControlsTop = ( [prefs objectForKey:@"albumControlsTop"] ? [[prefs objectForKey:@"albumControlsTop"] boolValue] : albumControlsTop );
        durationTop = ( [prefs objectForKey:@"durationTop"] ? [[prefs objectForKey:@"durationTop"] boolValue] : durationTop );
        footerTop = ( [prefs objectForKey:@"footerTop"] ? [[prefs objectForKey:@"footerTop"] boolValue] : footerTop );
        headerTop = ( [prefs objectForKey:@"headerTop"] ? [[prefs objectForKey:@"headerTop"] boolValue] : headerTop );
        connectDevices = ( [prefs objectForKey:@"connectDevices"] ? [[prefs objectForKey:@"connectDevices"] boolValue] : connectDevices );
        bigConnectDevices = ( [prefs objectForKey:@"bigConnectDevices"] ? [[prefs objectForKey:@"bigConnectDevices"] boolValue] : bigConnectDevices );
        hideCreatePlaylist = ( [prefs objectForKey:@"hideCreatePlaylist"] ? [[prefs objectForKey:@"hideCreatePlaylist"] boolValue] : hideCreatePlaylist );
        oldUI = ( [prefs objectForKey:@"oldUI"] ? [[prefs objectForKey:@"oldUI"] boolValue] : oldUI );
        offlineArtist = ( [prefs objectForKey:@"offlineArtist"] ? [[prefs objectForKey:@"offlineArtist"] boolValue] : offlineArtist );
        carModeOn = ( [prefs objectForKey:@"carModeOn"] ? [[prefs objectForKey:@"carModeOn"] boolValue] : carModeOn );
        sleepTimer = ( [prefs objectForKey:@"sleepTimer"] ? [[prefs objectForKey:@"sleepTimer"] boolValue] : sleepTimer );
        followFeedOn = ( [prefs objectForKey:@"followFeedOn"] ? [[prefs objectForKey:@"followFeedOn"] boolValue] : followFeedOn );
        createPlaylistHeader = ( [prefs objectForKey:@"createPlaylistHeader"] ? [[prefs objectForKey:@"createPlaylistHeader"] boolValue] : createPlaylistHeader );
        persistActiveTab = ( [prefs objectForKey:@"persistActiveTab"] ? [[prefs objectForKey:@"persistActiveTab"] boolValue] : persistActiveTab );
        oldVoiceSearch = ( [prefs objectForKey:@"oldVoiceSearch"] ? [[prefs objectForKey:@"oldVoiceSearch"] boolValue] : oldVoiceSearch );
        likeSongHeart = ( [prefs objectForKey:@"likeSongHeart"] ? [[prefs objectForKey:@"likeSongHeart"] boolValue] : likeSongHeart );
        nowPlayingBarVoice = ( [prefs objectForKey:@"nowPlayingBarVoice"] ? [[prefs objectForKey:@"nowPlayingBarVoice"] boolValue] : nowPlayingBarVoice );
        nowPlayingBarArt = ( [prefs objectForKey:@"nowPlayingBarArt"] ? [[prefs objectForKey:@"nowPlayingBarArt"] boolValue] : nowPlayingBarArt );
        signInWithApple = ( [prefs objectForKey:@"signInWithApple"] ? [[prefs objectForKey:@"signInWithApple"] boolValue] : signInWithApple );
        legacyPD = ( [prefs objectForKey:@"legacyPD"] ? [[prefs objectForKey:@"legacyPD"] boolValue] : legacyPD );
        imageSquare = ( [prefs objectForKey:@"imageSquare"] ? [[prefs objectForKey:@"imageSquare"] boolValue] : imageSquare );
        imageCircle = ( [prefs objectForKey:@"imageCircle"] ? [[prefs objectForKey:@"imageCircle"] boolValue] : imageCircle );
        imageRoundedSquare = ( [prefs objectForKey:@"imageRoundedSquare"] ? [[prefs objectForKey:@"imageRoundedSquare"] boolValue] : imageRoundedSquare );
        vocalRemoval = ( [prefs objectForKey:@"vocalRemoval"] ? [[prefs objectForKey:@"vocalRemoval"] boolValue] : vocalRemoval );
        syllableSync = ( [prefs objectForKey:@"syllableSync"] ? [[prefs objectForKey:@"syllableSync"] boolValue] : syllableSync );
        youMightAlsoLike = ( [prefs objectForKey:@"youMightAlsoLike"] ? [[prefs objectForKey:@"youMightAlsoLike"] boolValue] : youMightAlsoLike );
        playlistRecomendations = ( [prefs objectForKey:@"playlistRecomendations"] ? [[prefs objectForKey:@"playlistRecomendations"] boolValue] : playlistRecomendations );
        blackoutMode = ( [prefs objectForKey:@"blackoutMode"] ? [[prefs objectForKey:@"blackoutMode"] boolValue] : blackoutMode );
        homeGradient = ( [prefs objectForKey:@"homeGradient"] ? [[prefs objectForKey:@"homeGradient"] boolValue] : homeGradient );
        albumRecomendationsOff = ( [prefs objectForKey:@"albumRecomendationsOff"] ? [[prefs objectForKey:@"albumRecomendationsOff"] boolValue] : albumRecomendationsOff );
    }
}

%ctor 
{
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.keaton.spotifly/settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
    loadPrefs();

    %init(FollowFeed=objc_getClass("FollowFeedFeatureImpl.RemoteConfigManagerImpl"))
}
