console.log("Hello world"); // この行が読み込まれた時点で実行される
// 登録ボタンのDOMを取得

function submitFormWitnButton(){
  var btn = document.getElementById("touroku");
  function printHello() {
    console.log("Hello world");
  }
  // 関数内で定義された関数は、関数の中でしか呼び出せないという性質があるだけで、
  // 通常の関数同様に呼び出せる

  btn.addEventListener("click", printHello);
}
window.addEventListener("load", submitFormWitnButton);