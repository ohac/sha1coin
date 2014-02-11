#!/usr/bin/ruby
require 'stringio'
require 'digest/sha2'

def readvarint(fd)
  head = fd.read(1)
  v = head.unpack("C").first
  if v < 0xFD
    [1, v]
  elsif v == 0xFD
    v = fd.read(2).unpack("v").first
    [3, v]
  elsif v == 0xFE
    v = fd.read(4).unpack("V").first
    [5, v]
  else
    v = fd.read(8).unpack("VV")
    [9, v[0] | (v[1] << 32)]
  end
end

def bits2diff(bits)
  max_body = Math.log(0x00ffff)
  scaland = Math.log(256)
  Math.exp(max_body - Math.log(bits & 0x00ffffff) +
      scaland * (0x1d - ((bits & 0xff000000) >> 24)))
end

def decode_script(s)
  u = s.unpack('C*')
  i = 0
  loop do
    op = u[i]
    break unless op
    i += 1
    case op
    when 1..75
      p [:stack, op]
puts 'stack: ' + s[i, op].unpack('H*')[0]
      i += op
    when 118
      d = u[i]
      p [:hash160, d]
      i += 1
    when 136
      p :equalverify
    when 172
      p :checksig
    else
      p [:unknown, op]
exit
    end
  end
end

['sha1coin'].each do |type|
  begin
    days = {}
    File.open("#{ENV['HOME']}/.#{type}/blocks/blk00000.dat", 'rb') do |fd|
      height = 0
      loop do
        magicno = fd.read(4)
        #raise unless magicno == "\xF9\xBE\xB4\xD9" # for bitcoin
        break unless magicno == "\xFB\xC0\xB6\xDB" # for litecoin
        blocksize = fd.read(4).unpack("V").first
        blockheader = fd.read(80)
        version, prev, root, t, bits, n = blockheader.unpack('Va32a32VVV')
        t = Time.at(t)
        size, transactionc = readvarint(fd)
        transactions = fd.read(blocksize - 80 - size)
        days[t.strftime('%Y-%m-%d')] ||= {}
        day = days[t.strftime('%Y-%m-%d')]
        day[:diff] = bits2diff(bits)
        day[:transactionc] ||= 0
        day[:transactionc] += transactionc
        day[:blocks] ||= 0
        day[:blocks] += 1
        day[:height] = height
#p [t, bits2diff(bits), transactionc, height] if transactionc > 0
        height += 1
#break if height > 4
=begin
        File.open('blkhd.tmp', 'w'){|fd|fd.write(blockheader)}
        hash = `./scryptsum < blkhd.tmp`.unpack("H*")[0]
#puts hash

        sio = StringIO.new(transactions)
        txv = sio.read(4).unpack('V')[0]
        _, txic = readvarint(sio)
#offset = 4 + _
        txic.times do |txi|
          txia = sio.read(32).unpack('H*')[0]
          txib = sio.read(4).unpack('H*')[0]
          _, txic = readvarint(sio)
          txid = sio.read(txic)
          txie = sio.read(4)
#txsize = 32 + 4 + _ + txic + 4
#puts 'tx: ' + transactions[offset, txsize].unpack('H*')[0]
#puts 'txid: ' + Digest::SHA256.digest(transactions[offset, txsize]).unpack('H*')[0]
#offset += txsize
puts txi == 0 ? 'CoinBase' : 'Input Script'
p [txia, txib, txid, txie]
          decode_script(txid) if txi != 0
        end
        _, txoc = readvarint(sio)
puts 'Output Scripts'
        txoc.times do |txo|
          txoa = sio.read(8).unpack('Q')[0]
          _, txob = readvarint(sio)
          txoc = sio.read(txob)
p [txoa, txoc]
          decode_script(txoc)
        end
puts sio.read(4).unpack('H*')[0]
puts
=end
      end
    end
    days.each do |day, val|
#p [day, val[:diff]]
diff = val[:diff]
blocks = val[:blocks]
hashrate = diff * 2**32 * blocks / (24 * 60 * 60.0)
puts "%s %4d %9.3f %9.6f" % [day, val[:blocks], hashrate / 1000, diff]
    end
  rescue => e
p [type, e]
raise e
    next
  end
end
