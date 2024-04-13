utxoin="0d9cc680b5e8a6b360a9d36a2406fa238e9bac185bf4d973d331efbcf761fc8f#1"
address=$(cat smpl_validator.addr) 
output="5000000"
PREVIEW="--testnet-magic 2"


cardano-cli transaction build \
  --babbage-era \
  $PREVIEW \
  --tx-in $utxoin \
  --tx-out $address+$output \
  --tx-out-datum-hash-file ./values/value22.json \
  --tx-out $Adr01+$output \
  --tx-out $address+$output \
  --tx-out-datum-hash-file ./values/valueBool.json \
  --tx-out $Adr01+$output \
  --tx-out $address+$output \
  --tx-out-datum-hash-file ./values/valueUnit.json \
  --tx-out $Adr01+$output \
  --change-address $Adr01 \
  --out-file give.unsigned

# cardano-cli transaction sign \
#     --tx-body-file give.unsigned \
#     --signing-key-file ../../wallets/person1.skey \
#     $PREVIEW \
#     --out-file give.signed

# cardano-cli transaction submit \
#     $PREVIEW \
#     --tx-file give.signed
