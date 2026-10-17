# PulseCut Pro — Android Tablet Non-Linear Video Editor (NLE)

A full-featured native Android tablet video editor built with **Kotlin**, **Jetpack Compose**, **AndroidX Media3**, a custom **C++20 / JNI Cactus Whistle Speech-to-Text Engine**, **Multi-Aspect Ratio Switching**, **Rich Typography & Kinetic Captions**, and **Adobe Premiere Pro Hardware Keyboard Shortcuts**.

## 1. Building the APK on GitHub Actions

This repository includes a pre-configured GitHub Actions workflow at `.github/workflows/build-apk.yml`.

1. Create a new repository on GitHub and push this folder:
   ```bash
   git init
   git add .
   git commit -m "Initial commit: PulseCut Pro Android Tablet NLE"
   git branch -M main
   git remote add origin https://github.com/<your-username>/<your-repo>.git
   git push -u origin main
   ```
2. Open the **Actions** tab in your GitHub repository and select **Build PulseCut Pro Android Tablet APK**.
3. The workflow automatically:
   - Installs JDK 17, Android SDK 34, Android NDK `26.1.10909125`, CMake `3.22.1`, and Gradle `8.7`.
   - Fetches the **16.9 MB `whistle.cact`** speech-to-text model from [Cactus-Compute/whistle on Hugging Face](https://huggingface.co/Cactus-Compute/whistle) and checks for prebuilt `android-arm64` static libraries from `Cactus-Compute/needle3`.
   - Compiles the C++20 JNI audio & speech engine (`libwhistle_jni.so`) across `arm64-v8a`, `armeabi-v7a`, and `x86_64`.
   - Generates both **Debug (`PulseCutPro-Tablet-Debug-APK`)** and **Signed Release (`PulseCutPro-Tablet-Release-APK`)** artifacts ready to download and install on your Android tablet.

## 2. Key Features

### Switchable Aspect Ratio Engine
Switch your sequence canvas and hardware MP4 export dimensions at any time from the top Program Monitor bar or the **Video & Aspect** inspector:
- **16:9 Widescreen** (`1920x1080` / `3840x2160` — YouTube / Landscape Tablet)
- **9:16 Vertical** (`1080x1920` / `2160x3840` — Reels / Shorts / TikTok with automatic Social UI safe-zone overlays)
- **1:1 Square** (`1080x1080` — Carousel / Feed)
- **4:5 Portrait** (`1080x1350` — Social Portrait)
- **21:9 Cinema** (`2560x1080` — Ultrawide Anamorphic)
- **4:3 Classic** (`1440x1080` — Classic Tablet / IMAX)
- **Canvas Fit Modes**: Choose between `Fit (Letterbox)`, `Fill & Crop`, `Blurred Backdrop`, and `Stretch to Canvas`.

### On-Device Captions with Cactus Whistle (`whistle.cact`)
- **Native C++20 Engine (`app/src/main/cpp/`)**: Implements `needle.h` (`needle_load`, `needle_transcribe`, `needle_embed`), 16 kHz mono PCM resampling, 25 ms window / 10 ms hop 80-bin Log-Mel spectrogram front-end (250–3500 Hz), loudness-range Silence Gate, and an **Aho-Corasick Automaton** for custom keyword biasing.
- **7 Supported Languages**: Auto-detect, English (`en`), German (`de`), French (`fr`), Spanish (`es`), Italian (`it`), Dutch (`nl`), and Polish (`pl`).
- **Word-Level Timestamp Alignment**: Aligns every spoken word (`startMs`, `endMs`, `probability`) to power active-word pop, karaoke pill sweeps, click-word-to-seek navigation, and transcript-driven ripple cuts (`✂`).
- **Subtitle Import/Export**: Full `.SRT` (SubRip) and `.VTT` (WebVTT with word-level `<c>` tags) support.

### Rich Text & Kinetic Caption Engine
- **Direct Program Monitor Manipulation**: Tap and drag any text or caption layer directly on the monitor with magnetic center X/Y snap guides, corner scale handles, and rotation gizmos.
- **Full Typography Controls**: Font family (`Inter`, `Montserrat Black`, `Bebas Condensed`, `Playfair Serif`, `JetBrains Mono`, `Studio Script`), weight (`300–900`), size (`16–96 sp`), letter spacing (tracking), line height (leading), casing (`Aa`, `AA`, `aa`, `Title`), and alignment.
- **Multi-Layer Styling**: Solid & linear gradient fills, inner/outer strokes with round joins, adjustable drop shadow/neon glow blur, and rounded background pills/boxes.

### Adobe Premiere Pro Hardware Keyboard Shortcuts

| Key / Combo | Premiere Pro Action | Description |
| :--- | :--- | :--- |
| `Space` | Play / Pause | Starts or pauses timeline playback |
| `J` / `K` / `L` | Shuttle Reverse / Stop / Forward | Multi-press `J` or `L` for `-4x`, `-2x`, `-1x`, `1x`, `2x`, `4x` speed |
| `K + J` / `K + L` | Step 1 Frame Back / Forward | Frame-accurate stepping |
| `←` / `→` (`Shift`: `±5f`) | Nudge Playhead | Steps playhead 1 frame (or 5 frames with `Shift`) |
| `↑` / `↓` | Previous / Next Edit Point | Jumps playhead to nearest clip cut point |
| `V` | Selection Tool | Standard clip selection, move, and edge trim |
| `C` | Razor (Blade) Tool | Splits unlocked clips on click |
| `B` / `N` | Ripple Edit / Rolling Edit | Trims with downstream ripple (`B`) or shared cut roll (`N`) |
| `Y` / `U` | Slip Tool / Slide Tool | Shifts clip source In/Out (`Y`) or slides between neighbors (`U`) |
| `A` | Track Select Forward | Selects all clips at or after the clicked clip |
| `T` | Type Tool | Spawns a new Rich Text layer on Track `T1` |
| `Q` / `W` | Ripple Trim Prev / Next to Playhead | Top/tail ripple trims active clip to playhead |
| `Ctrl + K` | Add Edit (Split) | Splits selected clip (or all tracks with `Shift`) at playhead |
| `I` / `O` / `X` | Mark In / Mark Out / Mark Clip | Sets 3-point editing markers |
| `,` / `.` | Insert / Overwrite | Splices or overwrites active Source Bin clip onto timeline |
| `Shift + Delete` | Ripple Delete | Deletes selected clip(s) and closes timeline gap |
| `=` / `-` / `\` | Zoom In / Out / Fit | Adjusts timeline zoom scale |
| `F2` / `F5` | Cycle Aspect Ratio / Whistle STT | Cycles `16:9`, `9:16`, `1:1`, `4:5`, `21:9`, `4:3` or runs Whistle STT |
| `?` or `Ctrl + /` | Shortcuts Cheat Sheet | Opens the interactive Premiere Pro keymap modal |
