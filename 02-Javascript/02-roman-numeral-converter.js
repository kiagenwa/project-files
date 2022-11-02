function convertToRoman(num) {
  var tempn = num;
  var rNum = '';
  if (tempn >= 1000) {
    for (let i = 0; i < Math.floor(tempn / 1000); i++) {
      rNum += 'M';
    }
    tempn %= 1000;
  }
  if (tempn >= 900) {
    rNum += 'CM';
    tempn -= 900;
  }
  if (tempn >= 500) {
    rNum += 'D';
    tempn -= 500;
  }
  if (tempn >= 400) {
    rNum += 'CD';
    tempn -= 400;
  }
  if (tempn >= 100) {
    for (let i = 0; i < Math.floor(tempn / 100); i++) {
      rNum += 'C';
    }
    tempn %= 100;
  }
  if (tempn >= 90) {
    rNum += 'XC';
    tempn -= 90;
  }
  if (tempn >= 50) {
    rNum += 'L';
    tempn -= 50;
  }
  if (tempn >= 40) {
    rNum += 'XL';
    tempn -= 40;
  }
  if (tempn >= 10) {
    for (let i = 0; i < Math.floor(tempn / 10); i++) {
      rNum += 'X';
    }
    tempn %= 10;
  }
  if (tempn >= 9) {
    rNum += 'IX';
    tempn -= 9;
  }
  if (tempn >= 5) {
    rNum += 'V';
    tempn -= 5;
  }
  if (tempn >= 4) {
    rNum += 'IV';
    tempn -= 4;
  }
  if (tempn > 0) {
    for (let i = 0; i < tempn; i++) {
      rNum += 'I';
    }
  }
  return rNum;
}

convertToRoman(36);