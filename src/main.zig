const rl = @import("raylib");

pub const soundData = @embedFile("music.mp3");

pub fn main() anyerror!void {
    const screenWidth = 800;
    const screenHeight = 450;

    rl.initAudioDevice();
    defer rl.closeAudioDevice();

    var audio_data: []const u8 = soundData[0..];

    const music = rl.loadMusicStreamFromMemory(".mp3", audio_data);

    rl.playMusicStream(music);
    rl.initWindow(screenWidth, screenHeight, "raylib-zig [core] example - basic window");
    defer rl.closeWindow(); // Close window and OpenGL context
    rl.toggleFullscreen();

    rl.setTargetFPS(60); // Set our demo to run at 60 frames-per-second

    while (!rl.windowShouldClose()) { // Detect window close button or ESC key
        rl.beginDrawing();
        defer rl.endDrawing();
        rl.updateMusicStream(music);
        rl.clearBackground(rl.Color.white);

        rl.drawText("WAITING ZONE", 190, 200, 20, rl.Color.light_gray);
    }
}
