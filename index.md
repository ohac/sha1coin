---
layout: default
title: Sha1coin
---

# Sha1coin

<ul>
{% for post in site.posts limit:10 %}
<li>
<a href="{{post.url}}">{{ post.date | date_to_long_string }} : {{ post.title }}</a>
</li>
{% endfor %}
</ul>

## 2014/01/07 20:01 の状態

* ブロックチェインの高さ: 11927ブロック
* ブロックチェイン成長速度: +0.673/分 (ご協力ありがとうございます。)
* 採掘難易度: 0.053522
* 次回採掘難易度変更: 12096ブロック (2016 * 6)
* シードノードへの接続ノード数: 14ノード (ご協力ありがとうございます。)
