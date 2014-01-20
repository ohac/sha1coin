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

SakuracoinやMonacoinはscryptなのでGPUで採掘する方が効率が良いので、高速なGPUがない場合、CPUしかない場合、GPU採掘のついでに余ったCPUリソースを使いたい、といった場合はSha1coinの採掘がおすすめです。Sha1coinをSakuracoinやMonacoinとトレードすることも交渉次第で可能です。

今のところ 36.2.132.153:9513 でsha1coindを動かしているので、初期ノードとしてお使いください。
ノード数が少なく、ハッシュパワーも少ないのでポートの公開や採掘で協力していただけると助かります。

## ダウンロード

[ここからダウンロード]してください。(2014/01/14 23:00バージョン)
寄付をいただけると私が喜びます。少額でもうれしいです。

[Donate-SKR], [Donate-SHA], [Donate-MONA]

* Windows用
  * sha1coin-win32-setup-20140114-23.exe インストーラ版
  * sha1coin-qt-20140114-23.exe スタンドアローン版
  * sha1coind-20140114-23.exe コンソール版
* Linux用
  * sha1coin-20140114-23.tar.gz
* Mac OSX用
  * なし(作成する環境を持っていないので、どなたかご協力いただければ助かります。)

ソースコードはGitHubのohac/[sha1coin]にあります。

## 変更履歴

* 20140114-23
  * trip= の検索指定がないときに採掘すると異常終了する不具合を修正
* 20140113-16
  * [sha1coin-cpuminer]のコードを取り込み、採掘/トリップ検索速度を向上
  * タスクバーのアイコン修正
  * about.pngを更新(したらば掲示板でいただいたもの)
  * ツールバーのショートカットキーが機能していないので削除
  * インストーラのイメージを修正

## 採掘手順

ヘルプ > デバッグウィンドウ > Consoleタブ > setgenerate true[Enter]

* setgenerate false で停止
* setgenerate true 1 でコア数を1に(お好みでコア数を変更してください)

## sha1coin.conf 設定例

    rpcuser=user
    rpcpassword=pass
    addnode=36.2.132.153:9513
    trip=mona
    shrinkdebugfile=0

起動直後から採掘する場合はgen=1をつける方法があります。プロセス数はgenproclimitで指定可能です。

    gen=1
    genproclimit=2

効率を求めるなら[sha1coin-cpuminer]やcudaminer,cgminerを改造してみてください。

## 2chトリップ検索機能について

sha1coin.confのtripで指定した文字列が発見されると、debug.logに以下のようなログが残ります。

    2014-01-05 04:54:36 tripkey: #ApUVWry4ykk7, trip: monaQdPk/6d2

初期設定ではdebug.logは一定時間が経過すると古いものから削除されるのでご注意ください。sha1coin.confにshrinkdebugfile=0を指定すると削除されなくなります。
debug.logの場所はWindowsの場合、C:\Users\ユーザー名\AppData\Roaming\Sha1coin となります。
Linuxの場合は/home/ユーザー名/.sha1coinです。

今後の予定

* 複数のトリップ検索機能追加([sha1coin-cpuminer]ではすでに開発済み。)
* CPUがアイドル状態のときだけ採掘するオプション
* 検索結果をdebug.logではなく、別のファイルに保存するように変更

## コインの交換方法(準備中)

私がスプレッドありの固定相場で取り引きします。
掲示板、twitter、メールでお問い合わせください。
手持ちのコインはSakuracoin, Monacoin, Sha1coin, TAG, HBN, SRC, QRK, BTCです。

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

* [Webウォレット] (テスト中)
* [したらば掲示板]
* [外部Wiki1]

## その他のコイン

* [Sakuracoin]

## ダウンロードについて

このページは開発者のみ編集可能に設定しておりますので、ダウンロードのURLは他の人は改ざんできません。
URLはohacのge.ttとDropboxアカウントを使用しておりますので、こちらも改ざんできませんが、念のためmd5sumを付けておきます。

    609ef8426b3fd11d9fc8bb8a9d830f5d *sha1coin-win32-setup-20140113-16.exe
    bc26d0a7e12bef157ffc837460f953cb *sha1coin-qt-20140113-16.exe
    8f622b7ce26a5e2b71418ace21237b34 *sha1coind-20140113-16.exe
    979de2a135bd302f87e8dea876998e3e *sha1coin-20140113-16.tar.gz
    d57edc0bcf9da6f1c97616c215e9a8ff *sha1coin-win32-setup-20140112-12.exe
    48a7a78e64b7ef7a2d4f83a923ae2254 *sha1coin-qt-20140112-12.exe
    2decf76ab926558148a3495b5c9d821a *sha1coind-20140112-12.exe
    dbe41e086ca6e4b2ae664dddd6c17515 *sha1coin-20140112-12.tar.gz
    55a61d57f60c22677ed7a3dd5806e370 *sha1coin-win32-setup-20140111-18.exe
    52623d350fa82e3cb3dee8215e07bfae *sha1coin-qt-20140111-18.exe
    53595757fe563b8348f6f8b609758cfd *sha1coind-20140111-18.exe
    a12774e919942921d6d1ff49252eafa3 *sha1coin-20140111-19.tar.gz

## 旧バージョンのダウンロード

* [sha1coin-20140113]
* [sha1coin-win32-setup-20140111-18.exe]
* [sha1coin-qt-20140111-18.exe]
* [sha1coind-20140111-18.exe]
* [sha1coin-20140111-19.tar.gz]

## 寄付

[Donate-SKR], [Donate-SHA], [Donate-MONA]


[Donate-SKR]: sakuracoin:MTu6jrxp5xD6RHWeZUEpw7X5WnpmEzYTkd
[Donate-SHA]: sha1coin:SQqr32xpK6hkmDyJRvPLaLFzqzfjq1Dr6f
[Donate-MONA]: monacoin:MNjFh6TvqYRS2xZMyfEcuKMhiitacKvysY
[Bitmessage]: https://bitmessage.ch/
[Sha1coin]: http://ohac.github.io/sha1coin/
[ここからダウンロード]: http://ge.tt/24MStBE1?c
[sha1coin-20140113]: http://ge.tt/5uQLBwD1?c
[sha1coin-win32-setup-20140112-12.exe]: http://ge.tt/2SxtVoD1/v/0?c
[sha1coin-qt-20140112-12.exe]: http://ge.tt/2SxtVoD1/v/1?c
[sha1coind-20140112-12.exe]: http://ge.tt/2SxtVoD1/v/2?c
[sha1coin-20140112-12.tar.gz]: http://ge.tt/2SxtVoD1/v/3?c
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
[Sakuracoin]: http://ohac.github.io/sakuracoin/
[Webウォレット]: http://coins.asiru.info/index2.html
