function palindrome(str) {
  let strProc = str.trim().toLowerCase();
  strProc = strProc.replace(/[^a-z0-9]/gi, '');
  let len = strProc.length;
  for (let i = 0; i < strProc.length/2; i++){
    if (strProc[i] != strProc[len - i -1]) {
      return false;
    }
  }
  return true;
}

palindrome("eye");