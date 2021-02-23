console.log("Hello world"); // この行が読み込まれた時点で実行される
// 登録ボタンのDOMを取得

function submitFormWitnButton(){

  if (document.getElementById("new_post") != null){
    var btn = document.getElementById("new_post");
    function submitForm() {
    console.log("Hello world");
    document.forms.new_wish.submit();
    }
    btn.addEventListener("click", submitForm);
  }

  else if (document.getElementById("edit_post") != null){
    console.log("編集画面です");
    var btn = document.getElementById("edit_post");
    console.log(btn);
    function submitForm() {
    console.log("編集画面です");
    document.forms.edit_wish.submit();
    }
    btn.addEventListener("click", submitForm);
  }

  // 関数内で定義された関数は、関数の中でしか呼び出せないという性質があるだけで、
  // 通常の関数同様に呼び出せる

  
}
window.addEventListener("load", submitFormWitnButton);