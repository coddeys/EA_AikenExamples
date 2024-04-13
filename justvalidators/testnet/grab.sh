utxoin="31ecde239ccb71667ac874315aedda524f5cc2a497a168d2601d5134b0f4ba4d#0"
address=$(cat ourWonderfullValidator.addr) 
output="150000000"
collateral="a006070648e9d682ecbfe52cb94179f941d0aa88dbfaa17d9ac1ccfbdab7d23a#1"
signerPKH=$(cat ../../wallets/person1.pkh)

cardano-cli transaction build \
  --babbage-era \
  --testnet-magic 2 \
  $PREVIEW \
  --tx-in $utxoin \
  --tx-in-script-file ./compiled/ak_typeddatum22.uplc \
  --tx-in-datum-file ./values/value22.json \
  --tx-in-redeemer-file ./values/redeemer.json \
  --required-signer-hash $(cat ../../wallets/person1.pkh)  \
  --tx-in-collateral $collateral \
  --tx-out $nami+$output \
  --change-address $nami \
  --out-file grab.unsigned

# cardano-cli transaction sign \
#     --tx-body-file grab.unsigned \
#     --signing-key-file ../../wallets/person1.skey \
#     $PREVIEW \
#     --out-file grab.signed

#  cardano-cli transaction submit \
#     $PREVIEW \
#     --tx-file grab.signed
