function rot13(str) {
  let transA =    "NOPQRSTUVWXYZABCDEFGHIJKLM";
  let originalA = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  let newStr = '';
  for (let char in str) {
    //console.log(str[char]);
    if (/[^A-Z]/.test(str[char])){
      newStr += str[char];
    } else {
      newStr += transA[originalA.indexOf(str[char])];
    }
  }
  //console.log(str, newStr);
  return newStr;
}

rot13("SERR PBQR PNZC");