function clearString(strInput) {
  var replaceArray = ['--', '='];

  for (var i in replaceArray) {
    strInput = strInput.split(replaceArray[i]).join(' ');
  }
  return strInput.trim();
}
