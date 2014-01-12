---
layout: default
title: Sha1coin
---

# Sha1coin

いつもSha1coinにご協力いただき、ありがとうございます。

<ul>
{% for post in site.posts limit:10 %}
<li>
<a href="/sha1coin{{post.url}}">{{ post.date | date_to_long_string }} : {{ post.title }}</a>
</li>
{% endfor %}
</ul>

## Sha1coinについて

Sha1coinはハッシュ関数としてSHA-1を採用した仮想通貨です。
低速ではありますが、2chのトリップを見つけることもできます。

処理の流れとしてはSHA-1後にbase64化し、12文字の26パターンを抜き出し、それらをすべてSHA-1を行ったあと、XORしています。
この26パターンの処理のときにトリップ検索が行われますので、トリップ/秒はハッシュ/秒の26倍ということになります。

プリマイン・インスタマインを防ぐために最初の10000ブロックの報酬は10分の1の5.00に設定しております。
他のパラメータはLitecoinと同じです。

現在のところ、随所にLitecoinの名残がありますが、そのうち掃除したいと思います。

今のところ 36.2.132.153:9513 でsha1coindを動かしているので、初期ノードとしてお使いください。
ノード数が少なく、ハッシュパワーも少ないのでポートの公開や採掘で協力していただけると助かります。

## ダウンロード

Windows用のクライアントソフト

* [sha1coin-win32-setup-20140111-18.exe] Windows用インストーラ版
* [sha1coin-win32-setup-20140111-18.exe-mirror] Windows用インストーラ版(Mirror)
* [sha1coin-qt-20140111-18.exe] Windows用スタンドアローン版
* [sha1coin-qt-20140111-18.exe-mirror] Windows用スタンドアローン版(Mirror)
* [sha1coind-20140111-18.exe] Windows用コンソール版
* [sha1coind-20140111-18.exe-mirror] Windows用コンソール版(Mirror)

Linux用のクライアントソフト

* [sha1coin-20140111-19.tar.gz] Linux用
* [sha1coin-20140111-19.tar.gz-mirror] Linux用(Mirror)

Mac OSX用のクライアントソフト

* なし
  * 作成する環境を持っていないので、どなたかご協力いただければ助かります。

ソースコード

* [sha1coin]

## 採掘手順

ヘルプ > デバッグウィンドウ > Consoleタブ > setgenerate true[Enter]

* setgenerate false で停止
* setgenerate true 1 でコア数を1に(お好みでコア数を変更してください)

## sha1coin.conf 設定例

    rpcuser=user
    rpcpassword=pass
    addnode=36.2.132.153:9513
    trip=mona

非効率ではありますが、起動直後から採掘する場合はgen=1をつける方法があります。プロセス数はgenproclimitで指定可能です。

    gen=1
    genproclimit=2

効率を求めるなら[sha1coin-cpuminer]を使うか、自作するかしてみてください。

## 2chトリップ検索機能について

sha1coin.confのtripで指定した文字列が発見されると、debug.logに以下のようなログが残ります。

    2014-01-05 04:54:36 tripkey: #ApUVWry4ykk7, trip: monaQdPk/6d2

debug.logは一定時間が経過すると古いものから削除されるのでご注意ください。
debug.logの場所はWindowsの場合、C:\Users\ユーザー名\AppData\Roaming\Sha1coin となります。
Linuxの場合は/home/ユーザー名/.sha1coinです。

## コインの入手方法(準備中)

## 外部の交換所(Exchange)

* [したらば掲示板交換]

## 仕様

PoW以外はほぼLitecoinと同じ。

## 採掘所(Pools)

なし

## ブロック情報(Block explorer)

なし

## Bounties

なし(アイデア募集中)

* 例
  * Mac OSX用のクライアントソフト作成
  * クライアントソフトの日本語化
  * Webウォレットサービス
  * Block Explorer

## Funds

なし(アイデア募集中)

* 例
  * 日本語ブログ記事1つにつき1.0SHA等

## Others

* [したらば掲示板]
* [外部Wiki1]

## ダウンロードについて

このページは開発者のみ編集可能に設定しておりますので、ダウンロードのURLは他の人は改ざんできません。
URLはohacのge.ttとDropboxアカウントを使用しておりますので、こちらも改ざんできませんが、念のためmd5sumを付けておきます。

    55a61d57f60c22677ed7a3dd5806e370 *sha1coin-win32-setup-20140111-18.exe
    52623d350fa82e3cb3dee8215e07bfae *sha1coin-qt-20140111-18.exe
    53595757fe563b8348f6f8b609758cfd *sha1coind-20140111-18.exe
    a12774e919942921d6d1ff49252eafa3 *sha1coin-20140111-19.tar.gz
    f1eb58a3c45c47d5407fd6cf5e3c4576 *sha1coin-20140105-13-win32-setup.exe
    242f14656e82a47ae0fd29cae17f2b1d *sha1coin-20140104-16-win32-setup.exe

## 旧バージョンのダウンロード

* https://dl.dropboxusercontent.com/u/5745602/sha1coin-20140105-13-win32-setup.exe
* https://dl.dropboxusercontent.com/u/5745602/sha1coin-20140104-16-win32-setup.exe

## 寄付

[Donate-SKR], [Donate-SHA], [Donate-MONA]


[Donate-SKR]: sakuracoin:MTu6jrxp5xD6RHWeZUEpw7X5WnpmEzYTkd
[Donate-SHA]: sha1coin:SQqr32xpK6hkmDyJRvPLaLFzqzfjq1Dr6f
[Donate-MONA]: monacoin:MNjFh6TvqYRS2xZMyfEcuKMhiitacKvysY
[Bitmessage]: https://bitmessage.ch/
[Sha1coin]: http://ohac.github.io/sha1coin/
[sha1coin-win32-setup-20140111-18.exe]: http://ge.tt/5Un3BkD1/v/0?c
[sha1coin-win32-setup-20140111-18.exe-mirror]: https://dl.dropboxusercontent.com/u/5745602/sha1coin-win32-setup-20140111-18.exe
[sha1coin-qt-20140111-18.exe]: http://ge.tt/31nu4lD1/v/5?c
[sha1coin-qt-20140111-18.exe-mirror]: https://dl.dropboxusercontent.com/u/5745602/sha1coin-qt-20140111-18.exe
[sha1coind-20140111-18.exe]: http://ge.tt/31nu4lD1/v/1?c
[sha1coind-20140111-18.exe-mirror]: https://dl.dropboxusercontent.com/u/5745602/sha1coind-20140111-18.exe
[sha1coin-20140111-19.tar.gz]: http://ge.tt/47PBBkD1/v/0?c
[sha1coin-20140111-19.tar.gz-mirror]: https://dl.dropboxusercontent.com/u/5745602/sha1coin-20140111-19.tar.gz
[したらば掲示板交換]: http://jbbs.shitaraba.net/bbs/read.cgi/internet/19552/1388817096/l50
[したらば掲示板]: http://jbbs.shitaraba.net/internet/19552/
[外部Wiki1]: http://www59.atwiki.jp/japancryptocurrency/pages/18.html
[sha1coin]: https://github.com/ohac/sha1coin
[sha1coin-cpuminer]: https://github.com/ohac/sha1coin-cpuminer
