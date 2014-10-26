stock=$1 

# Fetch from Google Finance API, put into local variables
eval $(curl -s "http://www.google.com/ig/api?stock=$stock"|sed 's/</\n</g' |sed '/data=/!d; s/ data=/=/g; s/\/>/; /g; s/</GF_/g' |tee /tmp/stockprice.tmp.log)

echo "$stock,$(date +%Y-%m-%d),$GF_open,$GF_high,$GF_low,$GF_last,$GF_volume
