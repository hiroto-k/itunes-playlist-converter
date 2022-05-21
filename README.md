# dap-playlist-converter

iTunes / Music appのプレイリストファイル(.m3u)をDAP向けのプレイリストファイルに変換するスクリプト

このスクリプトでは次の事を行う
- ファイルのエンコーディングをUTF-8-MACからUTF-8に変更
- 改行コードを`\n`に統一
- 音楽ファイルへのパスを置換

## 使い方

`config.example.yml`を`config.yml`にコピーし，環境に合わせて`config.yml`設定を書き換える

|      キー       |             説明              |                          設定例                           |
|:-------------:|:---------------------------:|:------------------------------------------------------:|
|   `src_dir`   | 元のプレイリストファイルが配置されているディレクトリ  |                         `src`                          |
|  `dist_dir`   | 変換されたプレイリストファイルが出力されるディレクトリ |                         `dist`                         |
| `itunes_path` |      音楽ファイルが配置されているパス       | `/Users/user-name/Music/ミュージック/Media.localized/Music/` |
| `replace_to`  |  DAPで音楽ファイルが保存されているディレクトリ   |                    `/MUSIC/Mucic/`                     |

設定を変更した後，convert-playlist.rbを実行する

```bash
ruby convert-playlist.rb
```

上記の設定での実行例。

元のプレイリストファイル (`src/Favorite.m3u`)
```m3u
#EXTM3U
#EXTINF:265,Song name 1 - Artist name
/Users/user-name/Music/ミュージック/Media.localized/Music/Artist name/Album name/01 Song name 1.m4a
#EXTINF:269,Song name 2 - Artist name
/Users/user-name/Music/ミュージック/Media.localized/Music/Artist name/Album name/02 Song name 2.m4a
#EXTINF:227,Song name 3 - Artist name
/Users/user-name/Music/ミュージック/Media.localized/Music/Artist name/Album name/03 Song name 3.m4a
```

変換後のプレイリストファイル. (`dist/Favorite.m3u`)

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

[MIT License](https://github.com/hiroxto/dap-playlist-converter/blob/master/LICENSE)
