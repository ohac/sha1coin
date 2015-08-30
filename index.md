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

## Sha1coinについて

Sha1coinはハッシュ関数としてSHA-1を採用した仮想通貨です。
低速ではありますが、2chのトリップを見つけることもできます。

処理の流れとしてはSHA-1後にbase64化し、12文字の26パターンを抜き出し、それらをすべてSHA-1を行ったあと、XORしています。
この26パターンの処理のときにトリップ検索が行われますので、トリップ/秒はハッシュ/秒の26倍ということになります。

最初の10000ブロックの報酬は10分の1の5.00に設定しております。
他のパラメータはLitecoinと同じです。

## ダウンロード

[ここからダウンロード]してください。(2014/07/12バージョン)

* Windows用
  * sha1coin-0.8.7.2-win32-setup.exe インストーラ版
  * sha1coin-0.8.7.2-win32.zip スタンドアローン版/コンソール版
* Linux用
  * sha1coin-0.8.7.2-linux.tar.gz
* Mac OSX用
  * なし(作成する環境を持っていないので、どなたかご協力いただければ助かります。)

ソースコードはGitHubのohac/[sha1coin]にあります。

* Android用のソース(開発中)
  * [sha1coin-wallet](https://github.com/ohac/sha1coin-wallet)
  * [sha1coinj](https://github.com/ohac/sha1coinj)

## 変更履歴

* v0.8.7.2
  * 120000ブロックでDigiShield V2に切り替え
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

## 外部の交換所(Exchange)

* [Twitterウォレット] (Ripple内で取引可能)
* [もなとれ](http://vote.monatr.jp/)
* [Japan Scrypt Trade](http://jpnscryptrade.cart.fc2.com/)
* [MonacoEx Beta](https://trade.monaco-ex.org/)

## 仕様

* Algorithm: SHA-1 x 27 + XOR
* Premine: なし
* Block reward: 50 SHA (10000ブロックまでは5 SHAに制限)
* Block time: 2.5 minutes (Litecoinと同じ)
* Retarget: 2016 blocks (~3.5 days) (Litecoinと同じ)
* subsidy halves in 840k blocks (~4 years) (Litecoinと同じ)
* Totalcoins: 83.55 million (Litecoinとほぼ同じ)

## 採掘所(Pools)

* [LA Sha1coin Pool]

## ブロック情報(Block explorer)

* [Abe] Abeは重いのでとりあえずテキストを出すようにしました。

## Others

* [addnode情報](http://seed.sighash.info/) 同期できないときにご確認ください。
* [Webウォレット] (テスト中)
* [Faucet](https://pool.xau.jp/faucet/)

## ダウンロードについて

このページは開発者のみ編集可能に設定しておりますので、ダウンロードのURLは他の人は改ざんできません。
URLはohacのGitHubアカウントを使用しておりますので、こちらも改ざんできませんが、念のためmd5sumを付けておきます。

    ba4fd648a5db401d4ecde21f3b754079  sha1coin-0.8.7.2-win32-setup.exe
    e6667b158768333d52ae0d1461818cb5  sha1coin-0.8.7.2-win32.zip
    f55715f7692382e40f050357a1a72d0c  sha1coin-0.8.7.2-linux.tar.gz

[Sha1coin]: http://ohac.github.io/sha1coin/
[ここからダウンロード]: https://github.com/ohac/sha1coin/releases
[sha1coin]: https://github.com/ohac/sha1coin
[sha1coin-cpuminer]: https://github.com/ohac/sha1coin-cpuminer
[Twitterウォレット]: https://wallet.sighash.info/
[Abe]: http://abe.sighash.info/
[LA Sha1coin Pool]: https://pool.xau.jp/sha1coin/index.php
[Sha1coin対応sgminer]: http://holo-n94.github.io/sph-sgminer/
