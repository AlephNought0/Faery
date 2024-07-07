{ config, lib, inputs, pkgs, ... }:
let
    inherit (lib) mkEnableOption mkIf;
    inherit (config.faery.system) username;

    cfg = config.faery.programs.vesktop;
    electron-31 = (import inputs.nixpkgs-forked {}).electron_31-bin;
in
{
    options.faery.programs.vesktop = {
        enable = mkEnableOption "Enable Vesktop module.";
    };

    config = mkIf cfg.enable {
        home-manager.users.${username} = {
            home.packages = with pkgs; [
                (vesktop.overrideAttrs (old: {
                    patches = (old.patches or []) ++ [./patchedvesktop.patch];
                }))
            ];

            xdg.configFile."vesktop/settings.json".text = builtins.toJSON {
                minimizeToTray = false;
                discordBranch = "canary";
                firstLaunch = false;
                arRPC = "off";
                splashColor = "rgb(219, 222, 225)";
                splashBackground = "rgba(0, 0, 0, 0)";
                windowBounds = {
                x = 22;
                y = 22;
                width = 1236;
                height = 676;
                };
                transparencyOption = ":3";
                maximized = true;
                minimized = false;
                hardwareAcceleration = true;
            };

            xdg.configFile."vesktop/settings/settings.json".text = builtins.toJSON {
                notifyAboutUpdates = false;
                autoUpdate = false;
                autoUpdateNotification = false;
                useQuickCss = true;
                themeLinks = [];
                enabledThemes = ["./Hehe.css"];
                enableReactDevtools = false;
                frameless = false;
                transparent = true;
                winCtrlQ = false;
                macosTranslucency = false;
                disableMinSize = false;
                winNativeTitleBar = false;
                plugins = {
                BadgeAPI.enabled = true;
                CommandsAPI.enabled = true;
                ContextMenuAPI.enabled = true;
                MemberListDecoratorsAPI.enabled = false;
                MessageAccessoriesAPI.enabled = true;
                MessageDecorationsAPI.enabled = false;
                MessageEventsAPI.enabled = true;
                MessagePopoverAPI.enabled = true;
                NoticesAPI.enabled = true;
                ServerListAPI.enabled = false;
                NoTrack.enabled = true;
                Settings = {
                    enabled = true;
                    settingsLocation = "aboveActivity";
                };
                SupportHelper.enabled = true;
                Translate.enabled = true;
                AlwaysAnimate.enabled = false;
                AlwaysTrust.enabled = false;
                AnonymiseFileNames.enabled = false;
                "WebRichPresence (arRPC)".enabled = true;
                BANger.enabled = false;
                BetterFolders.enabled = false;
                BetterGifAltText.enabled = false;
                BetterNotesBox.enabled = false;
                BetterRoleDot.enabled = false;
                BetterUploadButton.enabled = false;
                BiggerStreamPreview.enabled = false;
                BlurNSFW.enabled = false;
                CallTimer.enabled = false;
                ClearURLs.enabled = false;
                ClientTheme.enabled = false;
                ColorSighted.enabled = false;
                ConsoleShortcuts.enabled = false;
                CopyUserURLs.enabled = true;
                CrashHandler.enabled = true;
                CustomRPC = {
                    enabled = true;
                    type = 0;
                };
                Dearrow.enabled = false;
                DisableDMCallIdle.enabled = true;
                EmoteCloner.enabled = true;
                Experiments = {
                    enabled = true;
                    enableIsStaff = true;
                };
                F8Break.enabled = false;
                FakeNitro = {
                    enabled = true;
                    enableEmojiBypass = true;
                    enableStickerBypass = true;
                    enableStreamQualityBypass = true;
                    transformStickers = true;
                    transformEmojis = true;
                    transformCompoundSentence = false;
                    stickerSize = 160;
                    emojiSize = 48;
                };
                FakeProfileThemes = {
                    enabled = true;
                    nitroFirst = true;
                };
                FavoriteEmojiFirst.enabled = false;
                FavoriteGifSearch.enabled = true;
                FixImagesQuality.enabled = false;
                FixSpotifyEmbeds.enabled = false;
                ForceOwnerCrown.enabled = true;
                FriendInvites.enabled = false;
                GameActivityToggle.enabled = false;
                GifPaste.enabled = false;
                GreetStickerPicker.enabled = false;
                HideAttachments.enabled = false;
                iLoveSpam.enabled = false;
                IgnoreActivities.enabled = false;
                ImageZoom = {
                    enabled = true;
                    saveZoomValues = true;
                    invertScroll = true;
                    nearestNeighbour = false;
                    square = false;
                    zoom = 1;
                    size = 250;
                    zoomSpeed = 0.5;
                };
                InvisibleChat.enabled = false;
                KeepCurrentChannel.enabled = false;
                LastFMRichPresence.enabled = false;
                LoadingQuotes.enabled = false;
                MemberCount.enabled = false;
                MessageClickActions.enabled = true;
                MessageLinkEmbeds.enabled = false;
                MessageLogger.enabled = false;
                MessageTags.enabled = false;
                MoreCommands.enabled = true;
                MoreKaomoji.enabled = true;
                MoreUserTags.enabled = false;
                Moyai.enabled = false;
                MuteNewGuild.enabled = false;
                MutualGroupDMs.enabled = false;
                NoBlockedMessages.enabled = false;
                NoDevtoolsWarning.enabled = false;
                NoF1.enabled = false;
                NoMosaic.enabled = false;
                NoPendingCount.enabled = false;
                NoProfileThemes.enabled = false;
                NoReplyMention = {
                    enabled = true;
                    userList = "372809091208445953";
                    shouldPingListed = false;
                    inverseShiftReply = false;
                };
                NoScreensharePreview.enabled = false;
                NoTypingAnimation.enabled = false;
                NoUnblockToJump.enabled = true;
                NormalizeMessageLinks.enabled = false;
                NSFWGateBypass.enabled = false;
                OnePingPerDM.enabled = true;
                oneko.enabled = false;
                OpenInApp.enabled = false;
                "Party mode 🎉.enabled" = false;
                PermissionFreeWill = {
                    enabled = true;
                    lockout = true;
                    onboarding = true;
                };
                PermissionsViewer = {
                    enabled = true;
                    permissionsSortOrder = 0;
                    defaultPermissionsDropdownState = false;
                };
                petpet.enabled = false;
                PictureInPicture.enabled = false;
                PinDMs.enabled = false;
                PlainFolderIcon.enabled = false;
                PlatformIndicators.enabled = false;
                PreviewMessage.enabled = false;
                PronounDB.enabled = false;
                QuickMention.enabled = false;
                QuickReply.enabled = false;
                ReactErrorDecoder.enabled = false;
                ReadAllNotificationsButton.enabled = false;
                RelationshipNotifier = {
                    enabled = true;
                    offlineRemovals = true;
                    groups = true;
                    servers = true;
                    friends = true;
                    friendRequestCancels = true;
                };
                RevealAllSpoilers.enabled = false;
                ReverseImageSearch.enabled = false;
                RoleColorEverywhere.enabled = false;
                SearchReply.enabled = false;
                SecretRingToneEnabler.enabled = false;
                SendTimestamps.enabled = false;
                ServerListIndicators.enabled = false;
                ServerProfile.enabled = false;
                ShikiCodeblocks.enabled = false;
                ShowAllMessageButtons.enabled = false;
                ShowConnections.enabled = false;
                ShowHiddenChannels = {
                    enabled = true;
                    showMode = 0;
                    hideUnreads = true;
                    defaultAllowedUsersAndRolesDropdownState = true;
                };
                ShowMeYourName.enabled = false;
                ShowTimeouts.enabled = true;
                SilentMessageToggle.enabled = false;
                SilentTyping.enabled = false;
                SortFriendRequests.enabled = false;
                SpotifyControls.enabled = false;
                SpotifyCrack.enabled = false;
                SpotifyShareCommands.enabled = false;
                StartupTimings.enabled = false;
                SuperReactionTweaks.enabled = false;
                TextReplace.enabled = false;
                ThemeAttributes.enabled = false;
                TimeBarAllActivities.enabled = false;
                TypingIndicator = {
                    enabled = true;
                    includeMutedChannels = false;
                };
                TypingTweaks.enabled = false;
                Unindent.enabled = false;
                UnsuppressEmbeds.enabled = false;
                UrbanDictionary.enabled = false;
                UserVoiceShow.enabled = false;
                USRBG.enabled = false;
                ValidUser.enabled = true;
                VoiceChatDoubleClick.enabled = false;
                VcNarrator.enabled = false;
                VencordToolbox.enabled = false;
                ViewIcons.enabled = false;
                ViewRaw.enabled = false;
                VoiceMessages.enabled = true;
                WebContextMenus = {
                    enabled = true;
                    addBack = true;
                };
                WebKeybinds.enabled = true;
                WhoReacted.enabled = false;
                Wikisearch.enabled = false;
                };

                notifications = {
                timeout = 5000;
                position = "bottom-right";
                useNative = "not-focused";
                logLimit = 50;
                };

                cloud = {
                authenticated = false;
                url = "https://api.vencord.dev/";
                settingsSync = false;
                settingsSyncVersion = 1703197249036;
                };
            };
        };
    };
}
