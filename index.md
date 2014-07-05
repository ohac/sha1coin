---
layout: default
title: Sha1coin
---

<div style="position:absolute;top:20;left:400px">
<a href="https://twitter.com/share" class="twitter-share-button" data-via="ohac">Tweet</a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
<div class="fb-like" data-href="http://ohac.github.io/sha1coin" data-layout="button_count" data-action="like" data-show-faces="true" data-share="true"></div>
</div>

# ![sha1coin64](images/sha1coin64.png) Sha1coin

いつもSha1coinにご協力いただき、ありがとうございます。

## Sha1coinについて

Sha1coinはハッシュ関数としてSHA-1を採用した仮想通貨です。
低速ではありますが、2chのトリップを見つけることもできます。

処理の流れとしてはSHA-1後にbase64化し、12文字の26パターンを抜き出し、それらをすべてSHA-1を行ったあと、XORしています。
この26パターンの処理のときにトリップ検索が行われますので、トリップ/秒はハッシュ/秒の26倍ということになります。

プリマイン・インスタマインを防ぐために最初の10000ブロックの報酬は10分の1の5.00に設定しております。
他のパラメータはLitecoinと同じです。

SakuracoinやMonacoinはscryptなのでGPUで採掘する方が効率が良いので、高速なGPUがない場合、CPUしかない場合、GPU採掘のついでに余ったCPUリソースを使いたい、といった場合はSha1coinの採掘がおすすめです。Sha1coinをSakuracoinやMonacoinとトレードすることも交渉次第で可能です。

ノード数が少なく、ハッシュパワーも少ないのでポートの公開や採掘で協力していただけると助かります。

## ダウンロード

[ここからダウンロード]してください。(2014/01/16 18:00バージョン)

* Windows用
  * sha1coin-win32-setup-20140216-18.exe インストーラ版
  * sha1coin-qt-20140216-18.exe スタンドアローン版
  * sha1coind-20140216-18.exe コンソール版
* Linux用
  * sha1coin-20140216-19.tar.gz
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

2014/6/21に[Sha1coin対応sgminer]が公開されました。今後は以下のCPU採掘手順で採掘するのは困難となるかもしれません。ご注意ください。GPUの導入やプールのご利用を検討してください。

ヘルプ > デバッグウィンドウ > Consoleタブ > setgenerate true[Enter]

* setgenerate false で停止
* setgenerate true 1 でコア数を1に(お好みでコア数を変更してください)

## sha1coin.conf 設定例

    rpcuser=user
    rpcpassword=pass
    addnode=36.55.238.28:9513
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

## 外部の交換所(Exchange)

* [Twitterウォレット] (Ripple内で取引可能)
* [もなとれ](http://vote.monatr.jp/)
* [したらば掲示板交換]
* ヤフオクやモナオクでの販売/交換もあるようです。
* 投票中
  * [ICURREX](https://www.icurrex.com/vote) サービス停止中のようです。

## 仕様

* Algorithm: SHA-1 x 27 + XOR
* Premine: なし
* Block reward: 50 SHA (10000ブロックまでは5 SHAに制限)
* Block time: 2.5 minutes (Litecoinと同じ)
* Retarget: 2016 blocks (~3.5 days) (Litecoinと同じ)
* subsidy halves in 840k blocks (~4 years) (Litecoinと同じ)
* Totalcoins: 83.55 million (Litecoinとほぼ同じ)

## 採掘所(Pools)

* [NOMP]
* [LA Sha1coin Pool]
* [LA NOMP pool1]

## ブロック情報(Block explorer)

* [Abe]

## Others

* [addnode情報](http://seed.sighash.info/) 同期できないときにご確認ください。
* [Twitterウォレット]
* [Webウォレット] (テスト中)
* [したらば掲示板]
* [外部Wiki1]
* [コイン寄付ボタン]
* [暗号通貨寄付ウィジェット]
* [CPU用Miner制作] (Windows 64bit用バイナリあり)
* [monagraph]
* [Faucet](https://multi.xau.jp/faucet/)
* [Pool stats](http://pool.xau.jp/stats/)

## その他のコイン

* ![sakuracoin64](images/sakuracoin64.png) [Sakuracoin]

## ダウンロードについて

このページは開発者のみ編集可能に設定しておりますので、ダウンロードのURLは他の人は改ざんできません。
URLはohacのGitHubアカウントを使用しておりますので、こちらも改ざんできませんが、念のためmd5sumを付けておきます。

    458d7642b7b3a3d4ef40ffb6db910b2b *sha1coin-20140216-19.tar.gz
    e27fe5eb5ce7e1bef102861c961c7caf *sha1coind-20140216-18.exe
    3e0dab06ef61b5d18b4bc208c9c72a22 *sha1coin-qt-20140216-18.exe
    35e0d1f75a3d715851b313b10078d71c *sha1coin-win32-setup-20140216-18.exe

## 寄付

<script src="http://coindonationwidget.com/widget/coin.js"></script>
<script>
  CoinWidgetCom.go({
    wallet_address: "MNjFh6TvqYRS2xZMyfEcuKMhiitacKvysY"
    , currency: "monacoin"
    , counter: "count"
    , qrcode: true
    , auto_show: false
    , decimals: 4
    , lbl_button: "寄付する"
    , lbl_address: "以下のアドレスに寄付する:"
    , lbl_count: "回"
    , lbl_amount: "MONA"
  });
</script>
<script>
  CoinWidgetCom.go({
    wallet_address: "MTu6jrxp5xD6RHWeZUEpw7X5WnpmEzYTkd"
    , currency: "sakuracoin"
    , counter: "count"
    , qrcode: true
    , auto_show: false
    , decimals: 4
    , lbl_button: "寄付する"
    , lbl_address: "以下のアドレスに寄付する:"
    , lbl_count: "回"
    , lbl_amount: "SKR"
  });
</script>
<script>
  CoinWidgetCom.go({
    wallet_address: "SQqr32xpK6hkmDyJRvPLaLFzqzfjq1Dr6f"
    , currency: "sha1coin"
    , counter: "count"
    , qrcode: true
    , auto_show: false
    , decimals: 4
    , lbl_button: "寄付する"
    , lbl_address: "以下のアドレスに寄付する:"
    , lbl_count: "回"
    , lbl_amount: "SHA"
  });
</script>
<br>
<br>
<br>
<br>
<br>
<br>
<br>


[Bitmessage]: https://bitmessage.ch/
[Sha1coin]: http://ohac.github.io/sha1coin/
[ここからダウンロード]: https://github.com/ohac/sha1coin/releases
[したらば掲示板交換]: http://jbbs.shitaraba.net/bbs/read.cgi/internet/19552/1388817096/l50
[したらば掲示板]: http://jbbs.shitaraba.net/internet/19552/
[外部Wiki1]: ttp://www59.atwiki.jp/japancryptocurrency/pages/18.html
[sha1coin]: https://github.com/ohac/sha1coin
[sha1coin-cpuminer]: https://github.com/ohac/sha1coin-cpuminer
[Sakuracoin]: http://ohac.github.io/sakuracoin/
[Twitterウォレット]: http://www.sighash.info/
[Webウォレット]: http://coins.asiru.info/index2.html
[コイン寄付ボタン]: http://bitcoinlove.lv9.co/
[Abe]: http://abe.sighash.info/
[暗号通貨寄付ウィジェット]: http://coindonationwidget.com/jp/
[CPU用Miner制作]: http://bitcoinlove.lv9.co/cpucoin.php
[NOMP]: http://nomp.sighash.info/
[monagraph]: http://monagraph.com/
[LA Sha1coin Pool]: http://multi.xau.jp/sha1coin/
[LA NOMP pool1]: http://pool1.xau.jp/
[Sha1coin対応sgminer]: http://holo-n94.github.io/sph-sgminer/
