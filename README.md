# itunes-playlist-converter

A script that converts iTunes playlist files (`.m3u`) to WALKMAN playlist files.

This script does the following :

- Change the file encoding from UTF-8-MAC to UTF-8.
- Unify newline codes to `\n`.
- Replace the music file path for WALKMAN.

## Uses

Copy `config.example.yml` to `config.yml` and rewrite `config.yml` settings for your environment.

|Key|Description|Example value|
|:---:|:---:|:---:|
|`src_dir`|The path of the directory where the original playlist file is located.|`src`|
|`dist_dir`|The path of the directory where the converted playlist file will be output.|`dist`|
|`itunes_path`|The path of `iTunes/iTunes Media/Music/` directory. You can check it from iTunes settings.|`/Users/user-name/Music/iTunes/iTunes Media/Music/`|
|`replace_to`|The base path of the directory where the WALKMAN music files. If you copy `iTunes/iTunes Media/Music/` straight to `/MUSIC/Mucic/` in WALKMAN, use the default value.|`/MUSIC/Mucic/`|

Run `convert-playlist.rb` after changing settings.

```bash
ruby convert-playlist.rb
```

Example of execution with the above settings.

Original playlist file. (`src/Favorite.m3u`)

```m3u
#EXTM3U
#EXTINF:265,Song name 1 - Artist name
/Users/user-name/Music/iTunes/iTunes Media/Music/Artist name/Album name/01 Song name 1.m4a
#EXTINF:269,Song name 2 - Artist name
/Users/user-name/Music/iTunes/iTunes Media/Music/Artist name/Album name/02 Song name 2.m4a
#EXTINF:227,Song name 3 - Artist name
/Users/user-name/Music/iTunes/iTunes Media/Music/Artist name/Album name/03 Song name 3.m4a
```

Converted playlist. (`dist/Favorite.m3u`)

```m3u
#EXTM3U
#EXTINF:265,Song name 1 - Artist name
/MUSIC/Music/Artist name/Album name/01 Song name 1.m4a
#EXTINF:269,Song name 2 - Artist name
/MUSIC/Music/Artist name/Album name/02 Song name 2.m4a
#EXTINF:227,Song name 3 - Artist name
/MUSIC/Music/Artist name/Album name/03 Song name 3.m4a
```

## Licence

MIT License
