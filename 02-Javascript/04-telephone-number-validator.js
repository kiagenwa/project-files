function telephoneCheck(str) {
  let re = /^1?\s?\(?\d{3}[\)-\s]*\d{3}[-\s]*\d{4}$/;
  if (/\(|\)/.test(str) != /\(\d{3}\)/.test(str)) {
    return false;
  }
  return re.test(str);
}

telephoneCheck("555-555-5555");