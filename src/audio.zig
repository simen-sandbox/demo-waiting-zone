const rl = @import("raylib");

pub const soundData = @embedFile("music.wav");

pub fn Play() void {
    var audio_data: []const u8 = soundData[0..];

    const music = rl.loadMusicStreamFromMemory("wav", audio_data);
    rl.playMusicStream(music);
}
