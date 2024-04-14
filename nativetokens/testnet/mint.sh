utxoin1="0d9cc680b5e8a6b360a9d36a2406fa238e9bac185bf4d973d331efbcf761fc8f#1"
policyid=$(cat ak_eaCoins.pid)
output="2200000000"
tokenamount="100"
tokenname=$(echo -n "B98aikenToken" | xxd -ps | tr -d '\n')
mintingScript="../artifacts/eacoins.eaCoins.uplc"
collateral="bcf593a50a1b36aaeda2e55aaac8a6f6452db05caba72ec87bcf89080146a670#1"
signerPKH="8b225ceddb05738d7a53bd130136e187a6f0baa4d219161fed4f2ac0"
ownerPKH="6efff2244d9f67a1a383db4a198a10c647408767cdcb0a44845ce15a"
notneeded="--invalid-hereafter 10962786"
PREVIEW="--testnet-magic 2"

cardano-cli transaction build \
  --babbage-era \
  $PREVIEW \
  --tx-in $utxoin1 \
  --required-signer-hash $ownerPKH \
  --required-signer-hash $signerPKH \
  --tx-in-collateral $collateral \
  --tx-out $nami+$output+"$tokenamount $policyid.$tokenname" \
  --change-address $nami \
  --mint "$tokenamount $policyid.$tokenname" \
  --mint-script-file $mintingScript \
  --mint-redeemer-file ./values/redeemer.json \
  --out-file mintTx.body

cardano-cli transaction sign \
    --tx-body-file mintTx.body \
    --signing-key-file ../../wallets/person1.skey \
    --signing-key-file ../../wallets/person1.skey \
    $PREVIEW \
    --out-file mintTx.signed

 # cardano-cli transaction submit \
 #    $PREVIEW \
 #    --tx-file mintTx.signed
