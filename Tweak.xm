#include "Tweak.h"

// Your Library
/*
album artwork in liked songs toggle
album artwork in playlist toggle
*/
//New UI
%hook SPTVISREFFlagsServiceImplementation
-(BOOL)headerEnabled {
    if(enabled && newUI){
        return true;
    }
    return %orig;
}
%end
//Free Tier UI
%hook SPTFreeTierTestManagerImplementation
-(BOOL)isConsolidatedExperienceEnabled {
    if(enabled && freeTierUI) {
        return true;
    }
    return %orig;
}
%end
//Double Play Button Action in Playlists
%hook SPTFreeTierPlaylistTestManagerImplementation
-(BOOL)isDoubleStatePlayButtonEnabled {
    if(enabled && doublePlay) {
        return true;
    }
    return %orig;
}
%end
//New Create Playlist UI
%hook SPTFreeTierCreatePlaylistTestManagerImplementation
-(BOOL)isCreatePlaylistEnabled{
    if(enabled && newPlaylistUI) {
        return true;
    }
    return %orig;
}
%end
//Open Canvas Playlist
%hook SPTCanvasTestManager
-(BOOL)shouldEnableCanvasPlaylist {
    if(enabled && canvasPlaylist) {
        return true;
    }
    return %orig;
}
%end
//True Shuffle
%hook SPTFreeTierTestManagerImplementation
-(BOOL)isWeightedShufflePlayDisabled {
    if(enabled && trueShuffle) {
        return true;
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
        return false;
    }
    return %orig;
}
%end

// Now Playing
//
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
        return true;
    }
    return %orig;
}
%end
//Put Playback Controls at Top
%hook SPTNowPlayingFeedbackHeadUnitViewController
-(NSUInteger)leadingEdge {
    if(enabled && controlsTop) {
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
//Put Footer at Top
-(NSUInteger)leadingEdge {
    if(enabled && footerTop) {
        return 1;
    }
    return %orig;
}
//Auto Hide Duration Labels
%hook SPTNowPlayingInformationUnitViewController
-(BOOL)nowPlayingDurationViewShouldAlwaysShowDurationLabels:(id)arg {
    if(enabled && autoHideDurationLabels) {
        return false;
    }
    return %orig;
}
%end
/*
blackout mode toggle
*/
//Canvas Toggle
%hook SPTCanvasTestManager
-(BOOL)shouldDisplayCanvasToggle {
    if(enabled && canvasToggle) {
        return true;
    }
    return %orig;
}
//Canvas Tap Toggle
-(BOOL)shouldEnableCanvasTap {
    if(enabled && canvasTap) {
        return true;
    }
    return %orig;
}
%end
/*
car view toggle
*/
//Always Show Status Bar
%hook SPTStatusBarToken
-(BOOL)hidden {
    if(enabled && statusBarAlwaysOn) {
        return false;
    }
    return %orig;
}
%end
//Real Time Lyrics
%hook SPTLyricsV2TestManagerImplementation
-(BOOL)isFeatureEnabled {
    if(enabled && rtLyrics) {
        return true;
    }
    return %orig;
}
%end
/*
real time lyrics blakout mode toggle
*/

// Now Playing Annoyances
//Disable Genius
%hook SPTGeniusService
-(BOOL)isTrackGeniusEnabled:(id)arg {
    if(enabled && geniusEnabled) {
        return false;
    }
    return %orig;
}
%end
//Disable Storylines
%hook SPTStorylinesEnabledManager
-(BOOL)storylinesEnabledForTrack:(id)arg {
    if(enabled && storylineEnabled) {
        return false;
    }
    return %orig;
}
%end
//Disable Canvas
%hook SPTCanvasTestManager
-(BOOL)isCanvasEnabled{
    if(enabled && canvasEnabled) {
        return false;
    }
    return %orig;
}
%end
/*
disable screenshot banner toggle
*/
//Disable Queue Screen Controls
%hook SBQueueViewControllerIMplementation
-(BOOL)souldHideFooterViewController {
    if(enabled && queueFooter) {
        return false;
    }
    return %orig;
}
%end
//Disable Social Listening Section
%hook SPTGaiaSocialListeningIntegrationManager
-(BOOL)isSocialDeviceFeatureEnabled {
    if(enabled && socialListening) {
        return false;
    }
    return %orig;
}
%end

// General Tab
//Import Your Music
%hook SPTLocalFilesImportManager
-(BOOL)enabled {
    if(enabled && importMusic) {
        return true;
    }
    return %orig;
}
//Import Songs First
-(BOOL)shouldStartWithSongs {
    if(enabled && importSongsFirst) {
        return true;
    }
    return %orig;
}
//Import Playlists First
-(BOOL)shouldStartWithPlaylists {
    if(enabled && importPlaylistsFirst) {
        return true;
    }
    return %orig;
}
//Import Show Dialog
-(BOOL)shouldShowDialog {
    if(enabled && importShowDialog) {
        return false;
    }
    return %orig;
}
%end
//Voice Search
%hook SPTVoiceTestSearchEnabled
-(BOOL)isVoiceServiceEnabled {
    if(enabled && voiceSearchEnabled) {
        return true;
    }
    return %orig;
}
%end
//New Voice Search
%hook SPTVoiceTestManagerImplementation
-(BOOL)isNewVoiceSearchEnabled {
    if(enabled && newVoiceSearchEnabled) {
        return true;
    }
    return %orig;
}
//Floating Mic Button
-(BOOL)isFloatingMicrophoneEnabled {
    if(enabled && floatingMic) {
        return true;
    }
    return %orig;
}
%end
%hook SPTProfileUserEntity
//Verified Profile Badge
-(BOOL)isVerified {
    if(enabled && verifiedEnabled) {
        return true;
    }
    return %orig;
}
//Report Abuse
-(BOOL)reportAbuseEnabled {
    if(enabled && reportAbuse) {
        return true;
    }
    return %orig;
}
%end
//Old Now Playing Bar
%hook SPTNowPlayingTestManagerImplementation
-(BOOL)isNowPlayingBarImprovementsEnabled {
    if(enabled && nowPlayingBarImprovements) {
        return false;
    }
    return %orig;
}
%end
/*
no burger menu icon on lockscreen toggle
whats new section toggle
*/

// Experimental
//Big Text
%hook GLUELabelStyle
-(BOOL)upperCase {
    if(enabled && bigText) {
        return true;
    }
    return %orig;
}
%end
//Different Artists Recommendations
%hook SPTYourLibraryMusicTestManagerImplementation
-(NSUInteger)artistRecomendationsSource {
    if(enabled && artistRecomendationSource) {
        return 1;
    }
    return %orig;
}
%end
//Show Participants in Now Playing
%hook SPTGaiaSocialListeningIntegrationManager
-(BOOL)shouldShowParticipantsInNowPlayingView {
    if(enabled && participantsNowPlaying) {
        return true;
    }
    return %orig;
}
%end
//Disable Now Playing Swipe Down
%hook SPTNowPlayingViewController
-(BOOL)barViewControllerInteractiveTransitionEnabled:(id)arg {
    if(enabled && nowPlayingSwipeDisabled) {
        return false;
    }
    return %orig;
}
%end
//Time Remaining Shows Duration
%hook SPTNowPlayingDurationUnitViewModelImplementation
-(BOOL)timeRemainingLabelShowsDuration {
    if(enabled && timeRemainingDuration) {
        return true;
    }
    return %orig;
}
%end
//Disable Album and Artists Recommendations
%hook SPTYourLibraryMusicTestManagerImplementation
-(BOOL)isShowAlbumArtistRecommendationsEnabled {
    if(enabled && albumRecommendations) {
        return false;
    }
    return %orig;
}
%end
//Hide Tab Bar
%hook SPTAdaptiveTabController
-(void)tabBarHidden:(BOOL)arg {
    if(enabled && hideTabBar) {
        return true;
    }
    return %orig;
}
%end
//Show Badges
%hook SPTSidebarItem
-(BOOL)isBadgeDisplayed {
    if(enabled && showBadges) {
        return true;
    }
    return %orig;
}
%end
//Not Tested
%hook SPTGaiaVolumeController
-(BOOL)lockScreenVolumeControlsShouldBeActive {
    if(enabled && lockscreenVolume) {
        return true;
    }
    return %orig;
}
-(BOOL)isRemoteVolumeAllowedForDevice:(id)arg {
    if(enabled && remoteVolume) {
        return true;
    }
    return %orig;
}
-(BOOL)disableRemoteVolumePopup {
    if(enabled && remoteVolumePopup) {
        return true;
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
        rtLyrics = ( [prefs objectForKey:@"lyricsToggle"] ? [[prefs objectForKey:@"lyricsToggle"] boolValue] : rtLyrics );
        canvasTap = ( [prefs objectForKey:@"canvasTap"] ? [[prefs objectForKey:@"canvasTap"] boolValue] : canvasTap );
        importMusic = ( [prefs objectForKey:@"importMusic"] ? [[prefs objectForKey:@"importMusic"] boolValue] : importMusic );
        importSongsFirst = ( [prefs objectForKey:@"importSongsFirst"] ? [[prefs objectForKey:@"importSongsFirst"] boolValue] : importSongsFirst );
        importPlaylistsFirst = ( [prefs objectForKey:@"importPlaylistsFirst"] ? [[prefs objectForKey:@"importPlaylistsFirst"] boolValue] : importPlaylistsFirst );
        importShowDialog = ( [prefs objectForKey:@"importShowDialog"] ? [[prefs objectForKey:@"importShowDialog"] boolValue] : importShowDialog );
        titleTop = ( [prefs objectForKey:@"titleTop"] ? [[prefs objectForKey:@"titleTop"] boolValue] : titleTop );
        titleCenter = ( [prefs objectForKey:@"titleCenter"] ? [[prefs objectForKey:@"titleCenter"] boolValue] : titleCenter );
        quickScroll = ( [prefs objectForKey:@"quickScroll"] ? [[prefs objectForKey:@"quickScroll"] boolValue] : quickScroll );
        albumRecommendations = ( [prefs objectForKey:@"albumRecommendations"] ? [[prefs objectForKey:@"albumRecommendations"] boolValue] : albumRecommendations );
        autoHideDurationLabels = ( [prefs objectForKey:@"autoHideDurationLabels"] ? [[prefs objectForKey:@"autoHideDurationLabels"] boolValue] : autoHideDurationLabels );
        artistRecomendationSource = ( [prefs objectForKey:@"artistRecomendationSource"] ? [[prefs objectForKey:@"artistRecomendationSource"] boolValue] : artistRecomendationSource );
        newPlaylistUI = ( [prefs objectForKey:@"newPlaylistUI"] ? [[prefs objectForKey:@"newPlaylistUI"] boolValue] : newPlaylistUI );
        nowPlayingBarImprovements = ( [prefs objectForKey:@"nowPlayingBarImprovements"] ? [[prefs objectForKey:@"nowPlayingBarImprovements"] boolValue] : nowPlayingBarImprovements );
        geniusEnabled = ( [prefs objectForKey:@"geniusEnabled"] ? [[prefs objectForKey:@"geniusEnabled"] boolValue] : geniusEnabled );
        storylineEnabled = ( [prefs objectForKey:@"storylineEnabled"] ? [[prefs objectForKey:@"storylineEnabled"] boolValue] : storylineEnabled );
        voiceSearchEnabled = ( [prefs objectForKey:@"voiceSearchEnabled"] ? [[prefs objectForKey:@"voiceSearchEnabled"] boolValue] : voiceSearchEnabled );
        newVoiceSearchEnabled = ( [prefs objectForKey:@"newVoiceSearchEnabled"] ? [[prefs objectForKey:@"newVoiceSearchEnabled"] boolValue] : newVoiceSearchEnabled );
        floatingMic = ( [prefs objectForKey:@"floatingMic"] ? [[prefs objectForKey:@"floatingMic"] boolValue] : floatingMic );
        verifiedEnabled = ( [prefs objectForKey:@"verifiedEnabled"] ? [[prefs objectForKey:@"verifiedEnabled"] boolValue] : verifiedEnabled );
        reportAbuse = ( [prefs objectForKey:@"reportAbuse"] ? [[prefs objectForKey:@"reportAbuse"] boolValue] : reportAbuse );
        freeTierUI = ( [prefs objectForKey:@"freeTierUI"] ? [[prefs objectForKey:@"freeTierUI"] boolValue] : freeTierUI );
        trueShuffle = ( [prefs objectForKey:@"trueShuffle"] ? [[prefs objectForKey:@"trueShuffle"] boolValue] : trueShuffle );
        doublePlay = ( [prefs objectForKey:@"doublePlay"] ? [[prefs objectForKey:@"doublePlay"] boolValue] : doublePlay );
        shuffleBadge = ( [prefs objectForKey:@"shuffleBadge"] ? [[prefs objectForKey:@"shuffleBadge"] boolValue] : shuffleBadge );
        bigText = ( [prefs objectForKey:@"bigText"] ? [[prefs objectForKey:@"bigText"] boolValue] : bigText );
        participantsNowPlaying = ( [prefs objectForKey:@"participantsNowPlaying"] ? [[prefs objectForKey:@"participantsNowPlaying"] boolValue] : participantsNowPlaying );
        nowPlayingSwipeDisabled = ( [prefs objectForKey:@"nowPlayingSwipeDisabled"] ? [[prefs objectForKey:@"nowPlayingSwipeDisabled"] boolValue] : nowPlayingSwipeDisabled );
        statusBarAlwaysOn = ( [prefs objectForKey:@"statusBarAlwaysOn"] ? [[prefs objectForKey:@"statusBarAlwaysOn"] boolValue] : statusBarAlwaysOn );
        timeRemainingDuration = ( [prefs objectForKey:@"timeRemainingDuration"] ? [[prefs objectForKey:@"timeRemainingDuration"] boolValue] : timeRemainingDuration );
        lockscreenVolume = ( [prefs objectForKey:@"lockscreenVolume"] ? [[prefs objectForKey:@"lockscreenVolume"] boolValue] : lockscreenVolume );
        remoteVolume = ( [prefs objectForKey:@"remoteVolume"] ? [[prefs objectForKey:@"remoteVolume"] boolValue] : remoteVolume );
        remoteVolumePopup = ( [prefs objectForKey:@"remoteVolumePopup"] ? [[prefs objectForKey:@"remoteVolumePopup"] boolValue] : remoteVolumePopup );
        canvasEnabled = ( [prefs objectForKey:@"canvasEnabled"] ? [[prefs objectForKey:@"canvasEnabled"] boolValue] : canvasEnabled );
        canvasPlaylist = ( [prefs objectForKey:@"canvasPlaylist"] ? [[prefs objectForKey:@"canvasPlaylist"] boolValue] : canvasPlaylist );
        queueFooter = ( [prefs objectForKey:@"queueFooter"] ? [[prefs objectForKey:@"queueFooter"] boolValue] : queueFooter );
        socialListening = ( [prefs objectForKey:@"socialListening"] ? [[prefs objectForKey:@"socialListening"] boolValue] : socialListening );
        hideTabBar = ( [prefs objectForKey:@"hideTabBar"] ? [[prefs objectForKey:@"hideTabBar"] boolValue] : hideTabBar );
        showBadges = ( [prefs objectForKey:@"showBadges"] ? [[prefs objectForKey:@"showBadges"] boolValue] : showBadges );
        controlsTop = ( [prefs objectForKey:@"controlsTop"] ? [[prefs objectForKey:@"controlsTop"] boolValue] : controlsTop );
        durationTop = ( [prefs objectForKey:@"durationTop"] ? [[prefs objectForKey:@"durationTop"] boolValue] : durationTop );
        footerTop = ( [prefs objectForKey:@"footerTop"] ? [[prefs objectForKey:@"footerTop"] boolValue] : footerTop );

    }
}

%ctor 
{
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.keaton.spotifly/settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
    loadPrefs();
}