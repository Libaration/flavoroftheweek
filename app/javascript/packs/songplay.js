

function play(song_id,song_video) {
    var song = document.getElementById(song_id);
    var background_video = document.getElementById("bgvid")
    // if (background_video.style.opacity == "0") {
    //     background_video.hidden = false
    // }
    song.muted = false;
    background_video.style.opacity = "0.7";
    background_video.src = (song_video);
    song.play();

}
function stop_playing(song_id) {
    var song = document.getElementById(song_id);
    var background_video = document.getElementById("bgvid")
    background_video.style.opacity = "0";
    // if (background_video.style.opacity == "0") {
    //     background_video.hidden = true
    // }
    song.pause();
    song.currentTime = 0;
}
