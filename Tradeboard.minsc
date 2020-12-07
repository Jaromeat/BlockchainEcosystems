/* 
 * sender gives funds to contract
 * recipient calls contract with their public key and the tradeboard key
 * reipient recieves funds
 */
 
fn AuthenticatedTransaction($recipient_pk, $tradeboardKey) {
 pk($recipient_pk) && hash160($tradeboardKey) 
}

AuthenticatedTransaction(A, H1)

/*
 * sender gives funds to contract
 * recipient can claim funds with their public key and the secret given by sender
 * after the delay, the sender can retrieve their funds if not yet retrieved
 * less gas is used on success than refund
 */
 
fn LockedFunds($sender_pk, $recipient_pk, $secret, $delay) {
  $success = pk($recipient_pk) && hash160($secret);
  $timeout = older($delay);

  likely@$success || (pk(sender_pk) && $timeout)
}

LockedFunds(A, B, H1, 2 hours)
