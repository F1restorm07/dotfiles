// ==UserScript==
// @name youtube_ad_block
// @version 0.1
// @match https*://www.youtube.com/*
// ==/UserScript==

// from https://github.com/alisanoelia/yt-block/blob/main/yt-block.js
(function() {
        'use strict';

    function hideAd(element) {
        element.style.display = 'none';
    }

    function hideAds() {
        var adElements = document.querySelectorAll('.ytd-display-ad-renderer, .ytp-ad-module, .video-ads');

        for (var i = 0; i < adElements.length; i++) {
            hideAd(adElements[i]);
        }
    }

    window.addEventListener('load', hideAds);
    window.addEventListener('spfdone', hideAds);
})();
