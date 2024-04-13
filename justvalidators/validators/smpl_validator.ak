type SmplDatum {
  smplDatum: SmplType,
}

type SmplRedeemer {
  smplRedeemer: SmplType,
}

type SmplType {
  SmplNumber { number: Int }
  SmplBool { yesorno: Bool }
  Unit
}

validator {
  fn smplValidator(
    datum: SmplDatum,
    redeemer: SmplRedeemer,
    _context: Data,
  ) -> Bool {
     when (datum.smplDatum, redeemer.smplRedeemer) is {
      (SmplNumber(a), SmplNumber(b)) -> a == b 
      (SmplBool(a) ,SmplBool(b)) -> a == b 
      (Unit,Unit) -> True
      (_, SmplNumber(n)) -> n == 11
      _ -> False
    }
  }
}

fn isRedeemerValid(redeemer) -> Bool {
  when redeemer is {
    SmplNumber(n) -> n == 11
    _ -> False
  }
}
