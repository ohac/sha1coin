#!/usr/bin/ruby
# encoding: utf-8
require 'json'
TYPE2CONF = {
  'namecoin' => 'bitcoin',
}
TYPE2PORT = {
  'bitcoin' => 8332,
  'namecoin' => 9332,
  'TagCoin' => 9624,
  'sha1coin' => 9512,
  'sakuracoin' => 9302,
  'monacoin' => 19402,
}
TARGETTYPE = 'sha1coin'

def rpcrequest(rpcuser, password, host, port, req)
  res = `curl -s -u #{rpcuser}:#{password} #{host}:#{port} -d '#{req.to_json}'`
  res.size == 0 ? nil : JSON.parse(res)
end

target = {}

now = Time.now
lines = []

lines << "---"
lines << "layout: default"
lines << ''
lines << "---"
lines << ("# %s の状態" % now.strftime('%Y/%m/%d %H:%M'))

TYPE2PORT.keys.each do |type|
  setting = {}
  begin
    conf = "#{TYPE2CONF[type] or type}.conf"
    rc = File.open("#{ENV['HOME']}/.#{type}/#{conf}", 'r'){|fd|fd.read}
    rc.split.each do |line|
      next if line[0] == '#'
      k, v = line.split('=')
      setting[k] = v
    end
  rescue
    next
  end
  rpcuser = setting['rpcuser'] or ''
  password = setting['rpcpassword'] or ''
  host = 'localhost'
  port = (setting['rpcport'] or TYPE2PORT[type]).to_i

  #req = {"method" => "setgenerate", "params" => [false]}

  req = {"method" => "getinfo"}
  res = rpcrequest(rpcuser, password, host, port, req)
  next unless res

  result = res['result']
  error = res['error']
  id = res['id']

  balance = result["balance"]
  blocks = result["blocks"]
  connections = result["connections"]
  difficulty = result["difficulty"]
  paytxfee = result["paytxfee"]
  mininput = result["mininput"]

  req = {"method" => "getmininginfo"}
  res = rpcrequest(rpcuser, password, host, port, req)
  next unless res

  result = res['result']
  networkhashps = result["networkhashps"] / 1000.0

  lines << ''
  lines << "## %s" % type
  lines << "* ブロックチェインの高さ: %d ブロック" % blocks
  lines << "* ブロックチェインの成長速度: N/A"
  lines << "* 採掘難易度: %.5f" % difficulty
  lines << "* 次回採掘難易度変更: 残り N/A ブロック"
  lines << "* シードノードへの接続ノード数: %d" % connections
  lines << "* ネットワークハッシュ速度: %.5f" % networkhashps
  if TARGETTYPE == type
    target[:blocks] = blocks
    target[:difficulty] = difficulty
    target[:connections] = connections
    target[:networkhashps] = networkhashps
  end
end

lines[2] = "title: %s の状態(B:%d, D:%.5f, C:%d, H:%.5f)" % [
    now.strftime('%H:%M'), target[:blocks], target[:difficulty],
    target[:connections], target[:networkhashps]]

fd = File.open("_posts/%s-Info.md" % now.strftime('%Y-%m-%d-%H'), 'w')
fd.print(lines.join("\n"))
fd.close
